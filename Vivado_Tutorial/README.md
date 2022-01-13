# Running a simple code in Vivado

## Warning
1. Please make sure you have installed Vivado 2021.2
2. We will present the whole process in video, this tutorial is just for reference.

## Step0: Configure Vivado for PYNQ Z2 board
Since PYNQ board is not original supported by Vivado, we need adding board configuration file first. \
<!-- PYNQ Z1 board file:\
https://pynq.readthedocs.io/en/v2.0/overlay_design_methodology/board_settings.html
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step0.png" width="70%"> -->

PYNQ Z2 board file:\
https://www.tulembedded.com/FPGA/ProductsPYNQ-Z2.html
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step0a_new.png" width="70%">
\
Download configuration file to: **\<Xilinx installation directory>\Vivado\<version>\data\xhub\boards\XilinxBoardStore\boards\Xilinx**, extract it like this:
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step0b_new.png" width="70%">

## Step1: Create project in Vivado
Start **Vivado 2021.2** (Not Vivado HLS 2021.2 !!!!!) \
Click **Create Project**

<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step1.png" width="70%">

Click **Next** until **Choose a default Xilinx part or board for your project**, then click **Boards**

<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step1a.png" width="70%">
Choose **pynq-z2** board

<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step1b.png" width="70%">
Alternatively you can also choose **xc7z020clg400-1** as a part number if you don't see pynq-z2 board 


Click **Next**.

## Step2: Add HDL (verilog) design file
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step2.png" width="70%">
