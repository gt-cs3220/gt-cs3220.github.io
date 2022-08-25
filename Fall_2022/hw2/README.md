Homework #2 Assignment

In this assignments, you will get familiar with Xilinx tool chain and Verilog. 

    $ git clone --depth=1 https://github.com/gt-cs3220/gt-cs3220.github.io.git   
    $ cd gt-cs3220.github.io/Fall_2022/hw2

Task #0: install VIVADO

Use the following tutorial https://gt-cs3220.github.io/Vivado_Installation_Steps/vivado_install_steps.html

Task #1: Install pynq board

Use the following tutorial https://github.com/gt-cs3220/gt-cs3220.github.io/tree/master/Vivado_Tutorial

Task #2: Learn how to run simulation in VIVADO

Use the following tutorial https://www.youtube.com/watch?v=KesfzF9z6Aw

Task #3: create a new VIVADO project

1- give a name for your project

2- select RTL project as project type

3- add the source files: design1.v and design2.v

4- skip contraints option

5- use the pynq-z2 board

6- click File -> "Add Sources"

7- click "Add or create simulaiton sources"

8- add testbench.v

9- clock "Simulation" -> "Run Simulation"

10- check out the generated simulation waveform (see out_1 and out_2 chanegs accross time)

Task #4: Modify testbench.v to use design2 module as DUT (Device Under Test).

11- rerun the simulation again

12- check out the generated simulation waveform (see out_1 and out_2 chanegs accross time)

Once you are done, please answer the question in Canvas HW#2 quiz section. 
