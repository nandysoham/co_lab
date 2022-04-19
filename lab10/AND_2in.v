// Writing HDL code for 2-input OR gate with inputs size 1-bit
// y = a AND b

module AND_2in(a,b, y);

input a, b;
output y; 

assign y = a & b; // a & b; 

endmodule 