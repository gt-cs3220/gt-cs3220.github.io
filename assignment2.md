# CS 3220 Assignment #2: Bubble Sort

**Due:** 2/5/2021 (F) 6 pm

**Points**: 10 points ouf the total grade 

**Where to submit**: Canvas 

This is an <u> individual project</u>. In this project, you will write a simple bubble sort algorithm. 



In this assignment, you will implement a simplifed serial version of  bubble sort in verilog. 

To reduce the complexity of the problem, your solution needs to only work with the following example. 

In memory location 0x0100, there is 10 values. 10, 50,100 , 50, 3, 2, 1, 300, 500, 10.  Each value occupies 2 Bytes. So mem[0x100] = 10, mem[0x102] = 50 etc.  

Algorithm of serial bubble sort 

````c
 % Initialization 
  for i in 1 to Num_of_data-1 do 

    for j in 1 to Num_of_data-1 do 

       compare Input_data(i) with Input_data(i+1);

        if Input_data(i) >  Input_data(i+1) then swap; 

       end for; 

  end for;  
````



Test code will read the memory locations to check whether the sort is correctly performed. 

We provide the test code. 



**what to submit:** (1) The entire zip file for your project. (2)  A screenshot of final simulation as a pdf file format.  (3) report: hardware design diagrams 



**Grading Policy**: You will get a full-credit if you pass the test code. However, if you do not submit all the required files, you will loose up to 10%. 



**Partial grading Policy**: There is no partial grading. Pleaes test your code to see whether it passes with simulation. 

 

 

 

 

