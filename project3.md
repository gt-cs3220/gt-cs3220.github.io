#Project #3 
**Due: 3/9/22 Monday (6:00 pm)**

This is a group project continuing on your project #2. 
In this project, you will implement a branch predictor and the BTB. 

##Part-1 (Branch Predictor/BTB) (10 points): 
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
Index the BP with the index value that was propagated with the instruction to update the BP (2-bit saturating counter is updated). 
Update the BHR (use the old BHR that was propagated with the instruction to update the BHR). 

**Grading**: 
We will check whether testall.mem is correctly executed or not. There won’t be any performance improvement in testall.mem because the final execution time is mostly controlled by the key release routine.  With the branch predictor/BTB, your code should finish testall.mem correctly. 

**What to submit**
** A zip file of your source code. The zip file must contain the following:**
type ```make submit``` will generate a submission.zip. 
Please submit the submission.zip file. Each submission for each group.

##Late Submission Policy
If you submit project #3 by 3/28(M) 6:00 pm (right after the spring break), you will get 80% of your grade. 
 

##Optional Part-2 (Optimization) (2 points) 
In this design, you can change your BTB and BR designs to improve  performance for tower.mem You probably want to add counters to measure branch predictor accuracy (correctly predicted branches vs. mispredicted branches.)  You can explore other options such as using different hash functions, different bits (e.g. instead of PC[9:2]. PC[17:10] xor PC[9:2] etc.), or change the branch predictor size (increase or decrease the BP size or BTB size etc.) You could implement other branch predictors such as perceptron branch predictor. Instead of 2-bit saturating counter, you can just use the last time predictor (i.e., just 1 bit) 

And discuss your design space explorations and write a report about your evaluations. 

Evaluate your design with the provided benchmark and report the performance numbers. 
Please print out cycle count, BP accuracy (# of corrected predicted branch/# branch insts), # taken branches, # not-taken branches. # branches.  The cases are no branch predictor, baseline branch predictor (part-1), and your improved versions. Please show the results those are hurting the performance.  Please show at least 3 different design changes that you have made in addition to the baseline branch predictor. Total 4 branch predictor's results + no branch predictor's result (project #2). 

**Grading**
The contents of the report will be used for the grading part-2.  Please discuss what design parameters have you changed and discuss why it changes (good or bad or the same) performance.  


**What to submit** 
Report (max 2 pages) 

##FAQ 
* [Q]  I’m debugging my code. I see that there is an X in the BTB. How would it be possible? 
* [A]FE stage can have pipeline bubbles. BTB/BP might be indexed with uninitialized values. 
Please also make it sure when you update BTB/BP, only explicitly branch instructions update the BP/BTB. 


* [Q] I don’t see performance improvement in testall.mem. Why ? 

* [A]  All branch code in testall.mem are executed only once and not-taken. In order to have a branch predictor works, the processor has to see the same branch over and over. W/o training, the branch predictor would’t work well. 

* [Q] Do we insert a BTB entry only for the taken branch or even for not-taken a branch? 

* [A] You insert a BTB entry even for the not-taken branch. Because the same branch might be taken in the next time prediction. 

* [Q] If we insert a not-taken branch for the BTB entry, what will be the target address? 	
* [A] You can compute the potential target address insert the information in the BTB. 

* [Q] What if the target in the BTB is wrong? 
* [A] Just like a branch misprediction, we flush the pipeline and also update the BTB with the correct information. 

* [Q] With a branch predictor, will still the pipeline have pipeline bubbles? 
* [A] The pipeline will have pipeline bubble for dependency stalls but not for branch instructions. 



* [Q] My pipeline did not work for project-2. What should I do? 
* [A] Unfortunately, you have to fix project-2 first before you move onto project-3. 


* [Q] I want to add a new file (bp.v). can I? 
* [A] Please do not add new file for our auto-grade script. 

* [Q] Do I have to show the performance improvement in order to get a full-credit for part-2? 
* [A] No. the performance improvement needs to be demonstrated in part-2  only. 

* [Q] Are we expected to implement data forwarding in project 3? 
* [A] No. 

* [Q] Can I submit only part-2 late? 
* [A] Yes, you can choose to submit only the optional task with 20% penalty. so instead of 2 extra points, you will get 1.6 extra point. 

[Q] Let’s say my instruction stream is as follows: BR(2), ADD, BR(1)
When BR(1) is in EX, it will update the BHR. But BR(2) will be in FETCH at that time.
Which value of BHR should FETCH use? The old value or the updated value from EX?
[A] This is one of the optimization opportunities. So how you design is up to you for this assignment. Please remember that the branch predictor is just a predictor and it won't affect the correctness of the program. 

A best option is that you speculatively update BHR with the predicted outcome of the branch predictor and use it for the next branch predictor prediction. In the execution stage, if BP is wrong, we flush the pipeline, update BHR correctly. 

The simplest option is BHR is only updated in the execution stage. 

And Front-end uses the previous cycle's BHR value (i.e., reading is done only in the front-end and writing is done only in the execution stage and there is no forwarding for BHR.) 

In this assignment, since our pipeline is shallow, I doubt that this would affect any performance though. 

[Q] How to initialize PHT as zero? 
[A] You explicitly put 0 when it resets. 

