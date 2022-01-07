

void comm(int a, int b, int& c , int& d, int in1, int in2, int &out1, int &out2) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=a
#pragma HLS INTERFACE s_axilite port=b
#pragma HLS INTERFACE s_axilite port=c
#pragma HLS INTERFACE s_axilite port=d
//#pragma HLS INTERFACE s_axilite port=return

	out1 = a;
	out2 = b;

    c = in1;
    d = in2;

    return ;
}
