`timescale 1ns / 1ps
/*
    CS3220 Processor Design Homework 
    Top Module:     Sync FIFO
    Input Data:     Input packet on push
    Output Data:    Output packet on pop
    Timing:         Sequential Logic
    Reset:          Synchronized Reset {Active High Reset}
    Dummy Data:     {DATA_WIDTH{1'b0}}
    Main contributor:  Varun Saxena (vsaxena36@gatech.edu)
   
*/

// Top module 

module fifo #(
    parameter FIFO_DEPTH = 8,
    parameter DATA_WIDTH = 32
) (
    // Timing signals
    input       clk,    // Clock
    input       rst_n,  // Reset 

    // Data signals
    input                        push, pop,  // Input signals
    input [DATA_WIDTH-1:0]       i_data,     // Input data

    // Output signals
    output full, empty,
    output [DATA_WIDTH-1:0]     o_data
);
    /* Add code functionality here */

    always @(posedge clk) begin
        /* Synchronous componenters here */
    end

    /* Combinatorial components here */

endmodule: fifo
