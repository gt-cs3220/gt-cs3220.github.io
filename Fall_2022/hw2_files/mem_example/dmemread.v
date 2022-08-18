`timescale 1ns / 1ps

module dmemread(
    clk,
    reset, 
    dat_in,
    wr_adr,
    wr_en,
    dat_out,
    rd_adr
    );
    
    input clk;
    input reset;
    input [15:0] dat_in;
    input [9:0] wr_adr;
    input wr_en;
    output [15:0] dat_out;
    input [9:0] rd_adr; 
 

    reg[15:0] dmem[15:0];   
  initial begin

	 $readmemh("ex1.mem", dmem);
  end
    

    
    reg[15:0] dat_out; 
    
    // --------- Design implementation ----------
    // 
    always @(posedge clk) 
        begin 
  // complete memory access 
        end
    
    endmodule 

