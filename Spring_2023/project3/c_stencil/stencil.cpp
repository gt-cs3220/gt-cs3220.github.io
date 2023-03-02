#include<iostream>

constexpr int ARRAT_SIZE=128;

void stencil5(const double *in, double *out, double h, int size)
{
    for (int i=2; i < size-2; i++)
        out[i] = (-in[i+2] + 8*in[i+1] - 8*in[i-1] + in[i-2]) / (12 * h);
}


int main(){
    double h = 0.05; // h stands for the minimal step that we samples from the function.
	double in[ARRAT_SIZE];
	double out[ARRAT_SIZE] = {0};

	// We choose the discrete points from a linear function y = 2*x,
    // therefore the derivative should be always 2. 
    for(int iter = 0; iter < ARRAT_SIZE; iter++){
		in[iter] = iter*0.1;
	}

	stencil5(in, out, h, ARRAT_SIZE);
	std::cout.precision(16);

	// print out derivative
	for(int i = 2; i < ARRAT_SIZE-2; i++){
		std::cout << "1D derivative at in[" << i << "] = " << out[i] << std::endl;
	}

    return 1;
}

