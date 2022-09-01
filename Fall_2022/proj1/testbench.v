`timescale 1ns / 1ps

module testbench ();

    parameter CLK_PERIOD = 10;  // 10 ns = 100 MHZ 
    
    reg reset;
    reg sim_clk;    

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
    
    integer i;
     
    bubblesort bubblesort(
        .clk(sim_clk), 
        .reset(reset),  
        .done(done),  
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
        .dat_out9(dat_out9)
    );


    // generate clock and reset 
    initial sim_clk = 1'b0;
    
    always #(CLK_PERIOD/2.0)
        sim_clk = ~sim_clk; 
     
    initial begin 
        reset = 1'b1; 
        i = 0;
        rd_en = 0;
        
        #20; //  reset goes inactive after 20 clocks 
        reset = 0;

        #280
        $display("Bubblesort test start");
        #540
        #40
        if(dat_out9 != 'h500) begin
            $display("Something wrong happened");
            $finish;
        end
        #480
        #40
        if(dat_out8 != 'h300) begin
            $display("Something wrong happened");
            $finish;
        end
        #420
        #40
        if(dat_out7 != 'h100) begin
            $display("Something wrong happened");
            $finish;
        end
        #360
        #40
        if(dat_out6 != 'h50) begin
            $display("Something wrong happened");
            $finish;
        end
        #300
        #40
        if(dat_out5 != 'h50) begin
            $display("Something wrong happened");
            $finish;
        end
        #240
        #40
        if(dat_out4 != 'h10) begin
            $display("Something wrong happened");
            $finish;
        end
        #180
        #40
        if(dat_out3 != 'h10) begin
            $display("Something wrong happened");
            $finish;
        end
        #120
        #40
        if(dat_out2 != 'h3) begin
            $display("Something wrong happened");
            $finish;
        end
        #60
        #40
        if(dat_out1 != 'h2) begin
            $display("Something wrong happened");
            $finish;
        end
        #10
        #40
        if(dat_out0 != 'h1) begin
            $display("Something wrong happened");
            $finish;
        end
        #20
        if(dat_out0 != 'h1 || dat_out1 != 'h2 || dat_out2 != 'h3 || dat_out3 != 'h10 || dat_out4 != 'h10 || dat_out5 != 'h50 || dat_out6 != 'h50 || dat_out7 != 'h100 || dat_out8 != 'h300 || dat_out9 != 'h500) begin
            $display("You didn't finish sorting on time");
            $finish;
        end
        $display("Congradulation it works !!!!");
        $finish;
    end
    
    always @(posedge sim_clk) begin 
        i = i + 1; 
        if (i > 29) begin 
            rd_en <= 1; 
        end
        // uncommnent the following line for debugging  
        //$monitor(sim_clk, " sim_clk=%b, done:%b rd_en:%b dat_out0:%h dat_out1:%h dat_out2:%h dat_out3:%h dat_out4:%h dat_out5:%h dat_out6:%h dat_out7:%h dat_out8:%h dat_out9:%h", sim_clk, done, rd_en, dat_out0, dat_out1, dat_out2, dat_out3, dat_out4, dat_out5, dat_out6, dat_out7, dat_out8, dat_out9);  
    end

endmodule
