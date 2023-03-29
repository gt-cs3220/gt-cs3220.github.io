# hw6

**(Due: 04/03/23) Monday 6pm**




## Part 0 : Open jupyter notebook on pynq board cluster


Please use synestia cluster [access](https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/synestia_cluster_access.md) to know how to access pynq board. 
We are encourage to use [ODD](https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Spring_2023/synestia_cluster_access.md#using-open-ondemand-ood) 


## Part 1 : Follow the overlay tutorial with providied bistream  

In this part you'll run a tutorial program on jupyter notebook with tutorial bistream.

This instruction is based on [this tutorial](https://pynq.readthedocs.io/en/v2.0/overlay_design_methodology/overlay_tutorial.html). 
The tutorial file is copied from this repo: https://github.com/PeterOgden/overlay_tutorial.git 


[step 1] Check out hw6_files from the class git

[step 2] Go to the directory with your GT account ID and upload files to pynq board's ARM processor  
(scalaradd.ipynb, tutorial_1.bit, tutorial_1.hwh) 

If you are using onDemand GUI, you can skip this step since the ARM processor on Pynq board already has an access to your home. 

<img src="figs/hw6/jupyter0.png">

[step 3] Open scalaradd.ipynb in jupyternotebook and edit the file location to your directory (```/nethome/[GT account ID]```) in cell 1 and 7
 
Press the run button for each cell and see whether it works or not. 
<img src="figs/hw6/output_jupyter.png">

## Part 2 : Generate and run your own bistream
In this part, you will create a bitstream from Vivado and extend the tutorial to load your own bitstream design. 

### Step-Vitis: Open Vitis HLS and generate ip


**Start Vitis HLS program (similar to HW#5)**
Note that the following figures are using a different version of HLS, pls follow the texts if the figure looks different from the Vitis HLS/Vivado in synestia cluster.

[1] Click on “Create New Project” in the very first page.

[2] Specify the “Project name” and “location” of the project

[3] Click on “Add Files…” to add “add.cpp” and “adder.h”. Put "add" as the top function. Do not add the test file yet.

[4] In the same window, click on Browse, to choose the top function (you can add it later).

[5] In the next window, click on “Add Files…” to add “add_test.cpp”, which is our testbench.

[6] In the next window, you can leave Solution Name and Period as it is, and just click on “…” to choose **pynq-z2** boards. Then click “Finish”.

[7] Then, your project is opened. You can see the files in the left. 

[8] If you haven't added top module, open "project settings" -> "Synthesis" and add top module "add" in this example as top function. 

[9] To test the project, you can first “Run C Simulation” (you can find it under Project tab, or in the shortcuts). Once you click on that, a window appears, in which you may choose “Launch Debugger”, if you want to debug your code. Otherwise, you can just click on “OK” to run.

[10] "Solution"->"Run C Synthesis" ->"All Solutions"

[11] (you don't need for vivtis 2020 which is on synestia) Set HLS version number: "Solution" -> "Solution Settings" -> "Export" -> find "Format Selection" block and click (Configuration...) -> Modify Version as "0.0.1" in the pop-up window.
<img src="figs/hw6/hls_version.png">

[12] "solution"->"Export RTL"   

[13] Copy AXI data register ids for inteface on the later step. The location for these IDs is in <project_name>/solution1/impl/ip/drivers/<module_name*>/src/<module_name>_hw.h

[14] Copy the data range somewhere to match with pynq boards. Please see below image as example of what data range we are talking about here. 

##define  _ADDR_*_DATA addresses 

<img src="figs/hw6/address.png"> 


### Step-Vivado:Open Vivado and import IP and generate Bitstream

**Start Vivado application**

[1] Create new project, select RTL project and then select pynq-z2 for your board. (you don't need to add any new files and just select default options)

[2] Click on the "IP Integrator/Create Block design," use default name "design_1", do "OK"

<img src="figs/hw6/setting.png">

[3] Project Manager -> IP -> IP Repository -> click the "+" icon to add the directory ```<project_name>/solution1/impl/ip``` from the Vitis HLS step. 

<img src="figs/hw6/ipsetting.png">

<img src="figs/hw6/ipadd.png">

[4] Create Block Design (using default name **design_1**) -> In the Diagram Window, right click -> add ip -> search **Zynq Processing system** and add our HLS IP module **Add**.

<img src="figs/hw6/add_diagram.png">



<img src="figs/hw6/add_ps.png"> 

[5] Click on the "Run block automation" and "Run connection automation" -> Click "Validate Design"

<img src="figs/hw6/connection.png">

[6] Go to "sources" and right click on your block design name, click on "Create HDL wrapper". Click on "Let Vivado do ..." option and press "OK". 

<img src="figs/hw6/addhwwrapp.png">

<img src="figs/hw6/addhwwrapp-2.png">

[7] Click on Project -> Generate Bitstream (it will ask to synthesize etc. and click yes) 

<img src="figs/hw6/menu_bit.png">

[8] Click on File->Export-> Export block design, select the option of including bitstream 

<img src="figs/hw6/export_bit.png"> 


[8.a] Copy bit stream file ```*.bit```, for example <project_name>.runs/impl_1/design_1_wrapper.bit 


[8.b] Copy tcl script file ```*.tcl```, for example <project_name>.runs/impl_1/design_1_wrapper.tcl 

[9] Copy hwh file from <project_name>.gen/sources_1/bd/design_1/hw_handoff
you can find hwh file. 

[10] Make all files in the same names (e.g. add.bit, add.tcl, add.hwh) and place where they are easy to find  

[11] Upload the three files (add.hwh, add.tcl, add.bit) into pynq boards (as you did in Part 1)

[12] Repeat part-1 using jupyter-notebook with myadd.ipynb file   



### Part 3: Convert the add example to take 3 inputs and change the name of module to add3

**IMP Note: Please create new Vitis HLS project and new Vivado project for part 3**

In Part 2 you created an addition IP that used 2 ports (a & b). For Part 3, you need to modify add.cpp and adder.h to make it into 3 port IP. So inputs will be a,b,c and output will be d.

```d = a + b + c```

Name of module is add3. (create add3.cpp add3.h myadd3.ipynb for 3 incput cases) 

Overview of general steps we follow:

Step [1] Open Vitis HLS and generate ip  : please pay attention to create HLS interface for d. 

Step [2] Open Vivado: Add ip and PS and generate bitstream, metafiles  

Step [3] Copy the bitstream of add3 into jupyter (pynq boards) 

Step [4] Update myadd.ipynb to work with new module add3 and change the new file as myadd3.ipynb 

Useful github links: 

PYNQ repo : https://github.com/Xilinx/PYNQ

Overlay tutorial code:  [https://github.com/PeterOgden/overlay_tutorial]




**What to submit**:  add3.cpp add3.h a myadd3.ipynb, a screenshot of working proof from the jupyter notebook  
 
** Grading poicy ** 
(1 pt) If you cannot complete part-3, submit a screenshot of part-2. 
If you complete part-3, you will get a full 3-point credit. 

**In order to do project #4, hw#6 needs to be completed first. Please finish it ASAP.**

