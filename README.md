/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
```
//part 1
int adder(int a,int b){

	return a+b;
}

// now go to solutions/syn/verilog to see corresponding verilog


/*---------------------------------------------------------------------------------------------------------------------------------------------------*/

```

/*---------------------------------------------------------------------------------------------------------------------------------------------------*/

```
//part 2

// design
#include <ap_int.h>

ap_uint<3> ALU(ap_uint<3> a ,ap_uint<3> b ,ap_uint<2> c ) {

	if(c==0) {
		return a+b;
	}
	elseif(c==1) {
		return a-b;
	}
	elseif(c==2) {
		return a&b;
	}
	elseif(c==3) {
		return a^b;
	}
}

// testbench

#include <stdio.h>
#include <ap_int.h>

//instantiation
ap_uint<3> ALU(ap_uint<3> a, ap_uint<3> b, ap_uint<2> c);

int main() {
    ap_uint<3> a = 5; // 5 in 3-bit unsigned integer is 101
    ap_uint<3> b = 3; // 3 in 3-bit unsigned integer is 011
    ap_uint<2> c;
    ap_uint<3> result;

    // Test addition (c = 0)
    c = 0;
    result = ALU(a, b, c);

    printf("Addition: %d + %d = %d\n", (int)a, (int)b, (int)result);

    if (result != (a + b)) {
        printf("Error in addition\n");
    }

    // Test subtraction (c = 1)
    c = 1;
    result = ALU(a, b, c);

    printf("Subtraction: %d - %d = %d\n", (int)a, (int)b, (int)result);

    if (result != (a - b)) {
        printf("Error in subtraction\n");
    }
}

```
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/

```
// part 3 <using pragmas> for faster execution

	
// interfaces 1.axis(axi stream) 2. m_axi(axi master port) 2.bram and fifo when parameters are arrays
//#pragma HLS INTERFACE ap_none port=a
//#pragma HLS INTERFACE s_axilite port=a
//#pragma HLS INTERFACE AP_MEMORY or FIFO port=in_vec






#include <hls_stream.h>
#include <ap_int.h>

#define VECTOR_SIZE 1024

void vector_add(const int *a, const int *b, int *c, int size) {

//#pragma HLS PIPELINE II=1 II stands for initialization interval
//#pragma HLS UNROLL factor=4 this makes 4 iterations of the for loop run in parallel
    for (int i = 0; i < size; i++) {
        c[i] = a[i] + b[i];
    }
}




```
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/

```
// part 4 math stuff
#include "hls_math.h"
#include "ap_fixed.h"

#include <hls_math.h>

typedef struct {
  float x;
  float y;
} Point;

float distance(Point p1, Point p2) {
  #pragma HLS INTERFACE ap_none port=p1
  #pragma HLS INTERFACE ap_none port=p2
  float dx = p2.x - p1.x;
  float dy = p2.y - p1.y;
  // Use hls::sqrt for hardware-friendly implementation
  return hls::sqrt(hls::square(dx) + hls::square(dy)); 
}

}


```







