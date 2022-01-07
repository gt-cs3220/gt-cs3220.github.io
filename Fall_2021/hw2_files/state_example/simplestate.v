`timescale 1ns / 1ps


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

// complete the code 

endmodule
