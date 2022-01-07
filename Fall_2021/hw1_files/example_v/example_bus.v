`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 07:05:35 AM
// Design Name: 
// Module Name: example_bus
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
// Intermediate wire signals
//////////////////


module intermed_wire (
    //Inputs
    in_1,
    in_2, 
    in_3, 
    // outputs
    out_1, 
    out_2
);
// port definitions 
input in_1; 
input in_2;
input in_3 ;

output out_1;
output out_2; 

wire intermediate_sig; 
// ---- Design implementation ---- 

assign intermediate_sig = in_1 & in_2; 

assign out_1 = intermediate_sig & in_3; 
assign out_2 = intermediate_sig | in_3; 

endmodule 

