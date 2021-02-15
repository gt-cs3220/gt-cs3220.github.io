`timescale 1ns/1ns

module tb_project3();

reg CLOCK_50;
reg RESET_N;
reg [3:0] KEY;

wire [6:0] HEX0;
wire [6:0] HEX1;
wire [9:0] LEDR;


project3_frame myprj(
	.CLOCK_50(CLOCK_50),
	.RESET_N(RESET_N),
	.KEY(KEY),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.LEDR(LEDR)
);

integer i; 

initial begin	
	CLOCK_50 = 0;
	RESET_N = 0;
	KEY = 4'h0;
	//SW = 10'h0;
	#2 RESET_N = 1;
	i = 0;
	#10000 KEY = 1; 
	#300 KEY = 0 ; 
end

always #10  CLOCK_50 = ~CLOCK_50;

   always @(posedge CLOCK_50)
   begin 
        i = i+1;
        if (!(i% 100)) begin  
            $display ("i:%d sim_clk=%b KEY=%b rest:%b hex0:%h hex1:%h ledr:%b",i, CLOCK_50, KEY, RESET_N, HEX0, HEX1, LEDR);
            // please use this results for only test 
            if (HEX0 == 'h01) begin 
             $display ("congratulations! you passed test cases if you are testing test[1-5]");
             end   
         end 
    end
endmodule
