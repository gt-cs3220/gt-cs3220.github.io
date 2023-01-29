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
    // Local variables
    reg [FIFO_DEPTH-1:0]    count;  // Count of elements in FIFO
    reg [FIFO_DEPTH-1:0]    head;   // Head pointer
    reg [FIFO_DEPTH-1:0]    tail;   // Tail pointer
    reg [DATA_WIDTH-1:0]    data [FIFO_DEPTH-1:0];  // Data array
    reg [DATA_WIDTH-1:0]    dummy_data; // Dummy data

    // Assign dummy data
    assign dummy_data = {DATA_WIDTH{1'b0}};

    // Assign output signals
    assign full = (count == FIFO_DEPTH);
    assign empty = (count == 0);
    assign o_data = data[tail];

    always @(posedge clk) begin
        /* Synchronous componenters here */
        if (rst_n == 1'b0) begin
            head <= 0;
            tail <= 0;
            count <= 0;
            data <= dummy_data;
        end else begin
            if (push && !full) begin
                head <= head + 1;
                count <= count + 1;
                data[head] <= i_data;
            end else if (pop && !empty) begin
                tail <= tail + 1;
                count <= count - 1;
                data[tail] <= dummy_data;
            end
        end
    end
    /* Combinatorial components here */
    assign full = (count == FIFO_DEPTH);
    assign empty = (count == 0);
    assign o_data = data[tail];

endmodule: fifo
