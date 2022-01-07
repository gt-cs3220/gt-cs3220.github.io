#Project #3 
**Due: Oct 22 (F) (6:00 pm)**

This is a group project continuing on your project #2. 
In this project, you will implement a branch predictor and the BTB. 

##Part-1 (Branch Predictor/BTB) (5 points): 
In this design, you will add a baseline branch predictor and the BTB on your pipeline. 
The baseline branch predictor uses a g-share branch predictor. BHR length is 8 bits. 
Suggested design options are : use XOR of  PC[9:2] bits and BHR to index the PHT (Pattern History Table). Each of the 2bit counter in the PHT is initialized with 00. 

The BTB has 16 entries. You use PC[5:2] to index the BTB and PC[31:6] becomes the tag.  Each of the entries contains the target address. 


Summary of the algorithm 

* Front-end: 

While instruction is fetched from IMEM, both BTB and Branch Predictor are concurrently accessed. If there is a hit in the BTB, using the outcome of the branch predictor to choose the target (i.e., if a BP outcome is taken, the target address in the BTB is used to fetch in the next cycle. If a BP outcome is not taken, PC+4 is used for the next fetch address.) 
If BTB miss, then simply fetch the PC+4 in the next cycle. 
The instruction carries the BHR, index  (e.g. BHR xor PC) information that was used to access the BP in the pipeline latch to update in the execution stage. 


* Execution stage: If a branch is mispredicted, flush the pipeline. 

If an instruction is a branch, insert the target address into the BTB. 
Index the BP with the index value that was propgagted with the instruction to update the BP (2-bit saturating coutner is updated). 
Update the BHR (use the old BHR that was propogated with the instruction to update the BHR). 

**Grading**: 
We will check whether testall3.mem is still correctly executed or not. There won’t be any performance improvement in testall3.mem because the final execution time is mostly controlled by the key release routine.  With the branch predictor/BTB, your code should finish testall3.mem correctly. 

**What to submit**
Same as Project #2 submission. 
**[1] A zip file of your source code. The zip file must contain the following:**

* agex_stage.v
* de_stage.v
* fe_stage.v
* mem_stage.v
* wb_stage.v
* project2_frame.v
* VX_define.vh

**[2] A zip file of your Vivado project directory. **

 

##Part-2 (Optimization) (5 points) 
In this design, you can change your BTB and BR designs to improve  performance for bubble.asm. You probably want to add counters to measure branch predictor accuracy (correctly predicted branches vs. mispredicted branches.)  You can explore other options such as using different hash functions, different bits (e.g. instead of PC[9:2]. PC[17:10] xor PC[9:2] etc.), or change the branch predictor size (increase or decrease the BP size or BTB size etc.) You could implement other branch predictors such as perceptron branch predictor. Instead of 2-bit saturating counter, you can just use the last time predictor (i.e., just 1 bit) 

And discuss your design space explorations and write a report about your evaluations. 

Evaluate your design with the provided benchmark and report the performance numbers. The cases are no branch predictor, baseline branch predictor (part-1), and your improved versions. Please show the results those are hurting the performance.  Please show at least 3 different design changes that you have made in addition to the baseline branch predictor.  

**Grading**
The contents of the report will be used for the grading part-2.  Please discuss what design paramters have you changed and discuss why it changes (good or bad or the same) performance.  If your design improved the performance over the baseline branch predictor, you will get 1 extra point. 


**What to submit** 
Report (max 2 pages) 

##FAQ 
* [Q]  I’m debugging my code. I see that there is an X in the BTB. How would it be possible? 
* [A]FE stage can have pipeline bubbles. BTB/BP might be indexed with uninitialized values. 
Please also make it sure when you update BTB/BP, only valid branch instructions update the BP/BTB. 


* [Q] I don’t see performance improvement in testall3.mem. Why ? 

* [A]  Most branch code in testall3.mem are executed only once. In order to have a branch predictor works, the processor has to see the same branch over and over. W/o training, the branch predictor would’t work well. 

* [Q] Do we insert a BTB entry only for the taken branch or even for not-taken a branch? 

* [A] You insert a BTB entry even for the not-taken branch. Because the same branch might be taken in the next time prediction. 

* [Q] If we insert a not-taken branch for the BTB entry, what will be the target address? 
* [A] You can compute the potential target address PC=PC+4+4*sxt(imm) [branch instructions] or RS+4xsxt(imm) [JAL] and insert the information in the BTB. 

* [Q] What if the target in the BTB is wrong? 
* [A] Just like a branch misprediction, we flush the pipeline and also update the BTB with the correct information. 

* [Q] With a branch predictor, will still the pipeline have pipeline bubbles? 
* [A] The pipeline will have pipelien bubble for dependency stalls but not for branch instructions. 



* [Q] My pipeline did not work for project-2. What should I do? 
* [A] Unfortunately, you have to fix project-2 first before you move onto project-3. 


* [Q] I want to add a new file (bp.v). can I? 
* [A] Please do not add new file for our auto-grade script. 

* [Q] Do I have to show the performance improvement in order to get a full-credit for part-2? 
* [A] The baseline branch predictor (part-1) should show the performance improvement over no branch predictor case (project #2). However, your other designs (changing the BP sizes etc.) woudln't need to improve the performance. The discussions why it improves (or it doesn't improve) the performance are the key part of the part-2. 

