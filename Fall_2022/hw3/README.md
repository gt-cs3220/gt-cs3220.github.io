Homework #3 Assignment

In this assignments, you will advance your verilog knowledge.  

Please checkout hw3 folder from the github. 

    $ git clone --depth=1 https://github.com/gt-cs3220/gt-cs3220.github.io.git   
    $ cd gt-cs3220.github.io/Fall_2022/hw3


**Task #1**: create a project with bus_example. 

Draw a bus design diagram based on bus_sigs module. 

The correct answer is bus_design.jpg (which is also shown below)

![bus diagram](figs/bus_design.jpg "bus diagram")

Run the testbench to check out the output.

**Task #2**: Extend D-flop with enable and clear signal dflop.v (dflop example folder)

<img src="figs/flop.jpg" width="200">

Note that when clear_n is zero, you should reset the fliflop to zero.

Frame and testing code examples are provided. 

**Task #3**: [Optional] Complete the state machine in simplestate.v (state_example folder)

Please complete the module to have a following state diagram 

![plot](figs/state_diagram_converted.png "state diagram")

A Frame and testing code are provided. 

**Task #4**:  [Optional] Complete the memory example in dmemread.v (mem_example folder)

First, initialize the memory contents using ex1.mem file. 

Read the value from the memory every cycle and write a new contents (old content + 1) to the same memory location.  (only 10 elements are in the memory system)

Every cycle, the memory address is incremented.  

In this design, you are using synchronous design.
