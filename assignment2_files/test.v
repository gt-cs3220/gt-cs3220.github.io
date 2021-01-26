`timescale 1ns / 1ps


module test(

    );



    reg reset;
    reg sim_clk;
    
    // clock periods 
    
    parameter CLK_PERIOD = 10;  // 10 ns = 100 MHZ 

    reg [15:0] dat_in;
    reg [9:0] wr_adr;
    reg wr_en;
    reg rd_en; 
    
    wire [15:0] dat_out;
    wire done; 
    reg [9:0] rd_adr; 
    
    integer i; 
    
    
    bubblesort bubblesort(.clk(sim_clk), .reset(reset), .dat_in(dat_in), .done(done),  .wr_adr(wr_adr), .wr_en(wr_en), .dat_out(dat_out), .rd_en(rd_en), .rd_adr(rd_adr)); 
    
// generate clock and reset 
    initial sim_clk = 1'b0;
    
    always #(CLK_PERIOD/2.0)
        sim_clk = ~sim_clk; 
     
     initial begin 
      reset = 1'b1; 
      i = 0; 
       rd_en = 0; 
       wr_en = 0; 
       rd_adr = 0; 
     // reset goes inactive after 20 clocks 
     
     #20; 
        reset = 0; 
      
      end
    
     always @(posedge sim_clk) 
        begin 
        i = i + 1; 
        if (i > 896)  
            begin 
            rd_en <= 1; 
            rd_adr <= i[3:0];
         end 
         
        $monitor(sim_clk, " sim_clk=%b, done:%b rd_adr:%h wr_adr:%h dat_in:%h dat_out:%h wr_en:%b rd_en:%b", sim_clk, done, rd_adr, wr_adr, dat_in, dat_out, wr_en, rd_en); 
        
       
        end
  
  
  endmodule 
        
         
