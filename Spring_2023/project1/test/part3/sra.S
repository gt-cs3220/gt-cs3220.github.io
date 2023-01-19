# See LICENSE for license details.

#*****************************************************************************
# sra.S
#-----------------------------------------------------------------------------
#
# Test sra instruction.
#

#include "riscv_test.h"
#include "test_macros.h"


RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2, sra, 0x0001ffff, 0x7fffffff, 14 );
  TEST_RR_OP( 3, sra, 0x00000000, 0x7fffffff, 31 );


  # Verify that shifts only use bottom six(rv64) or five(rv32) bits

  TEST_RR_OP( 4, sra, 0x81818181, 0x81818181, 0xffffffc0 );
  TEST_RR_OP( 5, sra, 0xc0c0c0c0, 0x81818181, 0xffffffc1 );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC12_EQ_DEST( 6, sra, 0, 7 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 7, 0, sra, 0xff000000, 0x80000000, 7  );
  TEST_RR_SRC12_BYPASS( 8, 0, 0, sra, 0xff000000, 0x80000000, 7  );
  TEST_RR_SRC21_BYPASS( 9, 0, 0, sra, 0xff000000, 0x80000000, 7  );
  TEST_RR_ZEROSRC1( 10, sra, 0, 15 );
  TEST_RR_ZEROSRC2( 11, sra, 32, 32 );
  TEST_RR_ZEROSRC12( 12, sra, 0 );
  TEST_RR_ZERODEST( 13, sra, 1024, 2048 );

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
