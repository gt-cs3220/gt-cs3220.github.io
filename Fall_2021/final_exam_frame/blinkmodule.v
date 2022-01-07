`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 01:11:43 PM
// Design Name: 
// Module Name: add_test
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

`define BL0 4'b0000
`define BL1 4'b0101
`define BL2 4'b1010 
`define BL3 4'b0101
`define BL4 4'b1100
`define BL5 4'b0011 
    

    
  module blink(
    output [3:0] led,
    output [31:0] out1,
    output [31:0] out2,
    input [31:0] in1, 
    input in1_valid, 
    input [31:0] in2,
    input in2_valid,  
    input clk,
    input reset
    );


  reg[63:0] counter; 
  reg [3:0] led_out; 
  reg [3:0] state; 
  
     
   reg[31:0] out1_val; 
   reg[31:0] out2_val; 

  assign led = led_out; 



  always@(posedge clk or negedge reset)
  begin
  
    if (!reset)
        begin
        counter <=0; 
        led_out[0] <= 1; 
        end 
    else begin  
   
        if (counter < 10000000)  begin
           counter <=counter+1;
        end
        
        else begin
            counter <=0; 
            if (state < 2) 
                state<=state+1; 
            else 
                state <= 0; 
                  if (state == 0) begin  
                      led_out = `BL0; 
                  end 
                  else if (state == 1)begin  
                      led_out = `BL1; 
                   end 
            end 
            
            
         end 

    end // alwyas 
   

 
   
   always @(posedge clk or negedge reset) begin 
   
   if (!reset) begin 

        out2_val = 1'b0; 
   end 
   else  
     begin 
     
     	out1_val = in1; 
     	out2_val = in2;      

   end 
end    

    assign out1 = out1_val; 
    assign out2 = out2_val; 
    

    
    
endmodule