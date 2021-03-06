// S = A + (-1)^k B  = A + k XOR B + k
// A and B are N-bits, k is single bit
//Output S is  N+1-bits


module Add_Sub_32bit #(parameter N=31)(A,B, k, S);
//parameter N = 31;
input [N-1:0]A,B; // inputs are N-bits
input k; // sign bit 
output [N:0]S; // output is N+1-bits 

wire [N+1:0]C; // N+1 bits 

wire [N:0] A1, B1;
wire [N:0]xB;


assign A1 = {A[N-1],A}; // same size as output 
assign B1 = {B[N-1],B};

assign xB = k?~B1:B1; // k XOR B1


assign C[0] = k;

genvar i; 

generate 

for (i = 0; i < N+1; i= i+1) begin : FA_ 

Full_Adder FA_ (.a(A1[i]), .b(xB[i]), .cin(C[i]), .Sum(S[i]), .Carry(C[i+1])); // {Cout, Sum} = a + b + cin
end

endgenerate




endmodule