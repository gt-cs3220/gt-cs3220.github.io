/*
 * Copyright 2020 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <iostream>
#include <cstdlib>

#ifdef __SYNTHESIS__
#include "ap_axi_sdata.h"
#include "hls_stream.h"
#endif

#include "convolution.h"


using namespace std;

#ifndef __SYNTHESIS__
void example(int *A, int *B);
#else
void example(hls::stream< ap_axis<32,2,5,6> > &A, hls::stream< ap_axis<32,2,5,6> > &B);
#endif

int main(void)
{
    data_t * const src_img = new data_t[TEST_IMG_ROWS*TEST_IMG_COLS];
    data_t * ref_img = new data_t[TEST_IMG_ROWS*TEST_IMG_COLS];
    data_t * const kernel = new data_t[KERNEL_HEIGHT*KERNEL_WIDTH];

    int send_data[TEST_IMG_ROWS*TEST_IMG_COLS + KERNEL_SIZE];
    int rec_data[TEST_IMG_ROWS*TEST_IMG_COLS];

#ifdef __SYNTHESIS__
    hls::stream<ap_axis<32,2,5,6> > A, B;
    ap_axis<32,2,5,6> tmp1, tmp2;
#endif

    const int chkr_size = 5;
    const data_t max_pix_val = 255;
    const data_t min_pix_val = 0;
    int err_cnt = 0;
    int ret_val = 20;

    // Generate the source image with a fixed test pattern - checker-board
    for (int i = 0; i < TEST_IMG_ROWS; i++) {
        data_t chkr_pair_val[2];
        if ((i / chkr_size) % 2 == 0) {
            chkr_pair_val[0] = max_pix_val; chkr_pair_val[1] = min_pix_val;
        } else {
            chkr_pair_val[0] = min_pix_val; chkr_pair_val[1] = max_pix_val;
        }
        for (int j = 0; j < TEST_IMG_COLS; j++) {
            data_t pix_val = chkr_pair_val[(j / chkr_size) % 2];
            src_img[i * TEST_IMG_COLS + j] = pix_val;
        }
    }

    // generate I kernel
    for (int i = 0; i <KERNEL_HEIGHT; i++ )
    	for (int j = 0; j < KERNEL_WIDTH; j++){
    		int val;
    		if ((i == (int)(KERNEL_HEIGHT/2)) &&  (j == (int)(KERNEL_WIDTH/2)))
    			val = 1;
    		else val = 0;
    		kernel[i*KERNEL_HEIGHT + j] = val;
    		printf("kernel i:%d j:%d val:%d \n", i, j, val);
    	}

    // create a data structure to pass to example.
    int jj = 0;
    for (int ii = 0 ; ii < (IMAGE_SIZE + KERNEL_SIZE); ii++){

#ifndef __SYNTHESIS__
    	if (ii <IMAGE_SIZE)
    		send_data[ii] = src_img[ii];
    	else
    		send_data[ii] = kernel[jj++];
#else
    	if (ii < IMAGE_SIZE) {
    		tmp1.data = src_img[ii];
    	}

    	tmp1.data = kernel[ii-IMAGE_SIZE];
    	tmp1.keep = 1;
    	tmp1.strb = 1;
    	tmp1.user = 1;
    	tmp1.last = 0;
    	tmp1.id = 0;
    	tmp1.dest = 1;

    	if (ii == (IMAGE_SIZE+KERNEL_SIZE))
    		tmp1.last = 1;

    	A.write(tmp1);
    	example(A,B);
    	// B.read(tmp2);

    //}
#endif

}

#ifndef __SYNTHESIS__
	example(send_data,rec_data);

	for (int ii = 0; ii <IMAGE_SIZE; ii++)
		ref_img[ii] = rec_data[ii];

#endif

    // Check DUT vs reference result
    for (int i = 0; i < TEST_IMG_ROWS; i++) {
        for (int j = 0; j < TEST_IMG_COLS; j++) {
        	data_t orig_val = src_img[i*TEST_IMG_COLS + j];
            data_t ref_val = ref_img[i*TEST_IMG_COLS + j];
#if 0
            cout << "i:" << i;
            cout <<"  j:" <<jj;
            cout <<"  " ;
            cout <<" orig_val: " << orig_val; 
            cout <<" ref_val: " << ref_val;
            cout << endl; 
#endif
            if (orig_val != ref_val) {

                err_cnt++;
#if 0
                cout << "!!! ERROR: Mismatch detected at coord(" << i;
                cout << ", " << j << " ) !!!";
                cout << endl;
#endif
            }
        }
    }
    cout << endl;

    if (err_cnt == 0) {
        cout << "*** TEST PASSED ***" << endl;
        ret_val = 0;
    } else {
        cout << "!!! TEST FAILED - " << err_cnt << " mismatches detected !!!";
        cout << endl;
        ret_val = -1;
    }

    delete [] src_img;
    delete [] ref_img;

    return ret_val;
}





