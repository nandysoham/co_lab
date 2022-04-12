
module Half_Adder(a, b, Sum, Carry);

input a, b; // a and b are inputs with size 1-bit
output Sum, Carry; // Sum and Carry are outputs with size 1-bit

assign Sum = a ^ b; 
assign Carry = a & b; 

endmodule