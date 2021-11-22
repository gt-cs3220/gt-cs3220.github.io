


#ifdef __SYNTHESIS__
#include "hls_stream.h"
#include "ap_axi_sdata.h"
#endif

#include "convolution.h"
#include <stdio.h>




void displayData( int *a, int size){

		for(int i = 0; i<size; i++){

				printf("%d ", a[i]); 

				}


				printf("\n");
}
			


#ifndef __SYNTHESIS__
void loadData1( int *A, int iter, int start, int end, int *buffer){

		

		for( int i =iter, j =start; j<end; j++, iter++){


				#pragma HLS pipeline II=1 

				buffer[j] = A[iter]; 

			}

}
#else
void loadData( int *buffer, hls::stream<ap_axis<32, 2,5,6>> &A, int start, int end){


	ap_axis<32,2,5,6> tmp;
	int index = start; 
	RECEIVING_INPUT:
    while(index < end)
    {
			A.read(tmp);
			buffer[index++] =tmp.data.to_int();
			

    }

}

#endif



void computeSum( int *img, int *kernel, int *localOutput, int kernel_height, int start){

		for(int i = 0, j =start; i<kernel_height; i++, j++){

				#pragma HLS pipeline II=1

				localOutput[i] = (img[j]* kernel[i]);
				}
}
				


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

    /*******************************************************/

    int height = TEST_IMG_COLS;
    int width =  TEST_IMG_ROWS;

    int border_height = (int)(KERNEL_HEIGHT-1)/2;
    int border_width = (int)(KERNEL_WIDTH-1)/2;





        // Clear dst frame buffer
    int padd_height = height + 2*border_height;
    int padd_width = width + 2*border_width;

	data_t rows[KERNEL_WIDTH][ padd_height ];
	data_t kernel[KERNEL_WIDTH][KERNEL_HEIGHT];
	data_t ii, jj, max_data_length;
	data_t local_output[KERNEL_WIDTH][KERNEL_HEIGHT];

	data_t outputImage[ TEST_IMG_ROWS*TEST_IMG_COLS];


	

	for(int i = 0; i<padd_height; i++){
		#pragma HLS pipeline II=1
		rows[0][i] = 0;
	}





		#pragma HLS ARRAY_PARTITION variable = kernel dim =1

		#pragma HLS ARRAY_PARTITION variable = local_output dim =1
		#pragma HLS ARRAY_PARTITION variable = rows
	
	/*
	KENEL_INIT:
	for (int aa = 0; aa < KERNEL_SIZE; aa++){
		if (aa == 4 ) kernel[aa] = 1;  // assume kernel is 3x3
		else kernel[aa] = 0;
	}

	*/



#ifndef __SYNTHESIS__
	int count = 0, iter = 0; 

	for(int i =0, j = 0; iter<KERNEL_SIZE; iter++, j++){

			#pragma HLS pipeline II=1

			if( j == KERNEL_HEIGHT){
				j= 0; 
				i++;
				}
				kernel[i][j] = A[iter];

		}

		count =iter;
	


	loadData1( A, count, border_height, border_height+TEST_IMG_COLS, rows[1]); 

	loadData1( A, count,   border_height, border_height+TEST_IMG_COLS, rows[2]); 


		for(int i = 0;  i <KERNEL_WIDTH; i++){
				for(int j = 0; j<KERNEL_HEIGHT; j++){

					printf(" %d ", kernel[i][j]); 

				}

				printf("\n");
		}
					
		//dispayData( kernel, KERNEL_SIZE); 
		displayData( rows[0], padd_height);
		displayData( rows[1], padd_height);

		displayData( rows[2], padd_height);


#else

	ap_axis<32,2,5,6> tmp;
	ii = 0; jj = 0;
	int iter = 0; 

	for(int i = 0; i<KERNEL_WIDTH; i++){

			for(int j = 0; j<padd_height; j++){

				#pragma HLS pipeline II=1
				rows[i][j] = 0; 
				}
		}
	RECEIVING_KERNEL:
    while(iter < KERNEL_SIZE)
    {
			A.read(tmp);

			if( jj == KERNEL_HEIGHT){
				jj = 0; ii++;
			}
			kernel[ii][jj]=tmp.data.to_int();
			iter++;
			

    }



	loadData( rows[1], A, border_height, border_height+TEST_IMG_COLS); 

	loadData( rows[2],A,  border_height, border_height+TEST_IMG_COLS); 

		#if DEBUG
		dispayData( kernel, KERNEL_SIZE); 
		displayData( rows[0], padd_height);
		displayData( rows[1], padd_height);

		displayData( rows[2], padd_height);


		printf("\n");

		#endif


#endif
    max_data_length = ii;


		for(int i =0; i< (padd_width -KERNEL_WIDTH) ; i++){

					// compute the first 3 rows first


					for(int j = 0; j<=( padd_height - KERNEL_HEIGHT); j++){

								for( int k = i,p = 0 ; k<i+KERNEL_WIDTH; k++, p++){

									#pragma HLS unroll
									computeSum( rows[k%KERNEL_WIDTH], kernel[p], local_output[p],KERNEL_HEIGHT, j);
								}

								// merge the output

								int tmp = 0; 
								for(int x = 0, y =0, iter = 0; iter<KERNEL_SIZE; iter++, y++){

										#pragma HLS pipeline II=1
										if( y == KERNEL_HEIGHT){
											y =0; x++;}
										tmp+= local_output[x][y];
								}

								outputImage[ i*height+j] = tmp;
					}


					#ifndef __SYNTHESIS__

						loadData1( A, count,   border_height, border_height+TEST_IMG_COLS, rows[i]); 
					#else
						loadData( rows[i], A, border_height, border_height+TEST_IMG_COLS);
					#endif

		}

				
					for(int j = 0; j<=( padd_height - KERNEL_HEIGHT); j++){

								for( int k = (padd_width-KERNEL_WIDTH),p = 0 ; k<padd_width; k++, p++){

									#pragma HLS unroll
									computeSum( rows[k%KERNEL_WIDTH], kernel[p], local_output[p],KERNEL_HEIGHT, j);
								}

								// merge the output

								int tmp = 0; 
								for(int x = 0, y =0, iter = 0; iter<KERNEL_SIZE; iter++, y++){

										#pragma HLS pipeline II=1
										if( y == KERNEL_HEIGHT){
											y =0; x++;}
										tmp+= local_output[x][y];
								}

								outputImage[ ( padd_width - KERNEL_WIDTH)*height+j] = tmp;
					}





















    /*********************************************************************/
    /* sending data */

#ifndef __SYNTHESIS__
     for (int ii=0 ; ii < IMAGE_SIZE; ii++)
    	 B[ii] = outputImage[ii];


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


/*
 *
 * working example DMA Transfer
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

*/
