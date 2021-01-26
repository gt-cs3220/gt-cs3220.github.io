`timescale 1ns / 1ps


module bubblesort(
    clk,
    reset, 
    done, 
    wr_adr,
    wr_en,
    dat_in,
    rd_en, 
    rd_adr,
    dat_out
    );
    
    input clk;
    input reset;
    input [15:0] dat_in;
    input [9:0] wr_adr;
    input wr_en;
    input rd_en;
    output [15:0] dat_out;
    output done; 
    input [9:0] rd_adr; 
 
    parameter NumItm=10 ;

    reg[15:0] dmem[9:0];   
    
    
    initial begin

	 $readmemh("ex1.mem", dmem);
     end
    

    
    // --------- Design implementation ----------
    // 
    always @(posedge clk or posedge reset) 
    begin
   
    end // always 
    
    endmodule 

