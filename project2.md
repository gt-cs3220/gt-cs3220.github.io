# CS3220 Assignment #2 : Pipeline Design 

**Due dates**: 

**Part 1**: 2/18/2022 (F) 6 pm  (5 pts)

**Part 2**: 2/25/2021 (F) 6 pm  (10 points)

**Part 3**: 3/2/2021 (F) 6 pm (10 points) 

This is a two-member group project. 


**Description**:
In this assignment, you will design a RISC-V 5-stage pipelined processor using
verilog. The ISA is a subset of RISC-V ISA. We will use <a href="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/project2_files/ece5745-tinyrv-isa.txt"> Tiny RISC-V version from Cornell </a>  In part-1, you only need to implement *addi, add, beq* instruction to pass all 5 test cases in test/part1/test[1-5].mem file. (a subset of TinyRV1). In part-2, you will add more instructions to test a subset of test suites. 
In part-3: you will complete TinyRV2 except CSR related instructions. You might add CSR instructions (CSRR, CSRW) in the later projects. 
In project #2, you can use a <a href="https://www.veripool.org/verilator/">  verilator </a>  which is a faster way to debug your code. Verilator is a tool to simulate verilog code w/o synthesization or w/o xilinix vivado tool. However, it follows the verilog behavior and it provides more useful warning/error messages. Most importantly, verilator is much faster to simulate than Xilinix vivado behavior simulation. In order to use verilator, you can install verilator in your machine or you can use the ICE cluster. We will go back to Vivado in project #3 to load the design into FPGA. 
In this design, you don't need to implement data forwarding in this part. 
The starting PC address is 0x200. 


## Part 1 : pass 5 test cases 
For part #1, you will implement a subset of pipeline. You  only need to pass 5 tests we create. Please see the test cases for the part-1 requirements. You can locate those test files under the tests directory. You can refer to the README file under tests for more information about each test case. 

You do not need to implement forwarding in this assignment. Your program should run with test[1-5].mem file.  


**What to submit**:
** A zip file of your source code. The zip file must contain the following:**
type ```make submmit``` will generate a submission.zip. 
Please submit the submission.zip file. Each submission for each group. 
If you don't use Makefile, please execute the following command.  ```zip submission.zip ./*.v ./*.h ./*.vh ./sim_main.cpp ./Makefile ```  and submit submission.zip file. We strongly encourage for you to use Make submmit command to generate the submission file so that it won't break our autograding script.  


**Grading**: 
Grading scheme: 
if you pass both test4 & test 5, you will get 5. 
No other partial grading. 

**Late submission**: 
If you fail part-1 but if you submit part-2, we will use part-2 for part-1 regrading. 
In that case, you will get 50% of part-1. 


***Please do not procrastinate.*** 

## Part 2: Pass a subset of RISC-V test suites 
In this part, you will add more instructions in your pipeline to test RISC-V ISA. 
You need to pass the test cases in part-2 test suites. T We will provide RISC-V test suite modified for our ISA to test your design. Testing all the test suits is for your debugging purpose. he test suite will be released soon. 

**What to submit**:
** A zip file of your source code. The zip file must contain the following:**
type ```make submmit``` will generate a submission.zip. 
Please submit the submission.zip file. Each submission for each group. 
Please do not manually generate a zip file since that will likely break the autograding script.  Instead use make submmit command to generate the submission.zip file. Breaking autograding script due to wrong directory structures/missing files might deduct 5% of your score. 

**Grading:** 
Based on the coverage of part-2 test suites, you will get partial scores. 
If you cover all part-2 test suites, you will get 10. 

**Late submission**: 
If you fail part-2 but if you submit part-3, we will use part-3 for part-2 regrading. 
In that case, you will get 50% of part-2.  


## Part 3: Complete the pipeline 
**Description**: 
In this part, you will complete the pipeline to test RISC-V ISA (except CSR instructions).  Your program should run with testall3.mem case we provide. For project-2, we will evaluate your design with only behavioral simulation.  

**Grading:** If you pass testall3.mem (you need to see "Pass" ) you will get 10 pts.
If you don't pass testall3.mem, you will get a partial grading based on the coverage of part 3 test suites. 
 

**What to submit**:
** A zip file of your source code. The zip file must contain the following:**
type ```make submmit``` will generate a submission.zip. 
Please submit the submission.zip file. Each submission for each group. 
Please do not manually generate a zip file since that will likely break the autograding script.  Instead use make submmit command to generate the submission.zip file. Breaking autograding script due to wrong directory structures/missing files might deduct 5% of your score. 

**Late submission**: 
If you fail to complete part-3 but if you succesfully submit project #3, we will  give 50% of project #2. 

**Note: Project 2, 3, and 4**

Project #3 and Project #4 are based on project #2 part-3 (aka a complete tiny RISC-V pipeline). w/o completing project #2 part-3, you cannot proceed project # 3 and project #4. 
Hence, to encourage to complete project #2, we allow late submissions. 
In summary, for project #2, if you fail to complete them on due dates, but if you finish all successfully by project #3's deadline along with project #3, you will get 50% of the entire project #2.  


## Useful Information

**References**

<a href="https://riscvasm.lucasteske.dev/#"> RISC-V Assembly code  </a> 
<a href="https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/"> RISC-V emulator </a> 
<a href="https://verilator.org/guide/latest/"> Verilator manual  </a> 
<a href="http://gtkwave.sourceforge.net/gtkwave.pdf"> GTKWave manual</a> 


**Installing Verilator**

*MAC*
1) Install <a href="https://brew.sh/"> HomeBrew </a> if you do not have it  
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2) Run `brew update`

3) Run `brew upgrade`

4) Run `brew install verilator` 

*Linux/WSL*
1) Run `apt-get install verilator` 

