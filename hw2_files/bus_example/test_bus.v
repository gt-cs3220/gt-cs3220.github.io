`timescale 1ns / 1ps

module test( 
    // no I/O for the test bench
    );
    
    
    reg reset;
    reg sim_clk;
    
      // clock periods 
    
    parameter CLK_PERIOD = 10;  // 10 ns = 100 MHZ 
    
    
    // input signals to the test module 
    
    reg [3:0] in_1; 
    reg [3:0] in_2; 
    reg  in_3; 
    
    wire [3:0] out_1; 
    // testbench signals 

    
    integer i; 

    bus_sigs my_bus_sigs(.in_1(in_1), .in_2(in_2), .in_3(in_3), .out_1(out_1));
    
    // generate clock and reset 
    initial sim_clk = 1'b0;
    
    always #(CLK_PERIOD/2.0)
        sim_clk = ~sim_clk; 
     
     initial begin 
      reset = 1'b1; 
        i = 0;
     // reset goes inactive after 20 clocks
     #20; 
        reset = 0; 
      end
      
     always @(posedge sim_clk) 
        begin 
        i = i+1; 
     
        {in_3, in_2, in_1} = i[8:0];
        
        
        $monitor(i , " sim_clk=%b, in_1=%b in_2=%b in_3=%b out_1=%b ", 
                sim_clk, in_1,in_2, in_3, out_1); 
        end 
    
endmodule

