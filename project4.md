# CS3220 Assignment #4:  BF16 Multiplier   

**Due date**: **11/12/2021 (F) : 6 pm**

This is a two-member group project. Please discuss this with the instructor if you do not have a partner. 

**Description**:

In this assignment, you will use PYNQ programming platforms with Vitis HLS, Vivado, Jupyter Notebook as we did in HW #10.

Please see HW #10 instruction. All steps in part#2 in Hw #10 have to be repeated for the code. 

Please check the file names, top modules etc. 

In this assignment, you will implement a BF16 format multiplier.


## Part-1
Complete the multiplier driver. We provide a frame for you to
start (mulbf16.ipynb). The steps to create driver are similar to HW #10.

You need to repeat the HE #10 steps to generate files.

You will have to modify the JupyterNotebook (.ipynb) file to ensure that the correct Overlay is selected.

## Part-2
Complete  mulBF16 which multiplies two BF16 variables.

**Please see 13.lec_fp.pptx file** to study the multiplier and BF16
format.
You need to support:
1. normalized numeric values (exp are not 0 or
exp are not all 1) 
2. integer 0. (i.e., only when both exp and frc
are 0).

Please be aware of that exp field has a bias and fraction has a hidden value 1.

A brief overview of floating point multiplication algorithm have been explained below, X1 and X2.

Floating points are represented as S (sign bit) E (Exponent) M (Mantissa) 

Result X3 = X1 * X2

= (-1)s1 (M1 x 2E1) * (-1) s2 (M2 x 2E2)

S1, S2 => Sign bits of number X1 & X2.

E1, E2: =>Exponent bits of number X1 & X2.

M1, M2 =>Mantissa bits of Number X1 & X2.

1. Check if one/both operands = 0 or infinity. Set the result to 0 or inf. i.e. exponents = all "0" or all "1".
 (please note that in this assignment, you don't need to handle INF cases.) 

2. S1, the signed bit of the multiplicand is XOR'd with the multiplier signed bit of S2. The result is put into the resultant sign bit.

3. The mantissa of the Multiplier (M1) and multiplicand (M2) are multiplied and the result is placed in the resultant field of the mantissa.  Please be aware that M1 and M2 have hidden 1. 
=M1 * M2 

4. The exponents of the Multiplier (E1) and the multiplicand (E2) bits are added and the bias value is subtracted from the added result. The subtracted result is put in the exponential field of the result block.
=E1+E2-bias

5. Normalize the sum, either shifting right and incrementing the exponent or shifting left and decrementing the exponent. e.g.)  if M1*M2 has carry out bit, shift right and increment the exponent. (Please note that since we don't support underflow cases in this assignment, you have only the shift right case. ) 

6. Check for underflow/overflow. If Overflow set the output to
infinity & for underflow set to zero. --> for this assignment, you can
skip this stage.

7. If (E1 + E2 - bias) >= to Emax then set the product to
infinity. --> you can skip this stage

8. If E1 + E2 - bias) is lesser than/equal to Emin then set product to
zero. --> you can skip this stage 

[https://www.rfwireless-world.com/Tutorials/floating-point-tutorial.html](https://www.rfwireless-world.com/Tutorials/floating-point-tutorial.html)

**What to submit**:

Submit your HLS code and Python code as a zip file. The zip file includes 

1) mulBF16.cpp
2) mul.h
3) mul16.tcl (which is generated in vivado step)
4) mul16.hwh (which is generated in vivado step)
5) mul16.bit (which is generated in vivado step)
6) mulbf16.ipynb
   


**Grading**:
We will test 5 cases similar to the example in the provided JupyterNotebook file. 2 points for each case. 

## Tips

* Please debug your code in C-mode . If you comment out pragmas, you can even compile the source code with c++ without using Vitis. We also provide Makefile just to compile c code in a terminal even without using vitis. If you follow the steps in HW#10 for project #4, running your code on pynq is straightforward. The issue is understanding IEEE FP formats. 
* Please complete your algorithm in C-mode and test it before porting the code in Vivado.
* Please start early and ask questions in Piazza. The TAs are also getting very busy so the responses won't be fast. 

## FAQ 

* [Q] For part-1, in the jupyter notebook how do we load in mul16.bit. I can't find that fine anywhere? Are we supposed to create it?
* [A]: Yes you need to create it. 
* [Q]mulbf16.ipynp says that '''overlay = Overlay('/home/xilinx/jupyter_notebooks/mul16/mul16.bit'''' but I don't see mul16 directory on my pynq board. Do I need to create it? 
* [Q] Can I modify the contents of mulbf16.ipynb file? 
* [A] Yes, you can look at mul_test.cpp for more test cases. 
* [Q] I see TODO in mulbf16.ipnyb file. What do I need to do? 
* [A]HW#10 part-1 step 10 shows where you can find the addresses for AXI data communication. You need to change 0x100 to something else such as 0x10, 0x18, 0x20. 
* [Q] Are we testing the exactly same case in the provided mulbf16 for grading or other test cases will be used? 
* [A] Other test cases can be used. You can look at mul_test.cpp for more test cases. 
* [A] Yes, you need to create mul16 directory on your ARM machine. Feel free to modify directory names or file locations. 
* [Q] Can we get some more instructions about edge cases in floating point multiplication? How do we define the behavior when ±0 × ±NaN, ±0 × ±INFINITE? Are they all equal to 0?
* [A] We only test 0 x value = 0 case. NAN, INFINITE are outside scope of this assignment.
* [Q] how do we define ±NaN ×±INIFNITE? 
* [A] You don't expect to support NAN and INFINITE in this assignment. only multiplying with 0 case needs to be supported.


* [Q] Mantissa Multiplication: I'm not sure what to do. 

* [A] The general logic is that you can use the product and right shift it by 2 * MANTISSA_BITS first and check if it's greater than 2. If it is, right shift by one more bit and add one to the exponent until it's less than 2 (which is basically 1)

* [Q] After I do the multiplication, how do I check that the value is greater than 2?

* [A] you need to right shift it to check. 

* [Q] Confused my expected values for examples
I've been debugging my BF multiplication and have been running into a lot of confusion with the mantissa multiplication. In the example where you multiply 16460 by 16892, where these numbers are BF16 format, I believe that the mantissa_a should be 76 and mantissa_b should be 124.   ```1.76 * 1.124 = 1.97824```  However, the notebook says the solution is 17096 which in binary is 0100001011001000. The mantissa here is b1001000 which in decimal is 72. Now maybe I'm just misunderstanding how to use the product of mantissa_a * mantissa_b, but I thought I'm supposed to take the digits after the decimal if the product is less than 2. In that case the result should be 97, not 72. I'm running into issues like this for every example except for the first 2 which deal with special cases.

* [A] Please shift the fraction value until the first 1 becomes the MSB bit.  And then the first 1 is implicit so drop it out and then rest of the values are stored in the mantissa.   Even if a value is less than 2, the fractions are not directly stored in the mantissa. 