2) If any issues arise, install <a href="https://verilator.org/guide/latest/install.html#install-prerequisites"> prerequisites </a> that are missing

**FAQ)**



Q) How do I run a specific test file? 
A) Please see "VX_define.vh"  
 // [NOTICE] please note that both imem and dmem use the SAME "IDMEMINITFILE".
  // you need to change this line to change which test file to read 
  `define IDMEMINITFILE  "test1.mem"
 
You need to change "test1.mem" into "test2.mem" etc. 

(Q) How do I know whether my implementation is correct or not? 
(A) If you are using verilator, you would see "Pass" message. If you are using vivado only, please check last_WB_vale[3] that should be 1. (all test cases set gp(x3) value as 1 if the test case success) 

(Q) Can I add new files? 
(A) Yes, but please make sure they are added in the zip file. 

(Q) Do we need to implement a branch predictor? 
(A) It's not required but you could implement an always not-taken branch predictor. 


Q)Do we need to create a stack for nested JAL instructions? 
A) The hardware does not know any nested calls. so you do not need to implement it. 


Q) BEQ t1, t1, imm : if a branch is taken, is the new PC = PC + imm or new PC = PC + 4+ imm? 
A) The answer is PC = PC + offset. Please be careful with converting imm to offset. 


Q) How to insert a bubble in the pipeline?
A) You could have a valid bit for each pipeline latch to indicate
whether the contents in the latch is valid or not. Or you could insert
zeros to all latch contents. This is your implementation decision.



Q) Do we need to worry whether  we should prevent all writes to the zero register and treat it as always zero, or if that is solely up to us dependent on our design? 
A) This is purely S/W job. The H/W doesn't have to check whether x0 is writable or not. The Hardware also doesn't have explicitly insert 0 in hardware. 



Q) Debugging takes so much time. Any tips to reduce the debugging time? 
A) Some suggestions. 
a. Review code carefully and understand the ISA behavior correctly 
b. Verilator is faster to debug 
c. Verilator provides an interface to access the verilog data structures. Please see under #ifdef DPRITF ...   in sim_main.cpp. and wb_stage.v to see an example of passing the contents of pipeline into c++ and use printf to debug. 

d. Verilator generates vcd file. Please use GTKWave or other waveform viewer (Microsoft VSC provides trace viewer) to see each pipeline signal. 



Q)  Is the immediate field inside assembly code decimal?
A) If the number starts with 0x, it's hexadecimal .

Q)When we access the memory, why we drop out LSB 2 bits? 

A) ISA is byteaddressability but the verilog imem/dmem is declared as if it is word addressability since we don't do any unaligned accesses. Hence, we simply drop out lower two bits. 
 Please note that, you don't need to do anything to support that 
The frame already includes the code to ignore the lower 2 bits. 
  ```assign inst_FE = imem[PC_FE_latch[`IMEMADDRBITS-1:`IMEMWORDBITS]]; ```
```dmem[memaddr_MEM[`DMEMADDRBITS-1:`DMEMWORDBITS]]; ``` 

Q) What does ``` ```assign inst_FE = imem[PC_FE_latch[`IMEMADDRBITS-1:`IMEMWORDBITS]];''' mean?
A) PC_FE_latch contains PC value. again imem and dmem are worda addressible. so we don't need LSB 2 bits. Since imem and dmem has only 2^14 size, we just use addrr [15:2] bits to index imem/dmem.  

Q) I want to generate more test cases. Do we have an assembler? 

A) If you want to generate more test cases, you can write sample assembly code using the following online <a href="https://riscvasm.lucasteske.dev/#"> assembler </a>. 
Once you get the hexdump value, copy paste the contents into one of the test files starting from line 129. The reason is that the starting PC address is 0x200 (512). Each line in the  mem (or hex) file contains 4B. readmemh function will read one line at a time and put 4B to four consective memory addresses. RISC-V is byte addressable but the readmemh (or imem in the vivado tool chain)' interface is for word-address. So each line is 4B. So we have to insert 128 (512/2) line number of 0s. Please make it sure there is a "carriage-return" at the end of the file. The last line won't get read. 
An easy debug option is put dummy instructions just like the current examples  file contain them 
(00000004
00000008 
0000000a 
00000010
00000014) 


Q)  I'm not sure how to understand Part-2 test code. 
A) The test in part-2 is modified code from RISC-V test suite. It uses macro function to generate test code. 



Q) How do I know what is the correct instruction/code behavior? 
A) 
you can probably use  RISC-V interpreter or other RISC-V machien to execute the code. One example is <a href ="https://www.cs.cornell.edu/courses/cs3410/2019sp/riscv/interpreter/" >  here </a> 

Q) How do I know whether I pass the code or not? 
A) For part-1, we provide test code. Your code should print out "Pass" message if you are using verilator. If you are using only vivado, the last_WB_vale[3] should be 1. Please see project2_vivado_check.mp4 at canvas for a demo vidoe. 

Q) My frame does not load any instruction. Do I need to change anything? 
A) The provided frame should load the first instruction correctly. If you don't see any instruction, please check whether the contents of imem. For vivado, you can see the contents of imem (please see hw4_fileload.mp4). If you are using verilator, FE_stage.v has the code to print out the imem contents. (https://github.com/gt-cs3220/gt-cs3220.github.io/blob/403908bbb61c6892f030ecd9a915ee8634c6f0ca/project2_files/fe_stage.v#L24) 

Q) I get the error "%Warning-LATCH: de_stage.v:120:1: Latch inferred for signal 'my_DE_stage.type_I_DE' (not all control paths of combinational always assign a value)" when running `make` with Verilator.\
A) You can disable the Verilator linter by adding the comment `/* verilator lint_off LATCH */` on the line before the warning. 