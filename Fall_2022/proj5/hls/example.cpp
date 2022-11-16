


#ifdef __SYNTHESIS__
#include "hls_stream.h"
#include "ap_axi_sdata.h"
#endif

#include "convolution.h"

#define MAX_BUFF_SIZE 16000

#ifndef __SYNTHESIS__
void example(int *A , int *B)
#else
void example(hls::stream< ap_axis<32,2,5,6> > &A,
	     hls::stream< ap_axis<32,2,5,6> > &B)
#endif

{
#pragma HLS INTERFACE axis port=A
#pragma HLS INTERFACE axis port=B
#pragma HLS INTERFACE s_axilite port=return

	int local_in_buffer[MAX_BUFF_SIZE];
	int local_out_buffer[MAX_BUFF_SIZE];
	int kernel[KERNEL_SIZE];
	int ii, jj, max_data_length;

	jj = 0;
	KENEL_INIT:
	for (int aa = 0; aa < KERNEL_SIZE; aa++){
		if (aa == 4 ) kernel[aa] = 1;  // assume kernel is 3x3
		else kernel[aa] = 0;
	}

#ifndef __SYNTHESIS__

	for (int ii = 0 ; ii <(IMAGE_SIZE+KERNEL_SIZE); ii++){
		if (ii < IMAGE_SIZE)
			local_in_buffer[ii] = A[ii];
		else
			kernel[jj++] = A[ii];
	}

#else

	ap_axis<32,2,5,6> tmp;
	ii = 0; jj = 0;

	RECEIVING_INPUT:
    while(1)
    {
	A.read(tmp);
	if (ii >= IMAGE_SIZE){
		kernel[jj++] = tmp.data.to_int();
		ii++;
	}
	else {
		local_in_buffer[ii++] = tmp.data.to_int();
	}

	if(tmp.last)
     {
         break;
     }
    }

#endif
    max_data_length = ii;

    /*******************************************************/

    int height = TEST_IMG_COLS;
    int width =  TEST_IMG_ROWS;

    int border_height = (int)(KERNEL_HEIGHT-1)/2;
    int border_width = (int)(KERNEL_WIDTH-1)/2;

    #if DEBUG
    printf("boarder_height:%d border_width:%d\n", border_height, border_width);
    #endif


    int dst[TEST_IMG_ROWS*TEST_IMG_COLS];
    int padded_dst[(TEST_IMG_ROWS+KERNEL_HEIGHT)*(TEST_IMG_COLS+KERNEL_WIDTH)];


        // Clear dst frame buffer
    int padd_height = height + 2*border_height;
    int padd_width = width + 2*border_width;
    #if DEBUG
        printf("width:%d height:%d padd_width:%d padd_height:\%d\n", width, height, padd_width, padd_height);
    #endif
            Clear_dst:for(int i = 0; i < height * width; i++){
                local_out_buffer[i]=0;
            }
            Clear_padded:for(int i = 0; i < padd_height * padd_width; i++){
                padded_dst[i]=0;
            }
            paddI:for(int i = 0; i < height ; i++){
                paddJ:for (int j = 0 ; j < width ; j++){
                    int pos = i*width + j;
                    int new_pos = (i + border_height) * padd_width + (j + border_width);
                    padded_dst[new_pos]=local_in_buffer[pos];

                #if DEBUG
                printf("[%d] [%d] goes into [%d][%d], orig_pos:%d new_pos:%d \n", i, j, (i+border_height), (j+ border_width), pos, new_pos);
                #endif

                }
            }
        // pad images


            // Horizontal convolution pass - makes O(K*K) reads from input image
               // per output pixel
                convR:for(int row = border_height; row < height+border_height ; row++){
                  convC:for(int col = border_width; col < width+border_width ; col++){
                   	   int pixel = (row-border_height) * width + (col-border_width);
                          #if DEBUG
                	    printf("col:%d row:%d output pixel loc is %d:\n ", col, row, pixel);
                        #endif

    #pragma HLS unroll
                	    data_t tmp= 0;
                       KERNELH:for(int i = 0; i < KERNEL_WIDTH; i++){
                    	   KERNELW:for (int j = 0; j< KERNEL_HEIGHT; j++){

                    		   int src_loc = (row - border_height)*padd_width + (col-border_width) + j + (i)*padd_width;
                    		   int kernel_loc = j + i * KERNEL_HEIGHT ;

                                tmp += padded_dst[src_loc] * kernel[kernel_loc];
                                #if DEBUG
                                printf("output[%d]:%d += padded[%d]:%d * kernel[%d]:%d  src[%d]:%d \n",
                        		   pixel, dst[pixel], src_loc, padded_dst[src_loc], kernel_loc, kernel[kernel_loc], pixel, src[pixel]);
                                   #endif

                    	   }

                       }
                       	   local_out_buffer[pixel] = tmp;
                       #if DEBUG
    		       printf("==============\n");
                   #endif
                   }

               }



    /*
    while (jj < max_data_length){
    	local_out_buffer[jj] = local_in_buffer[jj];
    	jj = jj + 1;
    }
    */

    /*********************************************************************/
    /* sending data */

#ifndef __SYNTHESIS__
     for (int ii=0 ; ii < IMAGE_SIZE; ii++)
    	 B[ii] = local_out_buffer[ii];


#else

    jj = 0;

    // clear last bit since the last incoming has last bit set
    tmp.last=0;

    SENDING_OUTPUT:
    while (jj < IMAGE_SIZE){
    	// debugging
    	// tmp.data =  local_in_buffer[jj];
    	 tmp.data =  local_out_buffer[jj];

    	// send the last bit when it reaches the image size or when it reaches the max data received
    	if (jj == (max_data_length-1) ||
    			(jj == (IMAGE_SIZE-1))) tmp.last = 1;
    	B.write(tmp);
    	jj++;
    	if (tmp.last == 1) break;
    }

#endif
}


