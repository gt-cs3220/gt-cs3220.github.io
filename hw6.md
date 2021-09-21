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

Step2. 2x slowdown the blink speed

**What to submit:**

blink.v and xcd file. 

**Grading policy:**

We will only check whether you have submitted those two modified files. However, please understand how you can create a bitstream by following all the steps in the video. This is critical for you to learn it and test it on the board since you have to do that for project #3.  If you can't blink the board, you can't run a pipeline processor. 

**FAQ:**

[Q] Can I do this project with my project partner? 

[A] Yes 

[Q] How do I change the port name? 

First, you modify the line that contains ldr to ledr. Second, you modify blink.v ldr to ledr. Third, you rename your port in the block design and update all your designs. 















