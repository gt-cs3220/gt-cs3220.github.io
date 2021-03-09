# CS3220 Assignment #4: Enhancement of Pipeline  

**Due dates**: 


4/7/2021 (F) 6 pm  (10 points)


This is a two-member group project.  
**Description**:

In this project, you will optimize your pipelined processor. You need to do the following two optimizations. 

(1) [5 points] full-bypass network: now the pipeline bypass the results as soon as the results are available.     

(2) [5 points] BTB implementation.  The size of BTB is your design choice. The BTB includes the target address as well as branch prediction direction. 


If your design does not show the correct outcome, you will not get any credit. 

You should test your design with synthesization and implementation before submission. If your design can't be synthesized or can't pass implementation, 
you have to fix your design to comply with that. 

Your code should pass both testall.mem and your bubblesort.mem. 
Before submit your assignment, please set   IDMEMINITFILE as testall.mem 

**What to submit. **:

**[1] A zip file of your source code. The zip file must contain the following:**

* agex_stage.v
* de_stage.v
* fe_stage.v
* mem_stage.v
* wb_stage.v
* project3_frame.v
* VX_define.vh
* bubblesort.mem 

**[2] A zip file of your Vivado project directory. Please see Piazza @112.**

**[3] Report: 
Screenshots to show that your design passes testall.mem after adding BTB implementation   + full-bypass 
Screenshots to show that your design executes bubblesort.mem w BTB implementation  + full-bypass 

A table to show the execution time of two benchmarks (testall and bubblesort)  for three cases: (assignment#3, with full-bypss, with full-bypass + BTB) 

Discuss the performance improvements on these optimizations 
 


