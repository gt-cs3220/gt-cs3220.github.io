**Where to submit**: **Canvas**
# CS 3220 Homework#2: Synchronous FIFO 
(3 points) 

Due: Jan 25 (W) 
This is an individual assignment.

In this assignment, you will implement a synchronous FIFO in Verilog.

    $ git clone https://github.com/gt-cs3220/gt-cs3220.github.io.git
    $ cd gt-cs3220.github.io/Spring_2023/

A FIFO is a structure that stores data and handles the input-output in first-in first-out fashion. Important points to note:
 1. All actions synchronized to positive edge of "clk" signal.
 2. "rst_n" is active high
 3. "o_data" always points to the head of the FIFO

Parameters:
 1. FIFO_DEPTH: Depth of the FIFO buffer
 2. DATA_WIDTH: width of the data packets

Input signals:
 1. "push": Read the data from "i_data" and add it to FIFO
 2. "pop" : Remove the data from the head of the FIFO. NOTE: o_data must point to the head at all times. After the "pop" action, it will point to head+1.

Output signals:
 1. "empty": Asserted if the FIFO is empty
 2. "full" : Asserted if the FIFO is full

Critical functionality:
 1. When the FIFO is "full," and another packet is pushed into the FIFO, then FIFO should ignore the packet.
 2. When the FIFO is "empty" and a "pop" signal is sent, ensure that the FIFO signal still says it is empty.

HINT: Use pointers to track the head and tail of the FIFO.

**We have provided the skeleton code for the module (fifo.v).**


NOTE: DO NOT CHANGE THE PORT OR MODULE DEFINITIONS.
Implement functionality for the main buffer structure in the FIFO and functionality for handling all status signals.

**We have provided the testbench code (fifo.cpp).**

Follow instructions from [hw1part2](https://github.com/gt-cs3220/gt-cs3220.github.io/tree/master/Spring_2023/hw1part2) to compile the verilog code, run the testbench and view the waveoforms.

e.g.)
 verilator -Wall --trace --exe --build -cc fifo.v fifo.cpp

**What to submit:**
1. **fifo.v**

**How to test the correctness**: Testbench runs on the verilog module without errors.

**Grading Policy**:

(3 points) If you pass the provided test code.

**Partial grading Policy**: Partial grade points are very limited.

FAQ
[Q] When I compile the files, it generates errors. What should I do?
[A] You need to complete the code. The provided code is incomplete, so it will generate errors

[Q] Can I modify fifo.cpp file?
[A] Yes, you can modify it to add more prints or other test cases

[Q] How can I debug the internal wires?
[A] Please look at the trace to see all wire values in the module.

[Q] Do I need to test other test cases?
[A] We will use the same test case as the provided code.
