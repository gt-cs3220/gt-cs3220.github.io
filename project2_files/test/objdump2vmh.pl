#!/usr/bin/perl -w
#==========================================================================
# objdump2vmh.pl
 
 #  Copyright (c) 2018 ASCS Laboratory (ASCS Lab/ECE/BU)
 #  Permission is hereby granted, free of charge, to any person obtaining a copy
 #  of this software and associated documentation files (the "Software"), to deal
 #  in the Software without restriction, including without limitation the rights
 #  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 #  copies of the Software, and to permit persons to whom the Software is
 #  furnished to do so, subject to the following conditions:
 #  The above copyright notice and this permission notice shall be included in
 #  all copies or substantial portions of the Software.
 
 #  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 #  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 #  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 #  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 #  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 #  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 #  THE SOFTWARE.
 #


(our $usageMsg = <<'ENDMSG') =~ s/^\#/ /gm;
#
# This script converts the output of objdump into a verlog memory 
# dump format. It assumes that objdump was run with the following
# options:
#
#  --disassemble-all     (to dissasemble all sections)
#  --disassemble-zeroes  (fully dissassemble sequences of zeros)
#
# The --hostreq command line argument can be use to dump a vmh file
# into .mem a format.
# 
ENDMSG

use strict "vars";
use warnings;
no  warnings("once");
use Getopt::Long;

#--------------------------------------------------------------------------
# Command line processing
#--------------------------------------------------------------------------

our %opts;

sub usage()
{

  print "\n";
  print " Usage: objdump2vmh.pl [options] <input-file> <output-file>\n";
  print "\n";
  print " Options:\n";
  print "  --hostreq           use host memory request vmh format\n";
  print "  --help              print this message\n";
  print "  --verbose           enable verbose output\n";
  print "  --brisc          no comments or addressing";
  print "$usageMsg";

  exit();
}

sub processCommandLine()
{

  $opts{"help"}        = 0;
  $opts{"verbose"}     = 0;
  $opts{"hostreq"}     = 0;
  $opts{"brisc"}     = 0;

  Getopt::Long::GetOptions( \%opts, 'help|?', 'verbose', 'hostreq', 'brisc' ) or usage();

  $opts{"fname-in"}  = shift(@ARGV) or usage();
  $opts{"fname-out"} = shift(@ARGV) or usage();

  $opts{"help"} and usage();

}

#--------------------------------------------------------------------------
# Main
#--------------------------------------------------------------------------

sub main()
{

  #------------------------------------------------------------
  # Initialize and setup

  processCommandLine();

  open( FIN,  "<".$opts{"fname-in"} ) 
    or die("Could not open file ".$opts{"fname-in"}." for input!");

  open( FOUT, ">".$opts{"fname-out"} )
    or die("Could not open file ".$opts{"fname-in"}." for output!");

  my $skippedHeader = 0;
  my $currentAddr = 0;
  while ( <FIN> ) {

    # Translate instructions
    if ( $skippedHeader && /^\s*\w+:\s*(\w+)\s*(.*)$/ ) {
      if ( $opts{"hostreq"} ) {
        print FOUT "1_".sprintf("%08x",$currentAddr)."_$1  // $2\n";
    } elsif ($opts{"brisc"}){
        print FOUT "$1"."\n";
    } else {
        print FOUT "$1  // ".sprintf("%08x",$currentAddr)." $2\n";
      }
      $currentAddr += 4;
    }

    # Translate sections and labels
    if ( $skippedHeader && /^\s*(\w+) (<.*>):$/ ) {
      my $old_currentAddr = $currentAddr;
      $currentAddr = hex($1);
      if ( $opts{"hostreq"} ) {        
	  print FOUT "\n".(" "x19)."  // $2\n" ;
      } elsif ($opts{"brisc"}) {
	  for(my $i = $old_currentAddr; $i < $currentAddr; $i=$i+4){
	      print FOUT "00000000\n";
	  }
      } else {
	  my $wordAddrStr = sprintf("%-8x",$currentAddr/4);
	  print FOUT "\n\@$wordAddrStr // $2\n" ;
      }
    }
    
    # Skip over initial couple lines
    if ( /Disassembly of section .text:/ ) {
	$skippedHeader = 1;
    }
    
  }
  
  close( FIN );
  close( FOUT );
  
}

main();
