// S = A + B + Cin; 
// A and B are 31-bits, Cin is single bit
//Output S is  32-bits


module ANDORNOR(A,B, S1, S2, S3);
input [31:0]A,B; // inputs 
output [32:0]S1, S2, S3;

wire [32:0]C; 

genvar i; 

generate 

for (i = 0; i < 32; i= i+1) begin : FA  
	OR_2in _or(.a(A[i]), .b(B[i]), .y(S1[i]));
    AND_2in _and(.a(A[i]), .b(B[i]), .y(S1[i]));
	NOR_2in _nor(.a(A[i]), .b(B[i]), .y(S1[i]));

end

endgenerate


endmodule