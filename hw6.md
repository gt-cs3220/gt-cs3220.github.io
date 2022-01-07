HW #6 Assignments 

(Due : 9/29/21 W  **6:00 pm EST**)

Group assignment

[2 points]

 In this assignment, you will program your Pynq board to blink 4 LEDs (e.g. 1 sec on and 1 sec off). 

To count time, you have to increment a counter every clock cycle. You can use H16 (sysclk) for your clock in that case it will be 125 MHz clock.  Currently, the most right button (button[3]) is mapped as a reset button. 

To help your assignment, we provide an example of blink.v and time
constrain file at
github(https://github.com/gt-cs3220/gt-cs3220.github.io/tree/master/hw6_files). A
project file xpr  is also provided for your board testing at canvas. (Due to the security reason, we don't upload the archive xpr file on the public github)  Please watch hw6.mp4 at canvas/Files/videos. 




**What to do:** 

Step1. change the led port names into ledr. You have to change both xcd file and blnk.v file port names to be matched. 

Step2. 2x or 10x slowdown the blink speed and check whether bliking speed is slowed down. 

**What to submit:**

blink.v and xcd file. 

**Grading policy:**

We will only check whether you have submitted those two modified files. However, please understand how you can create a bitstream by following all the steps in the video. This is critical for you to learn it and test it on the board since you have to do that for project #3.  If you can't blink the board, you can't run a pipeline processor. 

**FAQ:**

[Q] Can I do this project with my project partner? 

[A] Yes 

[Q] How do I change the port name? 

[A] First, you modify the line that contains ldr to ledr. Second, you modify blink.v ldr to ledr. Third, you rename your port in the block design and update all your designs. 


[Q] Can you highligh the important steps in the video? 

[A] create project/ add src files/select the target board/  open block design/ add module and clock IP/ create ports and connect the ports and two modules/ create HDL wrapper with design_1/generate block design/ run synthesis/ run implementation / generate bitstream/ program device. 



[Q] Do we need an SD card for this pynq board to operate?


[A] Not for this project. but you need Pynq boot image for later assignments. At that time you also have to change your jumper setting for booting. 



[Q] Vivado Hardware Manager doesn't detect my pynq board. what should I do? 


[A] First, make it sure your USB cable works.(e.g., check whether the cable can connect your phone to a comp. some old cables are broken even though it can be used for charging a phone) 
 Normally you don't have to install any additional drivers for Pynq FPGA boars. if your board is not detected, please see a TA. 

[Q] After I change at blink.v to change the blinking speed, do I need to redo open block design/generate block design etc.? 

[A] No, vivado will refresh automatically for internal design module updates. However, you have to synthesize,implement,generate bitstreams and program the device again. 

[Q] I am using the provided blink.v and XDC file but vivado generates synthesization error. Do I have to change anything in these two files to make it compile? 

[A] The error is probably coming from the fact that you have not generate "Create HDL wrapper" and just generate Block design. please follow the steps in the video. 


[Q] I am concernd that my PYNQ might be broken or my USB is broken etc. is there an easy way to check? 

[A] If you open the provided project file in canvas, the bitstream is also included. You can program the generated bitstream and check whether LED blinks. 


[Q] Error message is "design_1_wrapper" does not exist even though I created HDL wrapper.What did I do wrong? 

[A] Sometimes, vivado got confused with HDL wrapper and generate blocks etc depending on the order of the actions.  Please remove them and restart create block/create wrapper and generate block.. 

[Q] I modified XDC file and blink.v file after I tested them with the provided code. Do I need to recreate the project all over again or just resynthesize them? 

[A] since you modified the port names, you probably need to create block design again or update them.  If it is causing error messages, please check whether  port names in XDC file and your verilog code port names (and even internal assignment) are modified correctly. If there are still errors, it would be easier to start a new Vivado project with those two modified files. 













