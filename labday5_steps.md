*Open Vitis HLS and generate ip *

Start Vitis HLS program
1. Click on “Create New Project” in the very first page.
2. Specify the “Project name” and “location” of the project
3. Click on “Add Files…” to add “<file_name>.cpp” and “<file_name>.h”
4. In the same window, click on Browse, to choose the top function (you can add it later)
5. In the next window, click on “Add Files…” to add “<file_name>_test.cpp”, which is our testbench.
6. In the next window, you can leave Solution Name and Period as it is, and just click on “…” to choose **pynq** boards. Then click “Finish”.
7. Then, you project is opened. You can see the files in the left.
8. To test the project, you can first “Run C Simulation” (you can find it under Project tab, or in the shortcuts). Once you click on that, a window appears, in which you may choose “Launch Debugger”, if you want to debug your code. Otherwise, you can just click on “OK” to run
9. "Run C Synthesis" 
10. "Export RTL"   


*Open Vivado and import IP and generate Bitstream * 
Start Vivado application 
1. Create new project, select RTL project and then select pynq-z2 or pynq-z1 for your board.
2. Click on the "Create Block design," use default name "design_1", do "OK"
3. Project setting -> IP -> IP Repository ->Add the directory from the step 1. 

```<project_name>/solution1/impl/ip```

4. on the block design windiw, add  our HLS IP module , add Zynq Processing system 
5. clock on the "Run block automation" and "Run connection automation"

6. go to "sources" and right click on your block design name, click on "Create HLD wrapper".  Click on "Let Vivado do" option and press "OK". 
7. Click on Project->Generate Bitstream
8. Click on File->Export-> Export block design, select the option of including bitstream 

9. <project_name>.gen/sources_1/bd/design_1/hw_handoff


All the files need to have the same file name with different file extensions. 


Where to get the register map address? 

"Porting the files into Jupyter"
https://pynq.readthedocs.io/en/v2.6.1/overlay_design_methodology/overlay_tutorial.html

1. Open Jupyter 
2. Transfer the files using Jupyter feature to where? 
3.  Copy bistream, tcl and wh file into PYNQ FPGA directory. 
4.  How to load bitstreams 

[option W/O using a driver]

source: (https://pynq.readthedocs.io/en/v2.6.1/pynq_overlays/partial_reconfiguration.html)
```
from pynq import Overlay
overlay = Overlay("<project_name>.bit')
add_ip = overlay.scalar_add 
add_ip.register_map 
add_ip.register_map.a = 3 
add_ip.register_map.b = 4 
add_ip.register_map.c 
```
Creating a Driver 
``` 

class AddDriver(DefaultIP):
    def __init__(self, description):
        super().__init__(description=description)

    bindto = ['xilinx.com:hls:add:1.0']

    def add(self, a, b):
        self.write(0x10, a)
        self.write(0x18, b)
        return self.read(0x20)
        
        
        overlay = Overlay('/home/xilinx/tutorial_1.bit')
        overlay?
        
        overlay.scalar_add.add(15,20)
        ``` 

**Rebuild Overlay Base **

How to rebuild overlay 
for Z1-boards 
https://pynq.readthedocs.io/en/v2.6.1/pynq_overlays/pynqz1/pynqz1_base_overlay.html

``` 
cd <PYNQ repository>/boards/Pynq-Z2/base
cd <PYNQ repository>/boards/Pynq-Z1/base
make ````

for Z2-boards 
https://pynq.readthedocs.io/en/v2.6.1/pynq_overlays/pynqz2/pynqz2_base_overlay.html
```
<PYNQ repository>/boards/<board>/base
cd <PYNQ repository>/boards/Pynq-Z2/base
make
```

