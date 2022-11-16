# HLS with DMA Example 

[part-1] Vitis to RTL generation. 
The same way we did in project #4, you produce an RTL design using example.cpp  

[part-2] Vivado to RTL 

This step is similar to  project #4 

[1] Create new project   

[2] Create block design 

[3] Add  IP module into IP repository that is produced in part-1. (you can add this in step 9 ) 

[4] Add DMA IP module in the open block design. 

<img src="figs/dma_selection.png">

[5]  and configure the DMA. 

* You need to double clock the DMA to open the configuration settins. 
* Uncheck Enable Scatter Gather Engine to disable Scatter Gather
* Set the Width of Buffer Length Register to 26 (optional)
* **Set the memory mapped data width to 64 match the HP port (defined in the PYNQ image and applied at boot time)** 
<img src="figs/dma_options.png">

[6] add "Zynq PS" IP module and then configure it. 

* Double click the Zynq PS block to open the customization settings
* Go to the PS-PL Configuration

<img src="figs/ps_pl_option.png">
* expand HP Slave AXI Interface and enable S AXI HP0 and S AXI HP2 interface

<img src="figs/ps_2hp.png">

[7] click on the “Run block automation” and “Run connection automation” 

<img src="figs/auto_connection_options.png"> 

[8] If HP ports are gone (the circle ports in the above figure. e.g.) S_AXI_HP0 etc.), repeat step 6 and make it sure HP ports are visible. 

Select S_AXI_HP0 and for the Master Interface select /dma/M_AXI_MM2S
Select S_AXI_HP2 and this time select /dma/M_AXI_S2MM for the Master Interface

<img src="figs/example_dma_connections.png">

if you don't see S_AXI_HP0 and S_AXI_HP2 pop-up window, you need to report the setp 6. 

[9] Add "example" IP of your design to block design using "+" button 

[10] run autoconnection. 
when you see the "run connection automation box"

DMA: M\_AXIS\_MM2S → example\_0:A

DMA: S\_AXIS\_S2MM → example\_0:B

[11] F6 (or press a check box) to validate your design. 
If there is an error, some steps are wrong so please review your design with the provided steps carefully. 
Your design should look like this 

<img src="figs/after_auto_connection.png">

[12]  Create HDL wrapper 
go to “sources” and right click on your block design name, click on “Create HLD wrapper”. Click on “Let Vivado do” option and press “OK”.


[13] Click on Project->Generate Bitstream (it will ask to synthesize etc. and click yes)


[14] Click on File->Export-> Export block design, select the option of including bitstream

[15] copy files to prepare for upload them to pynq boards 

copy bit stream file .bit
.runs/impl_1/design_1_wrapper.bit 
copy tcl script file .tcl .runs/impl_1/design_1_wrapper.tcl
copy hwh file . .gen/sources_1/bd/design_1/hw_handoff   hwh file.

make it sure name all the same file name. 

[16] Go to pynq boards and upload the files that are generated in the above step and also ipynb files. 
execute dma_basic_test.ipynb 

Expected outcome will be like this. 
<img src="figs/result.png">

[17] check whether you are receiving the output buffer that is the input buffer value  + 5. 
change the data_size to 1000, 1000000 and write down exec_time. Compute the bandwidth. 
Please note that int32 is 4B and this transaction is bi-directional (send and receive). 
