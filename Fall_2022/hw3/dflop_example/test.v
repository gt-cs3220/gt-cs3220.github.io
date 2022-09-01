`timescale 1ns / 1ps

module test();
    reg reset;
    reg sim_clk;
    
    // clock periods     
    parameter CLK_PERIOD = 10;  // 10 ns = 100 MHZ 
    
    // testbench signals 
    
     reg  in_1; 
     reg enable;
     reg clear_n;
     
    
    // output signals to the test module 
      wire  out_1; 
      wire out_2;
      wire out_3; 
         
    // module under test 
    
    integer i; 
    
   simple_dflop mysimple_dflop(.clk(sim_clk), .in_1(in_1), .out_1(out_1));
   
   dflop_n_reset mydflopt_n_reset(.clk(sim_clk), .reset(reset), .in_1(in_1), .out_1(out_2)); 
   
   dflop_en_clr mydflop_en_clr(.clk(sim_clk), .reset(reset), .in_1(in_1), .enable(enable), .clear_n(clear_n), .out_1(out_3)); 
    
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
     
        in_1 = i[2];
        
        enable  = i[4]; 
        
        clear_n = i[3];
        
        if (i == 50) reset = 1; 
        if (i == 55) reset = 0; 
        
          $monitor(i, " sim_clk=%b, reset=%b, in_1=%b out_1=%b out_2=%b out_3=%b  enable=%b clear_n=%b", 
                sim_clk, reset, in_1, out_1, out_2, out_3,  enable, clear_n); 
        end 
    
endmodule
