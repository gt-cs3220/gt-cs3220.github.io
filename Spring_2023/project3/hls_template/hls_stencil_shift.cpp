#include "hls_stencil_shift.hpp"

void stencil5(double in[ARRAT_SIZE], double out[ARRAT_SIZE], double h, int size)
{
#pragma HLS INTERFACE m_axi port = in offset = slave bundle = aximm1 latency = 300 num_read_outstanding = 128 num_write_outstanding=1
#pragma HLS INTERFACE m_axi port = out offset = slave bundle = aximm2 latency = 50  num_write_outstanding= 128 num_read_outstanding=1
/*
	student's code start here.
*/


}

