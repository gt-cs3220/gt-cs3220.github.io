#define DIM 1

#ifndef _MUL


void mulFP(float a, float b, float &c);
void mulBF16(int a, int b, int &c);
float convertINTBF16toFloat(int a);
int convertfloattoINTBF16(float a); 

int pow_m1(int a); 
int pow2 (int a); 

#define _MUL
#endif 
