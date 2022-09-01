`timescale 1ns / 1ps

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
    clear_n,
    // output 
    out_1
); 
// port definitions 
input clk; 
input reset; 
input in_1;
input enable; 
input clear_n; 
output out_1;

reg out_1; 

// ---- Design implementation ---- 

always @(posedge clk or posedge reset) 
begin 
  // TODO
end

endmodule 

