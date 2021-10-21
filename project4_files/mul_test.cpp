#include "mul.h"
#include <stdio.h>
#include <sys/time.h>
#include <iostream>
#include <unistd.h>

using namespace std; 

// #define DEBUG 

#define NTH_BIT(b, n) ((b) & (0x1 << n) ? 1 : 0)

#define BYNARY_FMT "%u%u%u%u%u%u%u%u"

#define SEVENBIT_FMT "%u%u%u%u%u%u%u"

#define BYTE_TO_BIN(b) ((b) & 0x80 ? 1 : 0),\
                       ((b) & 0x40 ? 1 : 0),\
                       ((b) & 0x20 ? 1 : 0),\
                       ((b) & 0x10 ? 1 : 0),\
                       ((b) & 0x08 ? 1 : 0),\
                       ((b) & 0x04 ? 1 : 0),\
                       ((b) & 0x02 ? 1 : 0),\
                       ((b) & 0x01 ? 1 : 0)
					   
#define SEVENBIT_TO_BIN(b) ((b) & 0x40 ? 1 : 0),\
                       ((b) & 0x20 ? 1 : 0),\
                       ((b) & 0x10 ? 1 : 0),\
                       ((b) & 0x08 ? 1 : 0),\
                       ((b) & 0x04 ? 1 : 0),\
                       ((b) & 0x02 ? 1 : 0),\
                       ((b) & 0x01 ? 1 : 0)

#define BIT_FMT "%u"

float random_fa[50] =  {0.0, 1.0, 3.1875, 2.75, 6.375, 3.0, 9.5625, 4.0, 12.75, 5, \
                       16, 6,   19.125, 7,   22.375, 8, 25.5, 9.0,  28.75, 38.25,\
                       44.75 ,1.593750, 4.78125, 64.0, 4.78125, 65.0, 8.0, 66.0, 11.1875, 67.0,\
                       14.375, 68.0, 17.5, 69.0, 20.75, 70.0, 24.0, 71.0, 27.125, 72.0,\
                       30.375, 4.0, 0.796875,95.0, 4.0, 96.0, 7.1875, 97.0, 10.375, 98.0 }; 

float random_fb[50] = {0.0, 1.0, 1.25, 1.5625, 97.0, 92.5, 16.3750, 12.375, 21.6, 4.78125,\
                       13.5625, 99.0, 16.75, 0.699219, 2.796875, 1.695312, 6.0, 2.6875, 9.1875,3.6875, \
                       12.375, 4.6875, 15.5625, 5.6875, 18.75, 6.6875, 22.0, 7.6875, 25.125, 8.6875, \
                       28.375, 9.6875, 31.5, 10.6875, 34.75, 11.6875, 38.0, 12.6875, 41.0, 13.6875, \
                       44.25, 14.6875, 47.5, 15.6875, 50.75, 16.625, 54.0, 17.625, 57.0, 11.5625} ;

                       
float mtofrac(int m0){

	float fraction = 1 +  (float)(NTH_BIT(m0,6)) * 1/2 + \
                             (float)NTH_BIT(m0, 5) * 1/4 + \
                             (float)NTH_BIT(m0, 4) * 1/8 + \
                             (float)NTH_BIT(m0, 3) *1/16 + \
                             (float)NTH_BIT(m0, 2)*1/32 + \
                             (float)NTH_BIT(m0, 1)*1/64 + \
                             (float)NTH_BIT(m0, 0)*1/128; 

    // printf(" frac:%f\n", fraction); 
    return fraction; 
}

union FloatingPointIEEE754 {
	struct {
		unsigned int m: 23;
		unsigned int e: 8;
		unsigned int s: 1;
	} raw;
	float f;
} ieee754;

union BF16 {
	struct {
		unsigned int m: 7;
		unsigned int e: 8;
		unsigned int s: 1;
	} raw;
} BF16;


