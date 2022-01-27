`timescale 1ns/1ns

module tb_project2(input clk, 
				input reset, 
				input [3:0] KEY);

// reg clk;
// reg reset;
// reg [3:0] KEY;

wire [3:0] HEX0;
wire [3:0] HEX1;
wire [9:0] LEDR;


project2_frame myprj(
	.clk(clk),
	.reset(reset),
	.KEY(KEY),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.LEDR(LEDR)
);

integer i; 

//initial begin	
//	clk = 0;
//	reset = 0;
//	KEY = 4'b1111;
//	//SW = 10'h0;
//	#2 reset = 1;
//	i = 0;
//	#10000 KEY = 0; 
//	#300 KEY = 4'b1111; 
//end

//always #10  clk = ~clk;

   always @(posedge clk)
   begin 
        i = i+1;
        // if ((i% 100) == 0) begin  
		begin 
            $display ("i:%d sim_clk=%b KEY=%b rest:%b hex0:%h hex1:%h ledr:%b",i, clk, KEY, reset, HEX0, HEX1, LEDR);
            // please use this results for only test 
            if (HEX0 == 'h01) begin 
             $display ("congratulations! you passed test cases if you are testing test[1-5]");
             end   
         end 
    end
endmodule
