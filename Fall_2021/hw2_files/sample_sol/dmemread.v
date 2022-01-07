`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2021 08:36:36 PM
// Design Name: 
// Module Name: dmemread
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


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
 

    reg[15:0] dmem[6:0];   
  initial begin

	 $readmemh("ex1.mem", dmem);
  end
    

    
    reg[15:0] dat_out; 
    
    // --------- Design implementation ----------
    // 
    always @(posedge clk) 
        begin 
            if (wr_en)
                dmem[wr_adr] <= dat_in;
             dat_out <= dmem[rd_adr];
        end
    
    endmodule 

