
#include "ap_axi_sdata.h"
#include "hls_stream.h"


void example(hls::stream< ap_axis<32,2,5,6> > &A,
	     hls::stream< ap_axis<32,2,5,6> > &B)
{
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B
#pragma HLS INTERFACE s_axilite port=return

	ap_axis<32,2,5,6> tmp;
    while(1)
    {
	A.read(tmp);
	tmp.data = tmp.data.to_int()+5;
	B.write(tmp);
     if(tmp.last)
     {
         break;
     }
    }


}