int convertfloattoINTBF16(float a)
{

	ieee754.f = a; 
    
	BF16.raw.m=((ieee754.raw.m)&(0x7f << 16))>>16;
        BF16.raw.e= (ieee754.raw.e); 
        BF16.raw.s = ieee754.raw.s; 
// conversion 
    int Bf16_int = BF16.raw.s<<15 | BF16.raw.e<<7 | BF16.raw.m ; 

// debugging print 
#ifdef DEBUG 
	float ff = pow_m1(BF16.raw.s) * pow2(BF16.raw.e-127)) * (mtofrac(BF16.raw.m));

    printf("FP32: %f BF16: %f \n",a ,  ff);


	printf("FP32: "
		BIT_FMT " "
		BYNARY_FMT " "
		BIT_FMT BIT_FMT BIT_FMT BIT_FMT BIT_FMT BIT_FMT BIT_FMT BYNARY_FMT BYNARY_FMT "\n",
		
		// SIGN
		NTH_BIT    (ieee754.raw.s      , 0),
		
		// EXPONENT
		BYTE_TO_BIN(ieee754.raw.e         ),
		
		// MANTISSA
		NTH_BIT    (ieee754.raw.m >> 16, 6),
		NTH_BIT    (ieee754.raw.m >> 16, 5),
		NTH_BIT    (ieee754.raw.m >> 16, 4),
		NTH_BIT    (ieee754.raw.m >> 16, 3),
		NTH_BIT    (ieee754.raw.m >> 16, 2),
		NTH_BIT    (ieee754.raw.m >> 16, 1),
		NTH_BIT    (ieee754.raw.m >> 16, 0),
		BYTE_TO_BIN(ieee754.raw.m >> 8    ),
		BYTE_TO_BIN(ieee754.raw.m         )
	);

 
    printf( "BF16: "
         BIT_FMT " " 
         BIT_FMT "" 
         BIT_FMT "" 
         BIT_FMT "" 
         BIT_FMT "" 
         BIT_FMT "" 
         BIT_FMT "" 
         BIT_FMT "" 
         BIT_FMT " " 
       
        SEVENBIT_FMT "\n",\

        NTH_BIT(Bf16_int, 15),\

        NTH_BIT(Bf16_int, 14),\
        NTH_BIT(Bf16_int, 13),\
        NTH_BIT(Bf16_int, 12),\
        NTH_BIT(Bf16_int, 11),\

        NTH_BIT(Bf16_int, 10),\
        NTH_BIT(Bf16_int, 9),\
        NTH_BIT(Bf16_int, 8),\
        NTH_BIT(Bf16_int, 7),\

        NTH_BIT(Bf16_int, 6),\
        NTH_BIT(Bf16_int, 5),\
        NTH_BIT(Bf16_int, 4),\
        NTH_BIT(Bf16_int, 3),\
        NTH_BIT(Bf16_int, 2),\
        NTH_BIT(Bf16_int, 1),\
        NTH_BIT(Bf16_int, 0));
#endif 
        return Bf16_int; 
}


int main()
{
    int ii; 


    int error_count = 0; 

    float a_bf16_SW;
    float b_bf16_SW;
    float c_bf16_SW;

    int a_bf16_HW;
    int b_bf16_HW;
    int c_bf16_HW;


    for (ii = 0; ii <50; ii++){
            a_bf16_SW = random_fa[ii];
            b_bf16_SW = random_fb[(ii+30)%50];
            c_bf16_SW = 0.0;
            a_bf16_HW = convertfloattoINTBF16(a_bf16_SW);
            b_bf16_HW = convertfloattoINTBF16(b_bf16_SW);
            c_bf16_HW = 0;

   
            mulBF16(a_bf16_HW, b_bf16_HW, c_bf16_HW);

            mulFP(a_bf16_SW, b_bf16_SW, c_bf16_SW);

            int ss=convertfloattoINTBF16(c_bf16_SW);


            int delta = (ss > c_bf16_HW) ? (ss-c_bf16_HW): c_bf16_HW-ss;

            if (delta > 1 ) {
                  error_count++;
                  printf("ERROR-----hw:%d sw:%d\n", c_bf16_HW, ss);
            }
            printf("a:%d b:%d hw:%d sw:%d\n", a_bf16_HW, b_bf16_HW, c_bf16_HW, ss);
    }

    if (!error_count) {
        printf("=============SUCCESS=============\n");
    }
    else
    	printf("===========Fail!!!================\n");
}

