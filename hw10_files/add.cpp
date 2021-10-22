
#include "adder.h"

void add(int a, int b, int& c) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=a
#pragma HLS INTERFACE s_axilite port=b
#pragma HLS INTERFACE s_axilite port=c
//#pragma HLS INTERFACE s_axilite port=return

        c = a + b;
        return ;
}
