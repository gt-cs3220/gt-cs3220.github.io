`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2021 10:12:44 AM
// Design Name: 
// Module Name: blink
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


module blink(
    output [3:0] led,
    input clk,
  //   input [3:0] btn
    input locked 
    );


  reg[31:0] counter; 

  reg ld_out; 

  wire reset; 
 //  assign reset = btn[3]; 
  assign reset = !locked;    
  assign led = {4{ld_out}};

  always@(posedge clk or posedge reset)begin
  
    if (reset)
        begin
        counter <=0; 
        ld_out <=0; 
        end 
    else begin  
          if (counter < 5000000)  begin
             counter <=counter+1;
          end
          else begin
            counter <=0;        
            ld_out <= !ld_out;          
         end
     end// else 
    end // alwyas 
 
endmodule
    
