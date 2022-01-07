`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2021 10:37:17 PM
// Design Name: 
// Module Name: simplestate
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


module simplestate(
        clk, 
        reset, 
        go,
        done,
    );
    input clk;
    input reset; 
    input go; 
    output done; 
    
    reg [3:0] count; 
    reg [1:0] state_reg;
    reg done;  
    
    parameter idle = 2'b00;
    parameter active = 2'b10; 
    parameter finish = 2'b11; 
    
    // modifying state_reg 
    always @(posedge clk or posedge reset) begin 
        if (reset) 
            state_reg <= idle;       
        else 
           case (state_reg)
            idle: 
                if (go)
                    state_reg <= active; 
            active: 
                if (count == 2'b11) 
                state_reg <= done; 
             done:
                state_reg <= idle; 
             default: 
                state_reg <= idle; 
            endcase
       end
     //modifying counter 
     
     always @(posedge clk or posedge reset) 
     begin 
        if (reset) 
            count <= 0; 
         else if ((state_reg == done ) || (state_reg == idle)) 
            count <= 0; 
         else if (state_reg == active)
            count <= count + 1; 
     end 
     
     always @(posedge clk or posedge reset) 
     begin 
        if (reset) 
        done <= 1'b0;
        else if (state_reg == finish) 
        done <= 1'b1;
        else 
        done <= 1'b0;
     end
        

endmodule
