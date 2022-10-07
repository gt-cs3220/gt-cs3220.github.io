# CS3220 Project #3 : Branch Prediction

This is project is a continuation of project #2.
In this project, you will be optimizing your CPU pipeline by adding a branch predictor (BP) and a branch target buffer (BTB). 

## Part-1 (Branch Predictor/BTB) (10 points): 
In this design, you will add a baseline branch predictor and the BTB to your pipeline. 
The baseline branch predictor uses a G-share branch predictor. 

The branch history register (BHR) length is 8 bits.
The BTB size is 16.

Use XOR of PC[9:2] bits and BHR to index the Pattern History Table (PHT). 
Each of the 2bit counter in the PHT is initialized with 00.

Summary of the algorithm 

* Front-end: 

While instruction is fetched from IMEM, both BTB and Branch Predictor are concurrently accessed. 
If there is a hit in the BTB, use the outcome of the branch predictor to choose the target (i.e. if a BP outcome is taken, the target address in the BTB is used to fetch in the next cycle. If a BP outcome is not taken, PC+4 is used for the next fetch address.) 
If BTB miss, then simply fetch the PC+4 in the next cycle. 
The instruction carries the BHR index  (e.g. BHR xor PC) information that was used to access the BP in the pipeline latch to update in the execution stage. 

* Execution stage: 

If a branch is mispredicted, flush the pipeline.
If an instruction is a branch, insert the target address into the BTB. 
Index the BP with the index value that was propagated with the instruction to update the BP (2-bit saturating counter is updated). 
Update the BHR (use the old BHR that was propagated with the instruction to update the BHR). 

Pleae print out cycle count in the sim_main.cpp
**Change in sim_main.cpp** 
```
if (1 == exitcode)
    std::cout<<"Passed! cycle_count:" << last_print_inst_count_WB << std::endl;
else
    std::cout<<"Failed. exitcode: "<<exitcode<<std::endl;
```

**Grading**: 
We will check whether </test/part4/testall.mem> is correctly executed or not. 
There won’t be any performance improvement in testall.mem because the final execution time is mostly controlled by the key release routine. With the branch predictor/BTB, your code should finish testall.mem correctly. 

**What to submit:**
**A zip file of your source code. The zip file must contain the following:**
type ```make submit``` will generate a submission.zip. 
Please submit the submission.zip file. Each submission for each group.

**Late Submission Policy**
The late submission penalty will be 20%. 

## Part-2 (Bonus) (2 points)
In this design, you can change your BTB and BR designs to improve performance of </test/towers/towers.mem>. You probably want to add counters to measure branch predictor accuracy (correctly predicted branches vs. mispredicted branches.).
You can explore other BHR hashing functions (e.g. using different bits of PC for the XOR operation), or change the branch predictor size or BTB. You could also implement another branch predictor. 
Discuss your design space explorations and write a report about your evaluations. 
Evaluate your design with the provided benchmark and report the performance numbers. 
Please print out cycle count, BP accuracy (# of corrected predicted branch/# branch insts), # taken branches, # not-taken branches. # branches.  The cases are no branch predictor, baseline branch predictor (part-1), and your improved versions. Please show the results those are hurting the performance. 
Please show at least 3 different design changes that you have made in addition to the baseline branch predictor. Total 4 branch predictor's results + no branch predictor's result (project #2). 

**Grading**
The contents of the report will be used for the grading part-2.  
Please discuss what design parameters have you changed and discuss why it changes (good or bad or the same) performance.  


**What to submit** 
Report (max 2 pages) (No need to submit the code again) 

## FAQ 
[Q]  I’m debugging my code. I see that there is an X in the BTB. How would it be possible? 

[A] FE stage can have pipeline bubbles. BTB/BP might be indexed with uninitialized values. 
Please also make it sure when you update BTB/BP, only explicitly branch instructions update the BP/BTB. 


[Q] I don’t see performance improvement in testall.mem. Why ? 

[A]  All branch code in testall.mem are executed only once and not-taken. In order to have a branch predictor works, the processor has to see the same branch over and over. W/o training, the branch predictor would’t work well. 

[Q] Do we insert a BTB entry only for the taken branch or even for not-taken a branch? 

[A] You insert a BTB entry even for the not-taken branch. Because the same branch might be taken in the next time prediction. 

[Q] If we insert a not-taken branch for the BTB entry, what will be the target address? 	

[A] You can compute the potential target address insert the information in the BTB. 

[Q] What if the target in the BTB is wrong? 

[A] Just like a branch misprediction, we flush the pipeline and also update the BTB with the correct information. 

[Q] With a branch predictor, will still the pipeline have pipeline bubbles? 

[A] The pipeline will have pipeline bubble for dependency stalls but not for branch instructions. 


[Q] My pipeline did not work for project-2. What should I do? 

[A] Unfortunately, you have to fix project-2 first before you move onto project-3. 


[Q] I want to add a new file (bp.v). can I? 

[A] Please do not add new file for our auto-grade script. 

[Q] Do I have to show the performance improvement in order to get a full-credit for part-2? 

[A] No. the performance improvement needs to be demonstrated in part-2  only. 

[Q] Are we expected to implement data forwarding in project 3? 

[A] No. 

[Q] Can I submit only part-2 late? 

[A] Yes, you can choose to submit only the optional task with 20% penalty. so instead of 2 extra points, you will get 1.6 extra point. 

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


[Q] How do I print out the number of corrected branches and the number of mispredicted branches? Do I have to check VCD outputs? 

[A] You could use VCD outputs. Or you coud add the counter values into ```WB_counters[8], WB_counters[9]``` etc. and printout them in the sim_main.cpp. 

[Q] I ran tower.mem and my test case is failed unlike other test cases. Is that expected? 

[A] Yes. the default tower.mem returns "255". The tower.c returs numMoves </test/towers/towers.c#L258>. The mem file's correct output is 255.  You can change </test/towers/towers.c#L22> to change the num of disk to move to change the length of the code.  
 Please modify exit code to use reg10 instead of the default reg3 to see the exit code ```int exitcode = (int)prj->project2_frame->my_WB_stage->last_WB_value[10];``` 
 
