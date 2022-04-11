// S = A + B + Cin; 
// A and B are 31-bits, Cin is single bit
//Output S is  32-bits


module RCA_32bit(A,B, cin, S);
input [31:0]A,B; // inputs 
input cin; 
output [32:0]S;

wire [32:0]C; 

assign C[0] = cin;

integer i;
initial begin
    for(i =0;i<32;i = i+1){
        begin
            Full_Adder FA0 (.a(A[i]), .b(B[i]), .cin(C[i]), .Sum(S[i]), .Carry(C[i+1]));
        end
    }
end



// Full_Adder FA0 (.a(A[0]), .b(B[0]), .cin(C[0]), .Sum(S[0]), .Cout(C[1])); // {Cout, Sum} = a + b + cin

// Full_Adder FA1 (.a(A[1]), .b(B[1]), .cin(C[1]), .Sum(S[1]), .Cout(C[2]));

// Full_Adder FA2 (.a(A[2]), .b(B[2]), .cin(C[2]), .Sum(S[2]), .Cout(C[3]));

// Full_Adder FA3 (.a(A[3]), .b(B[3]), .cin(C[3]), .Sum(S[3]), .Cout(C[4]));

assign S[32] = C[32]; 

endmodule