`timescale 1ns / 1ps

module testbench();

    reg reset;
    reg sim_clk;
    
    // clock periods 
    
    parameter CLK_PERIOD = 10;  // 10 ns = 100 MHZ 

    reg [15:0] dat_in;
    reg [9:0] wr_adr;
    reg wr_en;
    
    wire [15:0] dat_out;
    
    reg [9:0] rd_adr; 
    
    integer i; 
    
    
    dmemread mydmemread(.clk(sim_clk), .reset(reset), .dat_in(dat_in), .wr_adr(wr_adr), .wr_en(wr_en), .dat_out(dat_out), .rd_adr(rd_adr)); 
    
// generate clock and reset 
    initial sim_clk = 1'b0;
    
    always #(CLK_PERIOD/2.0)
        sim_clk = ~sim_clk; 
     
     initial begin 
      reset = 1'b1; 
        i = 0; 
     
     // reset goes inactive after 20 clocks 
     
     #20; 
        reset = 0; 
      
      end
    
     always @(posedge sim_clk) 
        begin 
        i = i + 1; 
        rd_adr = i[1:0];
        if ((i>16) && (i<32) ) 
             wr_en = 1; 
         wr_adr = i[1:0];
         dat_in = i[15:0];
         
         
        $display(" sim_clk=%b, rd_addr:%h wr_adr:%h dat_in:%h dat_out:%h wr_en:%b", sim_clk, rd_adr, wr_adr, dat_in, dat_out, wr_en); 
        
       
        end
  
  
  endmodule 
        
         
