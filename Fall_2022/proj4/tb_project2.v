`timescale 1ns/1ns

module tb_project2();

    reg clk;
    reg reset_n;
    wire[31:0] out1;
    wire[31:0] out2; 

    project2_frame my_frame(
        .clk   (clk),
        .reset_n (reset_n),
        .out1  (out1),
        .out2  (out2)
    );

    integer i; 

    initial begin	
        clk = 0;
        reset_n = 1;

        #2 reset_n = 0;
    //	i = 0;
        
        #10 reset_n = 1; 

    end

    always #10  clk = ~clk;
/*
    always @(posedge clk)
    begin 
        // i = i+1;
        // if ((i% 100) == 0) begin  
		begin 
            $display ("i:%d sim_clk=%b KEY=%b rest:%b hex0:%h hex1:%h ledr:%b",i, clk, KEY, reset, HEX0, HEX1, LEDR);
            // please use this results for only test 
            if (HEX0 == 'h01) begin 
             $display ("congratulations! you passed test cases if you are testing test[1-5]");
             end   
         end
          
    end
*/
endmodule
