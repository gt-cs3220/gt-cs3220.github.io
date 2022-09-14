# CS 3220 Project#1: Bubble Sort

**Where to submit**: **Canvas** 

In this assignment, you will implement a simplified serial version of bubble sort in Verilog. 

    $ git clone --depth=1 https://github.com/gt-cs3220/gt-cs3220.github.io.git   
    $ cd gt-cs3220.github.io/Fall_2022/proj1

To reduce the complexity of the problem, your solution needs to only work with **10 number of items**. 

Starting from the location 0x00, each element has 2 bytes data. 

Once the simulation is ended, please set "done" signal as 1. 

An example algorithm of serial bubble sort is as following.  

```
 % Initialization 
  for j in 1 to Num_of_data-1 do 
    for i in 1 to Num_of_data-j do 
	    read mem(i)    // state-1 
	    read mem(i+1)  // state-2
      compare mem(i) with mem(i+1); // state-3 
      if mem(i) > mem(i+1) then swap = 1; // state-4 
	    if (swap)
		      Write swapped_data in mem(i) // state-5 
      if (swap)
         	Write swapped_data in mem(i+1)  // state-6     
    end for;
  end for;  
```

**Please use the memory that has only 1 read port and 1 write port.** 
When the memory is used for read, "rd_en==1".


Test code will read the memory locations to check whether the sort is correctly performed. 

**We have provided the testbench code (testbench.v).** 

Hint: draw a state diagram including i and j value increment, understanding 6 states in the algorithm provided above will be a good start. **(please do not use for loops inside the module)** 

**What to submit:**
1. **bubblesort.v**

**do not modify the I/O ports on the module**

**How to test the correctness**: Please check the display values. It should print out sorted memory values. 

**Grading Policy**: 

(8 points) functionality of the code: if you pass the provided test code, you will get 5 points. 

(3 points) Design specification:
 memory has only 1 read port and 1 write port. 
If your code does not meet this design specification, you will lose 3 points. 

(-1 point) If you do not submit all the required files you will loose 1 point. If your source code files are included in your zip file and if you 
submit all the files in your project directory, you should be sufficient. 

**Partial grading Policy**: Partial grade points are very limited. Hence, please check whether the sorted memory values are printed before submission. 
 
**FAQ** 

(1) How to increase the duration of simulation? 

The default Vivado setting is 1,000ns 

A:
<img src = "figs/vivado_simulation_time.png" width="400"> 

(2) I passed the provided testing code. 

Do I need to test other inputs to see whether it works on other cases ? 

A: No, we will test your code only with the provided test code. Please make it sure the values are sorted even if you see the message of "Congradulation it works !!!!". The congratulation message is might have false positive message, so you should check whether the datas are indeed sorted or not. 

(3) What does mean that the memory has only 1 read and 1 write port? 

A: This means, you are not supposed to read mem(i) and mem(i+1) at the same cycle. 
In one clock cycle, you can either read one memory value. 
It applies to the write behavior as well. You cannot write mem(i) and mem(i+1) at the same cycle.

for example the following code is the example that you are using two dmem read and write ports. You should not do that. 

```
always @(posedge clk or posedge reset) begin
if (we) begin 
  dmem[i]   <= dmem[i+1];
  dmem[i+1] <= dmem[i];
  end 
end 
```

other information (https://www.intel.com/content/www/us/en/programmable/support/support-resources/design-examples/design-software/verilog/ver-single-port-ram.html)

(4) If Q(3) code is not allowed, how can I do swap? 

A: You can create other  structures  to keep the value just like temp 


(5) OK, I passed the test code. Do I need to worry about anything else? 

A: Please make it sure whether you have used only one memory read and one write port requirement.  Please make it sure whether values are correctly sorted. 

(6) What's the behavior of reset? 

A: It should initialize your states. 

(7) I submmited bublesort.v and then I realized that I made a mistake, so I submitted a new file. The name is automatically changed to bubblesort-1.v.
Is that OK? 

A: Yes. 

(8) The memory has only one read/write port. But in the code, 

```
    assign dat_out0 = dmem[0];
    assign dat_out1 = dmem[1];
    assign dat_out2 = dmem[2];
    assign dat_out3 = dmem[3];
    assign dat_out4 = dmem[4];
    assign dat_out5 = dmem[5];
    assign dat_out6 = dmem[6];
    assign dat_out7 = dmem[7];
    assign dat_out8 = dmem[8];
    assign dat_out9 = dmem[9];
```

Does it mean that it has 10 read ports? 

A: This code is just for debugging/testing purpose, we added that. The actual bubble sort code. you should folllow the design requirements of using only 1 read and 1 write port. 
        
(9) Project setup: I'm creating the new project with the bubblesort.v file and ex1.mem as the source files, and then test.v as a simulation source? Is this how our project should be initialized?

A: Yes 

(10) What's the purpose of 'rd_en' signal? 

A: It indicates that read is enable.
