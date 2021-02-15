# CS3220 Assignment #3: Pipeline Design 

**Due dates**: 

**Part 1**  : 3/3/201 (F) 6 pm  ( 5 points)

**Part 2** : 3/17/2021 (F) 6 pm  (15 points)

**Part 3** : 3/31/2021 (F) 6 pm  (10 points)

Total:  30 points of out of the total grade. 


This is a two-member group project. Please discuss this with the instructor if you do not have a partner. 

## Part 1 : pass 5 test cases 


**Description**:

In this assignment, you will design a pipelined processor using verilog. 

For part #1, you need to pass 5 tests we create. You can locate those test files under tests directory. You can refer to the README file under tests for more information about each test case. 

You do not implement forwarding in this assignment. Your program should run with test[1-5].mem file.  

If your design does not show the correct outcome, you will not get any credit. 

You should test your design with synthesization and implementation before submission. If your design can't be synthesized or can't pass implementation, 
you have to fix your design to comply with that. 
 

**What to submit**:

[1] project3.zip (including all files under this directory).

You and your partner should submit the same version of the zip file.

 Please make it sure your code is running all tests and set IDMEMINITFILE as test5.mem and submit the compiled version of  it. 

 Grading: 
 If your design does not pass synthesization and implementation, you will get only 50% of your score. 
 

[2] Report: You don't need to support a report for Part 1. You will submit a report for Part 2. 

 

***Please do not procrastinate.*** 



## Part 2: Complete the pipeline  

**Description**: 

In this part, you will complete the entire ISA. Your program should run with testall.hex case we provide. You don't need to implement data forwarding in this part.




**Grading**:

It should pass testall.hex file in behavior simulation and the design should pass synthesization/implementation.  
If the design pass the behavioral simulation test but it cannot be synthesized, you will get only 50% of the scores. 

If it does not pass testall.hex file, then there is no partial grading. Only for this assignment, we will accept a late submission with a penalty. 
Late submission: If you can submit the successful design  by the due of part-3, you will receive 50% of the part-2 score. 



 

**What to submit**:

[1] project3.zip (including testall.hex and all other files).

You and your partner should submit the same version of the zip file.


[2] Report: You must submit your **own version** of your report. (**Report.pdf**) Please submit a pdf file. Do not include the pdf file in a zip file. You should write a report independently (your partner will write his/her own report) and submit it. The report should include

​     \- Design options and approaches that you have taken

​     \- Problems/issues and how you solved

​     \- Pipeline design diagram. These diagrams can be shared with your partner. (any modifications from assignment #1?, part #1. you can use the same diagram if you haven't changed. ) 

​     \- Contribution to the project.: What you have done and what percentage your contribution is.

Your report might be 1 page excluding diagrams.



## Part 3:  write bubble sort assembly code. 

please note that the part-3 description is subject to change

**Description:** 

In this design, you will write a bubble sort that you did in assignment #2 in the assembly code. 
Data should be stored in address 0x040.  

After the bubble sort is done, display 0F in HEX0. And read the contents of the value from 0x040 at one cycle at a time, and display the value in the hex1. Both outcomes of the hex values will be used for grading. 


Note: 
testall.hex do not cover all corner cases. You might need to debug your hardware as well 

## Optional task: Adding a branch predictor 

** Description ** 

In this design, you would add a branch predictor using a 16-entry gshare branch predictor (i.e. 4-bit branch history length). 
If your design works correctly with a branch predictor, you will get a 5 extra point. Your branch predictor should work with your bubble sort. 
