# HW 5 (Vitis Tutoria) # 

In this assignments, you will learn Vivado HLS.   

**please review 10.lec_hls.pptx for background.** 

In this assignment, you will create a simple Vivado HLS project. 
Please install [vitis tool chain in Xilinix] (https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vitis.html). 

From project #3, you will use VMs. Please see [CoC-ICE](https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/access_vm_steps/access_vm_doc.md)

and please make it sure you do "module load cs3220" to set up vivado/vitis on your path 

[**Step 1**]
The example that we wil use is 2D convolution line buffer. 
you can directly download including other examples using this command:

```git clone --branch 2021.1 https://github.com/Xilinx/Vitis-HLS-Introductory-Examples.git```

[**Step 2**] Go to the example directory.

```cd algorithm_2D_convolution_linebuffer```

You can use GUI interface to start the project which is described in the below. 
Or you can simply execute TCL script in the command window. 
On windows, you can use "Vitis HLS 2020.2 Command Prompt" 

 <img src="figs/vitis_commands.png" width="100"> 

```vitis_hls -f run_hls.tcl```

To enable the simulation you need to change the variable in ```x_hls.tcl``` file. 

To set up for a Pynq boards change ```set_part {xcvu9p-flga2104-2-i}
create_clock -period 6.66``` to 

```set_part {xc7z020-clg400-1} create_clock -period 10```. This is in run_hls.tcl file.

Please open  both tcl files and read it. Understanding the tcl files will be very helpful to understand the steps in this assignment. 

Known issues:
* If you see an error like "command 'ap_source' returned error code" in your linux, you need to install the following libraries using:  ```sudo apt-get install gcc-multilib g++-multilib```


[**Step 3**]
Do RTL simulation 
set ```hls_exec 0``` to set ```hls_exec 2``` in ```x_hls.tcl``` file 

Open ```"proj_2D_convolution_with_linebuffer/solution1/sim/report/filter11x11_strm_cosim.rpt"```

See the report value  : **latency (max)** 

[**Step 4**] Change HLS directives. 

Comment out the following HLS directives and see the latency value changes in .cpp file. 

case 1: default 

case 2: comment out only **line:130** 

case 3: comment out only **line:141** 

case 4: comment out only **line:158** 

case 5: comment out only **line:159** 

Discuss which directives were critical in the performance and explain what that directive is supposed to do in **2-3 sentences**. 


## GUI Instructions

Start Vitis HLS program 

1. Click on “Create New Project” in the very first page.

2. Specify the “Project name” and “location” of the project

3. Click on “Add Files…” to add “<file_name>.cpp” and “<file_name>.h” 

4. In the same window, click on Browse, to choose the top function (you can add it 
 later)

5. In the next window, click on “Add Files…” to add “<file_name>_test.cpp”, which is our testbench. 

6. In the next window, you can leave Solution Name and Period as it is, and just click on “…” to choose **pynq** boards. Then click “Finish”.

7. Then, you project is opened. You can see the files in the left. 

8. To test the project, you can first “Run C Simulation” (you can find it under Project tab, or in the shortcuts). Once you click on that, a window appears, in which you may choose “Launch Debugger”, if you want to debug your code. Otherwise, you can just click on “OK” to run. 

9. For synthesis, choose “Run C Synthesis” under Solution tab. Once synthesis is done, some reports (latency and resource utilization) will appear. Here the latency numbers are “?”. **This is okay**

10. In the next step, you may “Run C/RTL Cosimulation”, which means that it tests your generated verilog codes using the C testbench. To run that, is will first ask you to choose the RTL, for which you may choose Verilog.



**What to submit**:  
please answer the question in Canvas Quiz_HW5 


## Useful links section: 
* Vivado HLS tutorial: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_1/ug902-vivado-high-level-synthesis.pdf

