# CS3220 Assignment #4: Enhancement of Pipeline  

**Due date**: **4/14/2021 (W) 6 pm  (10 points)**




**Description**:

**Before starting the project, please review assignment4 slides and assignment4 video in Canvas. This is critical to understand what we are doing in this Assignment.**

In this project, you will optimize your pipelined processor. You need to do the following two optimizations. 

1. [5 points] **Full-bypass network**: now the pipeline bypass the results as soon as the results are available.     

2. [5 points] **BTB implementation**: The size of BTB is **your design choice**. The BTB includes the target address as well as branch prediction direction. The replacement policy to use when the BTB gets full is your **design choice too.**


**If your design does not show the correct outcome, you will not get any credit.** 

You should test your design with synthesization and implementation before submitting. If your design can't be synthesized or can't pass implementation, you have to fix your design to comply with that. 

Your code should pass both testall.mem and your bubblesort.mem.

**Before submit your assignment, please set   IDMEMINITFILE as testall.mem** 


**What to submit**:

***Submission Requirements will be updated and this document will be updated with the Piazza link  next week of April 5***

1. [PENDING]

2. [PENDING]

3. **Report**: 
    * Screenshots to show that your design passes **testall.mem** after adding BTB implementation   + full-bypass.
    * Screenshots to show that your design executes **bubblesort.mem** with BTB implementation  + full-bypass 

    * A table to show the execution time of two benchmarks (testall and bubblesort)  for three cases: 
        1. Regular assignment#3 with no modification
        2. Assignment3 with full-bypss
        3. Assignment3 with both full-bypass and BTB

    Discuss the performance improvements on these optimizations 
 
**Report Length**: 1-2 pages excluding any screenshots and tables.

