# CS 3220 Assignment #2: Bubble Sort

**Due:** **2/12/2021 (F) 6 pm EST**

**Points**: 10 points ouf the total grade 

**Where to submit**: **Canvas** 

This is an **<u> individual project</u>**. 

In this assignment, you will implement a simplified serial version of  bubble sort in Verilog. 

Pleae use files in https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/tree/master/assignment2_files 

To reduce the complexity of the problem, your solution needs to only work with **10 number of items**. 

Starting from the location 0x00, each element has 2 bytes data. 



An example algorithm of serial bubble sort is as following.  

````c
 % Initialization 
  for j in 1 to Num_of_data-1 do 

    for i in 1 to Num_of_data-1 do 
	Read mem(i) // state-1 
	Read mem(i+1)  // state-2
       	compare mem(i) with mem(i+1); // state-3 

        if mem(i) >  mem(i+1) then swap; // state-4 
	if (swap)
		Write swapped_data in mem(i) // state-5 
        if (swap)
         	Write swapped_data in mem(i+1)  // state-6 
       end for; 

  end for;  
````


**Please use the memory that has only 1 read port and 1 write port.** 


Test code will read the memory locations to check whether the sort is correctly performed. 

**We have provided the test code (test.v).** 

Hint: draw a state diagram including i and j value increment, understanding 6 states in the algorithm provided above will be a good start. **(please do not use for loops inside the module)** 

**What to submit:**
1. **bubblesort.v**
2. **A screenshot of final simulation as a pdf file format.**
3. **Report: hardware design diagrams especially your state diagram.**

**How to test the correctness**: Please check the display values. It should print out sorted memory values. 



**Grading Policy**: You will get a full-credit if you pass the test code. However, if you do not submit all the required files, you will loose up to 10%. 



**Partial grading Policy**: Partial grade points are very limited. Hence, please check whether the sorted memory values are printed before submission. 

 

 

 

 

