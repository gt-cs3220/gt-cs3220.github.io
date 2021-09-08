# CS3220 Assignment #2: Pipeline Design 

**Due dates**: 

**Part 1**: 9/25/2021 (F) 6 pm  (5 pts)

**Part 2**: 10/8/2021 (F) 6 pm  (10 points)

This is a two-member group project. 


**Description**:
In this assignment, you will design a pipelined processor using verilog. We will still evaluate your assignments with only behavioral simulation. Please note that you will synthesize the code in project #3, so please avoid using any high-level c-style code like for loops. 

## Part 1 : pass 5 test cases 
For part #1, you will implement a subset of pipeline. You  only need to pass 5 tests we create. Please see the test cases for the part-1 requirements. You can locate those test files under tests directory. You can refer to the README file under tests for more information about each test case. 

You do not need to implement forwarding in this assignment. Your program should run with test[1-5].mem file.  


**Grading**: 
Grading scheme: 

if pass test5: 5 pts 
else if you pass test[1-4]: 3 pts 
else if you pass any of test[1-4]: 2 pts 

**Late submission**: 
If you finish part-2 on time w/o correctly finishing part-1, you will get 2 pts. 


## Part 2: Complete the pipeline  

**Description**: 
In this part, you will complete the entire ISA. Your program should run with testall.mem case we provide. You don't need to implement data forwarding in this part. 




**Grading**:

It should pass testall.mem file in behavior simulation. In this design, we will only ask you to check the behavior behavior correctness. In the next project, you will generate bitstreams and test your code on FPGA. Hence, it is good to check whether your code is being synthesized or not. 

If it does not pass testall.mem file, there is no partial grading. Only for this assignment, we will accept a late submission with a penalty. 

**Late submission**: If you can submit the successful design of pipeline by project #3 deadline, you will receive 8 pts out of 15 pts in total including part-1, regardless of part-1's score. 

**Incorrect/Incomplete/Missing File(s) Submissions : 5% deducted**

**What to submit**:
**[1] A zip file of your source code. The zip file must contain the following:**

* agex_stage.v
* de_stage.v
* fe_stage.v
* mem_stage.v
* wb_stage.v
* project3_frame.v
* VX_define.vh

**[2] A zip file of your Vivado project directory. **
<img src=pr_dir.png>

**FAQ)**

Q) How do I run a specific test file? 
A) Please see "VX_define.vh" line 22.
 // [NOTICE] please note that both imem and dmem use the SAME "IDMEMINITFILE".
  // you need to change this line to change which test file to read 
  `define IDMEMINITFILE  "test1.mem"
 
You need to change "test1.mem" into "test2.mem" etc. 






Q) How to generate mem file ?

A) Use [assembler.py] to convert your assembly code into mif file format. And then use [miftomem.py].

Note:
testall.mem do not cover all corner cases.


Q)Do we need to create a stack for nested JAL instructions? 
A) The hardware does not know any nested calls. so you do not need to implement it. 


Q) Br r1, r2, imm : if a branch is taken, is the new PC = PC + imm or new PC = PC + 4+ imm? 
A) The answer is new PC = PC + 4 + 4 * 4 sxt (imm)

Q) Do we need to worry whether  we should prevent all writes to the zero register and treat it as always zero, or if that is solely up to us dependent on our design? 
A) This is purely S/W job. The H/W doesn't have to check whether R0 is writable or not. The Hardware also doesn't have explicitly insert 0 in hardware. 



Q) Debugging takes so much time. Any tips to reduce the debugging time? 
A) Some suggestions. 
a. Please review the code carefully and reduce the number of simulations. check # of bits. check every place whether signals are defined and used correctly.
Can't emphasize how important to review the code multiple times before running the simulation.
b. understand the ISA behavior correctly and understand the exact behavior of assembly code before starting debugging.
c. hex values can be displayed with decimals in the wave forms.
d. do not add too many signals to display in the waveform. Too many signals will slow down the simulation dramatically.
e. you could change the top module and forward the signals to the testbench and use $display, $monitor to printout the values every cycle. but you have to change the top module interface back to the original form before submitting your assignment.

**Few tips**
1) ADDI,ANDI, ORI, XORI,  the destination register argument is in the second, unlike the rest of ALU operations.
e.g.) ADDI S2, A0, 4 ;  A0 = S2+4
On the other hand ADD, S2, A0, A1 ; S2 = A0 + A1
2) Please do not use R10 for registers since JMP uses R10.
3) When you access the data, please increment the memory addresses by 4 since the data is word-aligned.
4) Assembler is the minimum job of generating an assembly code. Please review the code to check for any syntax errors.




**What to submit.*:




***Please do not procrastinate.*** 

