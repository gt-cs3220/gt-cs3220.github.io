# Running a simple code in Vivado

## Step0: Configure Vivado for PYNQ Z1 and PYNQ Z1 board
Since PYNQ board is not original supported by Vivado, we need adding board configuration file first. \
PYNQ Z1 board file:\
https://pynq.readthedocs.io/en/v2.0/overlay_design_methodology/board_settings.html
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step0.png" width="70%">

PYNQ Z2 board file:\
https://www.tul.com.tw/ProductsPYNQ-Z2.html
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step0a.png" width="70%">
\
Download configuration file to: **\<Xilinx installation directory>\Vivado\<version>\data\boards\board_files**, extract it like this:
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step0b.png" width="70%">

## Step1: Create project in Vivado
Start **Vivado 2020.1** (Not Vivado HLS 2020.1 !!!!!) \
Click **Create Project**

<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step1.png" width="70%">

Click **Next** until **Choose a default Xilinx part or board for your project**, then click **Boards**

<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step1a.png" width="70%">
Choose **pynq-z2** board

<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step1b.png" width="70%">

Click **Next**.

## Step2: Add HDL (verilog) design file
<img src="https://github.com/gt-cs3220-spr21/gt-cs3220-spr21.github.io/blob/master/Vivado_Tutorial/image/step2.png" width="70%">
