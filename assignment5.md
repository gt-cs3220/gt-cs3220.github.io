# CS3220 Assignment #5:  Overlay project  

**Due date**: **4/23/2021 (F) : 6 pm**

This is a two-member group project. Please discuss this with the instructor if you do not have a partner. 

**Description**:

In this assignment, you will use PYNQ programming platforms with Vitis HLS, Vivado, Jupyter Notebook as we did in lab #5.

Please see lab #5 instruction. All steps in part#2 in Lab #5 have to be repeated for the code. 

Please check the file names, top modules etc. 

In this assignment, you will implement a BF16 format multiplier.


## Part-1
Complete the multiplier driver. We provide a frame for you to
start (mulbf16.ipynb). The steps to create driver are similar to lab 5.

You need to repeat the lab #5 steps to generate files.

You will have to modify the JupyterNotebook (.ipynb) file to ensure that the correct Overlay is selected.

## Part-2
Complete  mulBF16 which multiplies two BF16 variables.

**Please see 7.lec_fp.pptx file** to study the multiplier and BF16
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
Submit your HLS code and Python code. 
A screenshot of JupyterNotebook output.
(Note submission guidelines will likely be updated, when that happens a Piazza announcement will be made)


**Grading**:
We will test 5 cases similar to the example in the provided JupyterNotebook file. 2 points for each case. 

## Tips

* Please debug your code in C-mode. If you comment out pragmas, you can even compile the source code with c++ without using Vitis.
* Please complete your algorithm in C-mode and test it before porting the code in Vivado.
* Please start early and ask questions in Piazza. Usually with Assignment 5 we get a lot of questions and the TAs are not able to respond to each question rapidly.
