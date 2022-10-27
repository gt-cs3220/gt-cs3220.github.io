 `include "define.vh" 

module project2_frame (
  input        clk,
  input        reset_n,
  output[31:0] out1, 
  output[31:0] out2 
);

  pipeline my_cpu (
    .clk   (clk),
    .reset (~reset_n),
    .out1  (out1),
    .out2  (out2)
  );

endmodule









