`timescale 10ns / 1ns

`define CLK_PERIOD 10

module testbench ();    

    // system signals
    reg reset;
    reg sim_clk;
    
    // input signals     
    reg in_1; 
    reg in_2; 
    reg in_3;
    
    // output signals
    wire out_1; 
    wire out_2; 
         
    // module under test    
    design1 my_design (
      .in_1  (in_1), 
      .in_2  (in_2), 
      .in_3  (in_3), 
      .out_1 (out_1), 
      .out_2 (out_2)
    );    
  
    // clock update procedure
    always #(`CLK_PERIOD/2.0)
      sim_clk = ~sim_clk;
     
    // populate inputs
    integer i;
  	always @(posedge sim_clk) begin                  
      i = i + 1;
      {in_3, in_2, in_1} = i[2:0];
    end 
      
  	// initial values
    initial begin
        i       = 0;
      	sim_clk = 1'b0;
        reset   = 1'b1;  		
        #100  $finish;  // terminate execution after 100 ticks
    end

    // display signals
    initial begin
      $monitor("%d: sim_clk=%b, reset=%b, i=%0d, in_1=%b in_2=%b in_3=%b out_1=%b out_2=%b", 
                $time, sim_clk, reset, i, in_1, in_2, in_3, out_1, out_2);        
    end
    
endmodule
