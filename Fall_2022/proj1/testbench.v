`timescale 1ns / 1ps

module testbench ();

    parameter CLK_PERIOD = 10;  // 10 ns = 100 MHZ 
    
    reg reset;
    reg clk;    
    reg [31:0] cycles;

    reg rd_en; 
    
    wire [15:0] dat_out0;
    wire [15:0] dat_out1;
    wire [15:0] dat_out2;
    wire [15:0] dat_out3;
    wire [15:0] dat_out4;
    wire [15:0] dat_out5;
    wire [15:0] dat_out6;
    wire [15:0] dat_out7;
    wire [15:0] dat_out8;
    wire [15:0] dat_out9;
    
    wire done; 
    
    bubblesort bubblesort(
        .clk(clk), 
        .reset(reset),          
        .rd_en(rd_en), 
        .dat_out0(dat_out0),
        .dat_out1(dat_out1),
        .dat_out2(dat_out2),
        .dat_out3(dat_out3),
        .dat_out4(dat_out4),
        .dat_out5(dat_out5),
        .dat_out6(dat_out6),
        .dat_out7(dat_out7),
        .dat_out8(dat_out8),
        .dat_out9(dat_out9),
        .done(done)
    );
  
    always #(CLK_PERIOD/2.0)
        clk = ~clk; 
     
    initial begin 
        clk    = 1'b0;
        reset  = 1'b1; 
        cycles = 0;
        rd_en  = 0;
    end
    
    always @(posedge clk) begin 
        cycles <= cycles + 1;
        if (cycles == 10)
            reset <= 0;
        if (reset == 0 && done == 1) begin 
            rd_en <= 1; 
        end
        if (rd_en == 1) begin
        	if(dat_out0 != 'h1 
            || dat_out1 != 'h2 
            || dat_out2 != 'h3 
            || dat_out3 != 'h10 
            || dat_out4 != 'h10 
            || dat_out5 != 'h50 
            || dat_out6 != 'h50 
            || dat_out7 != 'h100 
            || dat_out8 != 'h300 
            || dat_out9 != 'h500) begin
              $display("The sorted output is incorrect!");
          end else
              $display("Congradulation it works!");
          $finish;  
        end     
    end
  
    // uncommnent the following line for debugging
  	// initial $monitor($time, ": clk=%b, reset=%b, done:%b rd_en:%b dat_out0:%h dat_out1:%h dat_out2:%h dat_out3:%h dat_out4:%h dat_out5:%h dat_out6:%h dat_out7:%h dat_out8:%h dat_out9:%h", clk, reset, done, rd_en, dat_out0, dat_out1, dat_out2, dat_out3, dat_out4, dat_out5, dat_out6, dat_out7, dat_out8, dat_out9);  

endmodule
