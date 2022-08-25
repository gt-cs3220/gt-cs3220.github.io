# Vitis/Vivado Installation Steps (Most steps are updated at 2020. We will use 2022.2 in Fall 2022) 
### Warning
```diff
- 1. This tutorial works for Win10 and Linux. If you use MacOS, you could use VirtualBox or VMWare as virtual machine to isntall Linux.
- 2. Please make sure you disk has at least 150G free space. You could install Vivado in portable storage device.
```
### Supported operating systems for Vivado *2022.1*
Please note that this instruction is an old version and in Fall 2022, we will use 2022.1. 
We will provide an updated information but you can still probably use the same information with minor modifications. 
You need to install Vitis and vivado for the course. 
(the original doc was made in 2020 and only new important information's figures are updated. So you might see some discrepancy of the screen shots. ) 

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/supportOS_new.png">

## Step 1
Go to  https://www.xilinx.com/support/download.html "**Download**".

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step1.png" width="70%">

## Step 2
Scroll down to "**Vivado Design Suite - HLx Editions - 2022.1  Full Product Installation**", and click 
"**Xilinx Unified Installer 2020.2: Windows Self Extracting Web Installer**"

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step.png" width="70%">

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step1a.png" width="70%">

## Step 3
You may need to register a Xilinx account first, using your personal email or GT email (I recommend using GT email). 

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step4.png" height="500">

After registration, You will need to fulltill the form according US federal's law requirement.

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step4a.png" width="70%">


Fill this form, scroll down, and click "**Download**".

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step4b.png" width="70%">

## Step 4
Click the execution file that you just downloaded.

<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step2_new.png" width="70%">

**Important !!!!!! We will use latest version of Vivado. Here, we use the same version as GT CRNCH** \

Input the **User ID (email)** and **Password** of your Xilinx account. \
\
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step5b.png" width="70%">

Agree all the conditions. \
\
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step5c.png" width="70%">
 
## Step 5
Choose **Vitis** \
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step6.png" width="70%">

## Step 6 
Choose only **Soc Zynq-7000 devices**. Otherwise the size will be even much bigger than 150 GB. 

\
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step7.png" width="70%">
\
Again, please make sure your have at least 150G space on your disk. You could install it on portable storage device. \

\
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step3b_new.png" width="70%">
\
**Important !!!!!! Please make sure your isntallation directory's name has no space.** \
Like here if I change "**Xilinx2020**" to "**Xilinx 2020**", then it will cause error.
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step6c.png" width="70%">
\
Please remember your installation directory.
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step3b_new.png" width="70%">
\
Please make sure you PC is connected to internet. \
<img src="https://github.com/gt-cs3220/gt-cs3220.github.io/blob/master/Vivado_Installation_Steps/step_images/step6e.png" width="70%">

## Step6
Wait for the installation to be completed. This may take several hours. \
**Note** \
**If there is any problems for installation please post it on Piazza or contact with TAs. You can also ICE cluster.** 


## Step 7 
Install board file (PYNQ-Z2) : please download boad file from the manufacture website (https://www.tulembedded.com/FPGA/ProductsPYNQ-Z2.html)  
Extracting the zip file in Vivado, allows the board to be selected when creating a new project. This will configure the Zynq PS settings.

To install the board files, extract the zip file under the following directory: 

<Xilinx installation directory>\Vivado\<version>\data\xhub\boards\XilinixBoardStore\boards\Xilinx

e.g.) Xilinix\Vivado\2022.1\data\xhub\boards\XilinxBoardStore\boards\Xilinx\pynq-z2 

