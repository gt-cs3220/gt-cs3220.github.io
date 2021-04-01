#include "mul.h"
#include <stdio.h> 





void mulBF16(int a, int b, int & c) {

#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=a
#pragma HLS INTERFACE s_axilite port=b
#pragma HLS INTERFACE s_axilite port=c

	int a_t, b_t, c_t;
	int exponent_a, exponent_b, exponent_c, exponent_c_raw;
	int mantissa_a, mantissa_b, mantissa_c, raw_m_ab;
	int sign_bit_a, sign_bit_b, sign_bit_c; 

	a_t = a;
	b_t = b;

/* you need to complete this code */

			

	return;
}

void mulFP(float a, float b, float &c) {

	c = a*b;
}
