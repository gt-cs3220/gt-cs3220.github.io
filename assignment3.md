# CS3220 Assignment #3: Pipeline Design 

**Due dates**: 

**Part 1**  : 2/19/201 (F) 6 pm  ( 5 points)

**Part 2** : 3/5/2021 (F) 6 pm  (15 points)

**Part 3** : 3/10/2021 (F) 6 pm  (10 points)

Total:  30 points of out of the total grade. 



## Part 1 : pass 5 test cases 

This is a two-member group project. Please discuss this with the instructor if you do not have a partner. 

**Description**:

In this assignment, you will design a pipelined processor using verilog. 

For part #1, you need to pass 5 tests we create. You can locate those test files under project3/tests directory. You can refer to the README file under project3/tests for more information about each test case. 

You do not implement forwarding in this assignment. Your program should run with test#.mif file.  With a simple pipeline, you should still get the required performance.

If your design does not show the correct outcome, you will not get any credit.

 

**What to submit**:

[1] project3.zip (including all files under this directory).

You and your partner should submit the same version of the zip file.

Please download your submitted file and verify whether your zip file contains all the files and runs correctly. If your verilog design is missing, we will contact you to get missing files but each time we contact you, you will lose 5%.

 

Please make it sure your code is running "tests/test5.mif" and submit the compiled version of test5.mif 

We will test your pre-compiled sof file (test5)'s output so please make it sure the zip file contains it. 

 

[2] Report: You don't need to support a report for Part 1. You will submit a report for Part 2. 

 

***Please do not procrastinate.\*** You will not get any credit if your design does not produce the final value. 



## Part 2: Complete the pipeline 

**Description**: 

In this part, you will complete the entire ISA. Your program should run with two new test cases we provide. You don't need to implement data forwarding in this part.

 

**To run with board**:

Copy the file to the tests folder.

 

**To run simulation**:

You need to copy test file to directory simulation > modelsim > tests.

 

**Test output**:

**test**: All LEDR lights should be turned on and HEX should display FFFFFF.

**fmedian2**: Your design should execute fmedian2 less than 100 sec and output correct median value. 

 

**Grading**:

To get a full credit, your design need to execute fmedian2.asm and output correct median value in 100 seconds or less. If your design does not show the correct outcome, you will not get any credit. We won't check test.mif output, but your program should run with test.mif file as well.  

 

**What to submit**:

[1] project3.zip (including fmedian2.mif and all other files).

You and your partner should submit the same version of the zip file.

Please download your submitted file and verify whether your zip file contains all the files and runs correctly. It must contain fmedian2.mif. If your verilog design is missing, we will contact you to get missing files but each time we contact you, you will lose 5%.

 

[2] Report: You must submit your **own version** of your report. (**Report.pdf**) Please submit a pdf file. Do not include the pdf file in a zip file. You should write a report independently (your partner will write his/her own report) and submit it. The report should include

​     \- Design options and approaches that you have taken

​     \- Problems/issues and how you solved

​     \- Pipeline design diagram. These diagrams can be shared with your partner. (any modifications from assignment #1?, part #1. you can use the same diagram if you haven't changed. ) 

​     \- Contribution to the project.: What you have done and what percentage your contribution is.

Your report might be 1 page excluding diagrams.



## Part 3: Add hardware performance counters 

**Description:** 

In this assignment, you will add the following hardware performance counters. 

1. the number of instructions  (NumInst)
2. the number of branch instructions  (NumBr)
3. the number of taken branches  (NumTakenBr)
4. the number of memory instructions  (NumMem)



Each of the hardware performance counters are stored in the specified hardware performance register files. The hardware performance register file should be initialized and should be reset. 

All the hardware performance counters are incremetned when an instruction is completed. 

