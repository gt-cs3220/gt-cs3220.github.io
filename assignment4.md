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

Only 1 team member needs to submit the files. So please pay attention to naming conventions. Not following convention may result in grading scripts failing and points deducted for your team.

1. A zip file of your team's source code. The zip file must contain the following:
* agex_stage.v
* de_stage.v
* fe_stage.v
* mem_stage.v
* wb_stage.v
* project3_frame.v
* VX_define.vh
* bubblesort.mem

**Your zip filename must be of the format <firstName1>_<firstName2>_src.zip. So for example, Hanning and Sam are team members, then Hanning could submit the file as "Hanning_Sam_src.zip"**

2. A zip file of your team's Vivado project directory. See Piazza for sample image

**Your zip filename must be of the format <firstName1>_<firstName2>_root.zip. So for example, Hanning and Sam are team members, then Hanning could submit the file as "Hanning_Sam_root.zip"**

3. **Report**: 
    * Screenshots to show that your design passes **testall.mem** after adding BTB implementation   + full-bypass.
    * Screenshots to show that your design executes **bubblesort.mem** with BTB implementation  + full-bypass 

    * A table to show the execution time of two benchmarks (testall and bubblesort)  for three cases: 
        1. Regular assignment#3 with no modification
        2. Assignment3 with full-bypss
        3. Assignment3 with both full-bypass and BTB

    Discuss the performance improvements on these optimizations 
 
**Report Length**: 1-2 pages excluding any screenshots and tables.

**Your report filename must be of the format <firstName1>_<firstName2>_report.pdf. So for example, Hanning and Sam are team members, then Hanning could submit the file as "Hanning_Sam_report.pdf"**

**Incorrect/Incomplete/Missing File(s) Submissions : 5% deducted**