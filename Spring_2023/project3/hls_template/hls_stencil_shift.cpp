#include "hls_stencil_shift.hpp"

void stencil5(double in[ARRAT_SIZE], double out[ARRAT_SIZE], double h, int size)
{
#pragma HLS INTERFACE m_axi port = in offset = slave bundle = aximm1 latency = 300 num_read_outstanding = 128 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port = out offset = slave bundle = aximm2 latency = 50  num_write_outstanding= 128 num_read_outstanding=1
/*
	student's code start here.
*/
	double shift_reg[5];
	double divisor = 12*h;
	// #pragma HLS array_partition variable=shift_reg complete

	for(int i = 0; i < size+1; i++)
	{
	// #pragma HLS PIPELINE II=1
		double res = (shift_reg[4] - 8 * (shift_reg[3] - shift_reg[1]) - shift_reg[0]) / divisor;

		shift_reg[4] = shift_reg[3];
		shift_reg[3] = shift_reg[2];
		shift_reg[2] = shift_reg[1];
		shift_reg[1] = shift_reg[0];
		shift_reg[0] = in[i];

		if(i>5)
			out[i-2] = res;
	}

}

