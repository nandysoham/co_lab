// S = A + B + Cin; 
// A and B are 31-bits, Cin is single bit
//Output S is  32-bits


module RCA_32bit(A,B, cin, S);
input [31:0]A,B; // inputs 
input cin; 
output [32:0]S;

wire [32:0]C; 

assign C[0] = cin;

genvar i; 

generate 

for (i = 0; i < 32; i= i+1) begin : FA //usedefined name 

Full_Adder FA_ (.a(A[i]), .b(B[i]), .cin(C[i]), .Sum(S[i]), .Carry(C[i+1])); // {Cout, Sum} = a + b + cin
end

endgenerate


assign S[32] = C[32]; 

endmodule