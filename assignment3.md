# CS3220 Assignment #3: Pipeline Design 

**Due dates**: 

**Part 1**  : 3/3/201 (F) 6 pm  ( 5 points)

**Part 2** : 3/17/2021 (F) 6 pm  (15 points)

**Part 3** : 3/31/2021 (F) 6 pm  (10 points)

Total:  30 points of out of the total grade. 



## Part 1 : pass 5 test cases 

This is a two-member group project. Please discuss this with the instructor if you do not have a partner. 

**Description**:

In this assignment, you will design a pipelined processor using verilog. 

For part #1, you need to pass 5 tests we create. You can locate those test files under project3/tests directory. You can refer to the README file under project3/tests for more information about each test case. 

You do not implement forwarding in this assignment. Your program should run with test#.hex file.  

If your design does not show the correct outcome, you will not get any credit.

 

**What to submit**:

[1] project3.zip (including all files under this directory).

You and your partner should submit the same version of the zip file.

Please download your submitted file and verify whether your zip file contains all the files and runs correctly. If your verilog design is missing, we will contact you to get missing files but each time we contact you, you will lose 5%.

 

Please make it sure your code is running "tests/test5.hex" and submit the compiled version of test5.hex 

 Grading: 

 First 4 test cases will count for 0.5 point and test 5 will count for 3 points. 
 If your design does not pass synthesization and implementation, you will get only 50% of your score. 
 

[2] Report: You don't need to support a report for Part 1. You will submit a report for Part 2. 

 

***Please do not procrastinate.\*** You will not get any credit if your design does not produce the final value. 



## Part 2: Complete the pipeline and hardware performance counters 

**Description**: 

In this part, you will complete the entire ISA. Your program should run with test_all.hex case we provide. You don't need to implement data forwarding in this part.
In addition to complete the pipeline, you will also add two counters: the number of branch taken and not taken. 
Branch instructions include BEQ, BLT, BLE, BNE, JAL 




**Grading**:

It should pass test.hex file in behavior simulation and the design should pass synthesization. 
If your hardware performance counters are wrong (-2 points). 
If the design pass the RTL simulation test but it cannot be synthesized, you will get only 50% of the scores. 

If it does not pass test.hex file, then there is no partial grading. Only for this assignment, we will accept a late submission with penalty. 
Late submission: If you can submit the successful design  by the due of part-3, you will receive 50% of the part-2 score. 



 

**What to submit**:

[1] project3.zip (including test.hex and all other files).

You and your partner should submit the same version of the zip file.

Please download your submitted file and verify whether your zip file contains all the files and runs correctly. It must contain fmedian2.mif. If your verilog design is missing, we will contact you to get missing files but each time we contact you, you will lose 5%.

 

[2] Report: You must submit your **own version** of your report. (**Report.pdf**) Please submit a pdf file. Do not include the pdf file in a zip file. You should write a report independently (your partner will write his/her own report) and submit it. The report should include

​     \- Design options and approaches that you have taken

​     \- Problems/issues and how you solved

​     \- Pipeline design diagram. These diagrams can be shared with your partner. (any modifications from assignment #1?, part #1. you can use the same diagram if you haven't changed. ) 

​     \- Contribution to the project.: What you have done and what percentage your contribution is.

Your report might be 1 page excluding diagrams.



## Part 3:  write bubble sort assembly code. 


**Description:** 

In this design, you will write a bubble sort that you did in assignment #2 in the assembly code. 
Data should be stored in address 0x800. 

After the bubble sort is done, display FF in hex0. And read the contents of the value from 0x800 at one cycle at a time, and display the value in the hex1. Both outcomes of the hex values will be used for grading. 


Note: 
test_all.hex do not cover all corner cases. You might need to debug your hardware as well 

## Optional task: Adding a branch predictor 

** Description ** 

In this design, you would add a branch predictor using a 64-entry gshare branch predictor. 
If your design works correctly with a branch predictor, you will get 5 extra point.

