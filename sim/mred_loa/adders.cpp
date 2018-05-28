#include <bitset>
#include <cmath>
#include "adders.hpp"

int acc_add(int a, int b){
	return a+b;
}

int loa_add(int a, int b, int lsb_width){
	int lsb_mask = 0x00;
	switch (lsb_width) {
		case 1 : lsb_mask = 0x01; break;
		case 2 : lsb_mask = 0x03; break;
		case 3 : lsb_mask = 0x07; break;
		case 4 : lsb_mask = 0x0F; break;
		case 5 : lsb_mask = 0x1F; break;
		case 6 : lsb_mask = 0x3F; break;
		case 7 : lsb_mask = 0x7F; break;
		case 8 : lsb_mask = 0xFF; break;
	}
	int msb_mask = ~(lsb_mask);
	// cout  << "lsb_mask --->\t" << bitset<8>(lsb_mask) << endl;

	int lsb_a = a & lsb_mask;
	int lsb_b = b & lsb_mask;

	int msb_a = a & msb_mask;
	int msb_b = b & msb_mask;

	int lsb_c = lsb_a | lsb_b;
	int msb_c = msb_a + msb_b;

	if (((lsb_a >> lsb_width-1) & 1) & ((lsb_a >> lsb_width-1)  & 1)){
			msb_c += pow(2,(lsb_width-1));
	}

	// cout  << "mmask \t--->\t" << bitset<8>(msb_mask) << endl;
	// cout  << "lmask \t--->\t" << bitset<8>(lsb_mask) << endl;
	//
	// cout  << "lsb_a \t--->\t" << bitset<8>(lsb_a) << endl;
	// cout  << "lsb_b \t--->\t" << bitset<8>(lsb_b) << endl;
	// cout  << "msb_a \t--->\t" << bitset<8>(msb_a) << endl;
	// cout  << "msb_b \t--->\t" << bitset<8>(msb_b) << endl;
	// cout  << "lsb_c \t--->\t" << bitset<8>(lsb_c) << endl;
	// cout  << "msb_c \t--->\t" << bitset<8>(msb_c) << endl;

	int c = msb_c + lsb_c ;
	// cout << c << "\t---->\t" << bitset<8>(c) << endl;
	return c;
}

double mred (int accurate_sum, int approx_sum){
	return  abs((double) accurate_sum - (double) approx_sum)/(double) accurate_sum;
}

double mean(double* array, int array_size){
	double sum = 0.0;
	for (int i=0; i<array_size; ++i){
		sum += array[i];
	}
	return sum/array_size;
}
