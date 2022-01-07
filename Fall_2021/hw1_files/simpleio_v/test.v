`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2021 07:08:16 AM
// Design Name: 
// Module Name: test
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


module test( 
    // no I/O for the test bench
    );
    
    
    reg reset;
    reg sim_clk;
    
    // clock periods 
    
    parameter CLK_PERIOD = 10;  // 10 ns = 100 MHZ 
    
    
    // input signals to the test module 
    
    
    
    // testbench signals 
    
     reg in_1; 
     reg in_2; 
     reg in_3;
      

    
    // output signals to the test module 
      wire out_1; 
      wire out_2; 
         
    // module under test 
    
    integer i; 
    
   simpleio mysimpleio(.in_1(in_1), .in_2(in_2), .in_3(in_3), .out_1(out_1), .out_2(out_2)); 
    
    // generate clock and reset 
    initial sim_clk = 1'b0;
    
    always #(CLK_PERIOD/2.0)
        sim_clk = ~sim_clk; 
     
     initial reset = 1'b1; 
     initial i = 0; 
     
     // reset goes inactive after 20 clocks 
     always @(posedge sim_clk) 
        begin 
        i = i+1; 
     
        {in_3, in_2, in_1} = i[2:0];
        
        $monitor(i , " sim_clk=%b, in_1=%b in_2=%b in_3=%b out_1=%b out_2=%b", 
                sim_clk, in_1, in_2, in_3, out_1, out_2); 
        end 
    
endmodule
