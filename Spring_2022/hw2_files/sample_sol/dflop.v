`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2021 04:39:44 PM
// Design Name: 
// Module Name: dflop
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

///////////////////////
// Simple D-flop
//////////////////


module simple_dflop (
    // input 
    clk, 
    in_1, 
    // output 
    out_1
); 
// port definitions 
input clk; 
input in_1;
output out_1;

reg out_1; 

// ---- Design implementation ---- 

always @(posedge clk) 
begin 
    out_1 <= in_1; 
end 

endmodule 



///////////////////////
// D-flop with reset 
//////////////////


module dflop_n_reset (
    // input 
    clk, 
    reset, 
    in_1, 
    // output 
    out_1
); 
// port definitions 
input clk; 
input reset; 
input in_1;
output out_1;

reg out_1; 

// ---- Design implementation ---- 

always @(posedge clk or posedge reset) 
begin 
    if (reset) 
        out_1 <= 1'b0; 
    else 
        out_1 <= in_1; 
    end 
endmodule 


///////////////////////
// D-flop with enable and clear 
//////////////////


module dflop_en_clr ( 
    // input 
    clk, 
    reset, 
    in_1, 
    enable, 
    clear,
    // output 
    out_1
); 
// port definitions 
input clk; 
input reset; 
input in_1;
input enable; 
input clear; 
output out_1;

reg out_1; 

// ---- Design implementation ---- 

always @(posedge clk or posedge reset) 
begin 
    if (reset) 
        out_1 <= 1'b0; 
    else if (clear == 1'b0)
        out_1 <= 1'b0; 
    else if (enable)
        out_1 <= in_1; 
    end 
endmodule 

