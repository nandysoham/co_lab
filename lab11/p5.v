module p5(D1,D2,A,B,clk,s0,s1,s2,s3);

input [31:0]D1;
input [31:0]D2;

input s0,s1,s2,s3;

input clk;

wire [31:0]Dout1;
wire [31:0]Dout2;

output[31:0] A;
output[31:0] B;

PIPO_32bit R1(.D(D1),.Q(Dout1),.clk(clk));
PIPO_32bit R2(.D(D2),.Q(Dout2),.clk(clk));

mux m1(.res(A),.a(Dout1),.b(Dout2),.s0(s0),.s1(s1));
mux m2(.res(B),.a(Dout1),.b(Dout2),.s0(s2),.s1(s3));

endmodule