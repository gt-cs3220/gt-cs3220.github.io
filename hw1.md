HW #1 Assignments 

**(Due : 1/21/22) 6pm EST**



In this assignments, you will get familiar with Xilinx tool chain and Verilog. 

To install vivado, please see vivado install instruction in the class
homepage (vivado_install_steps.html). 
Please checkout hw1 folder from the github
git clone https://github.com/gt-cs3220/gt-cs3220.github.io.git
and then go to https://github.com/gt-cs3220/gt-cs3220.github.io/tree/master/Spring_2022/hw1_files 
You can also watch hw1.mp4 in the canvas (CS-3220-A>Files>lecture_slides)
you can also look at (https://github.com/gt-cs3220/gt-cs3220.github.io/tree/master/Vivado_Tutorial) 

**Note**: HW #1 is intentionally designed for short tasks.  
  
The folder has two subfolders(example_v,simpleio_v) and simple two tasks. 

Task #1: create a new vivado project with  files only in the example_v folder). You start a new project and follow the instructions to set vivado project including simulation configurations.  Try behavior simulation.  hw1 video shows how to create a project. Please check the "copy sources into project" option. 


Task #2: Modify the code (example_bus.v)  to have the following design in the module (use simple io folder) the simple in and out module based on the following definition.  simpleio_solution.v shows the correct answer that you can use it as a reference. 

```out1 =  in_1 & in_2 & in_3; ```

```out2 = in_1|in_2|in_3; ```

You can use the same testing code to test your designs. 

Once you are done, please answer the question in Canvas HW#1 quiz section. 
