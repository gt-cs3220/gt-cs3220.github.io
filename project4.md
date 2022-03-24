# Project 4 
**Due: 4/8/22 Friday (6:00 pm): Part-1**

This is a group project continuing on your project #3. 
In this project, you will test your RISC-V design on pynq board. 

## Part-1: Vivado Simulation (5 points) 
Before you run your design on FPGA, in this step you will simulate your design on Vivado's simulation. Vivado simulation models the hardware behavior more accurately than verilator. If your verilog code followed general HDL rules, you code would just run fine with vivado simulation. But if your code has uninitialized code or sequential code, it might not work with vivado simulation. In that case, you have to debug your code.  Those who were sensitive to the verilator versions might encounter this problem. 

Please make it sure your add test code and set the path correctly. Please review the "project2_vivado_check.mp4" in canvas/Files/videos. 

You can check last_WB_value[10] show 255. The example screenshot is as follows. 
<img src="figs/prj4.png">

**Grading** 

We will grade part-2. If Part-2 fails, we will review part-1's screenshot to give the partial credit. 


**What to submit** 

A screenshot to show instcount and r10 value. 
Please note that screenshot submission will be used for grading only when your part-2 fails to give a partial credit of project #4. 



##  Part-2: Run your pipeline on Pynq board (5 points) 
In this step, you will connect your pipeline with ARM processor similar to HW#10. 
More instructions will be posted soon. 




