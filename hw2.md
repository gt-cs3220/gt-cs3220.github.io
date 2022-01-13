HW #2 Assignments 

(Due : 1/26/22 (W) **6:00 pm EST**)


In this assignments, you will advance your verilog knowledge.  

Please checkout hw2_files folder from the github. 

**What to submit**: No direct submissions for these tasks. Please complete the tasks  for your own benefits and please answer Quiz HW2. The grade will be done only from HW#2 Quiz submission. 

 

**Task #1**: create a project with bus_example. 

Draw a bus design diagram based on bus_sigs module. 
The correct answer is bus_design.jpg (which is also shown below)

![bus diagram](figs/bus_design.jpg "bus diagram")

Test module has 
``` {in_3, in_2, in_1} = i[8:0];```
Answer what this statement is doing.  


The solution diagram is in the folder. 



**Task #2**: Extend D-flop with enable and clear signal dflop.v  (dflop example folder)

<img src="figs/flop.jpg" width="200">



Frame and testing code examples are provided. 



**Task #3**: [Optional] Complete the state machine in  simplestate.v .  (state_example folder)

Please complete the module to have a following state diagram 

![plot](figs/state_diagram_converted.png "state diagram")


A Frame and testing code are provided. 

An example code is in 4.verilog_3.pptx



**Task #4**:  Initialize the memory with test.mem (mem_example folder)

First, initialize the memory contents using ex1.mem file. 

Read the value from the memory every cycle and write a new contents (old content + 1) to the same memory location.  (only 10 elements are in the memory system)

Every cycle, the memory address is incremented.  

In this design, you are using synchronous design. 





An example code is in 4.verilog_3.pptx 

Note: The example verilog codes are mostly from "Verilog by example: a concise introduction for FPGA design" by Blaine C. Readler"

