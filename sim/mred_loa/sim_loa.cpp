#include <iostream>
#include <bitset>
#include <cmath>
#include "adders.hpp"

using namespace std;

// ==============================================


int main(int argc, char const *argv[]) {
	// WARNING : DO NET SET THIS BITWIDTH WITH A VALUE ABOVE 13 BITS
	// ON A LINUX MINT 18.3  MACHINE WITH GCC 5.4, AN INTEL I7-4700 CPU AND 8 GB MEMORY
	// MY SYSTEM JUST CRASHED !
	for (int bitwidth = 1; bitwidth < 13; ++bitwidth){
	// NOW YOU'R ENTERING THE UNSAFE ZONE
	int scale_factor = pow(2,bitwidth-1) - 1;
	int max_lsb_width = bitwidth - 1;

	cout << "Bit width = " << bitwidth << " bits" << endl;
	for (int lsb_width = 0; lsb_width < max_lsb_width; ++lsb_width){
		double* mred_values = new double[scale_factor*scale_factor];
		for (int a = 1; a < scale_factor; ++a){
			for (int b = 1; b < scale_factor; ++b){
				// cout << a << "\t---->\t" << bitset<8>(a) << endl;
				// cout << b << "\t---->\t" << bitset<8>(b) << endl;
				int s_acc = acc_add(a, b);
				int s_app = loa_add(a, b, lsb_width);
				mred_values[a*scale_factor+b] = mred(s_acc,s_app);
			}
		}
		cout << "LSB Width = " << lsb_width
		     << " --> MRED " << 100 * mean(mred_values,scale_factor*scale_factor) << " \%"
			 << endl;
	}}
	return 0;
}

// ==============================================
