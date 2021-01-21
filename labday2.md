Lab day #2 Assignments 

(Due : 2/3/21)



In this assignments, you will advance your verilog knowledge.  

Please checkout labday2_files folder from the github. 

Before you start lab2, please complete lab1 and watch labday2.mp4 videos.  

**What to submit**: a screenshot of final simulation. 

**Grading**: Submit a screenshot of the last tasks that you have completed. 

We won't grade the correctness of tasks. However, we strongly encourage you to complete tasks and ask TAs/instructors during the lab day lecture hours if you face any problems.  

These labday tasks are designed to help your assignment #2. 

 

**Task #1**: create a project with bus_example. 

Draw a bus design diagram based on bus_sigs module. 
The correct answer is bus_design.png

Test module has 
``` {in_3, in_2, in_1} = i[8:0];```
Answer what this statement is doing.  

(you don't need to submit the answer)

The solution diagram is in the folder. 



**Task #2**: Extend D-flop with enable and clear signal  (dflop example folder)

Frame and testing code are provided. 

A solution is also included . 



**Task #3**: [Optional] Complete the state machine.  (state_example folder)

Please complet the module to have a following state diagram ![plot](state_diagram.pdf)



A Frame and testing code are provided. 

A solution is also included. 



**Task #4**:  Initialize the memory with test.mem (mem_example folder)

First, initialize the memory contents using test.mem file. 

For the first 10 cycles read the contents of memory. Every cycle the memory address is incremented. 

For the second 10 cycles, write values into a memory. Every cycle the memory address is incremented. 

For the third 10 cycles, read the new contents for the memory. 







Note: The example verilog codes are mostly from "Verilog by example: a concise introduction for FPGA design" by Blaine C. Readler"

