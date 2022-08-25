
module design2 (
    //Inputs
    input wire in_1,
    input wire in_2, 
    input wire in_3, 
    // outputs
    output wire out_1, 
    output wire out_2
);

// implement your design 

assign out_1 = in_1 & in_2 & in_3; 
assign out_2 = in_1 | in_2 | in_3; 

endmodule 
