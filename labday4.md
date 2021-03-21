Lab day #4 Assignments 

(Due : 3/29/21)



In this assignments, you will learn  Vivado HLS.   

please review 9.lec_hls.pptx for backgrounds. 

In this assignment, you will create a simple Vivado HLS project. 
[step 1]
Download https://github.com/Xilinx/HLS-Tiny-Tutorials
[step 2]
The example that we will use is  2D convolution line buffer. 
cd algorithm_2D_convolution_linebuffer

You can use GUI interface to start the project which is described in the below. 
Or you can simply execute TCL script in the command window. 

```vitis_hls -f run_hls.tcl```

to enable the simulation you need to change the variable in x_hls.tcl file. 
to set up for a Pynq borards change ``` set_part {xcvu9p-flga2104-2-i}
create_clock -period 6.66 ```
to 

```set_part {xc7z020-clg400-1}
create_clock -period 10 ```

Known issues:
If you see an error like "command 'ap_source' returned error code", you need to install the following libraries. 
sudo apt-get install gcc-multilib g++-multilib
[step 3]
do RTL simulation 
set hls_exec 0 to set hls_exec 2 

open "proj_2D_convolution_with_linebuffer/solution1/sim/report/filter11x11_strm_cosim.rpt"
  see the report value  : latency (max) 
[step 4] 
change HLS directives. 
Comment out the following HLS directives and see the latency value changes 
case 1: default 
case 2: comment out only line:130 
case 3: comment out only line:141 
case 4: comment out only line:158 
case 5: comment out only line:159 

Discuss which directives were critical in the performance and explain what that directive is supposed to do in 2-3 sentences. 



*GUI Instruction* 
start Vitis HLS program 
1- click on “Create New Project” in the very first page.
 2- specify the “Project name” and “location” of the project
 3- click on “Add Files…” to add “<file_name>.cpp” and “<file_name>.h” 
 4- in the same window, click on Browse, to choose the top function (you can add it later)
 5- in the next window, click on “Add Files…” to add “<name>_tb.cpp”, which is our testbench. 
 6- in the next window, you can leave Solution Name and Period as it is, and just click on “…” to choose pynq boards. Then click “Finish”.
 7- Then, you project is opened. You can see the files in the left. 
 8- To test the project, you can first “Run C Simulation” (you can find it under Project tab, or in the shortcuts. Once you click on that, a window appears, in which you may choose “Launch Debugger”, if you want to debug your code. Otherwise you can just click on “OK” to run. 
 9- For synthesis, you may “Run C Synthesis” under Solution tab. Once synthesis is done, some reports (latency and resource utilization) will appear. Here the latency numbers are “?”. This is fine.
 10- In the next step, you may “Run C/RTL Cosimulation”, which means that it tests your generated verilog codes using the C testbench. To run that, is will first ask you to choose the RTL, for which you may choose Verilog.



**What to submit**:  

Report max latency for the cases in step 4 and compare it with the default case.  

**Grading**:  submission of at least one of the latency value will be sufficient to get the full  credit  

We won't grade the correctness of tasks. However, we strongly encourage you to complete tasks and ask TAs/instructors during the lab day lecture hours if you face any problems.  

Useful links: 
Vivado HLS tutorial: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_1/ug902-vivado-high-level-synthesis.pdf

