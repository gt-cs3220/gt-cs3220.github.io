
module design1 (
    //Inputs
    input wire in_1,
    input wire in_2, 
    input wire in_3, 
    // outputs
    output wire out_1, 
    output wire out_2
);

// implement your design

wire intermediate_sig; 

assign intermediate_sig = in_1 & in_2; 

assign out_1 = intermediate_sig & in_3; 
assign out_2 = intermediate_sig | in_3; 

endmodule 
