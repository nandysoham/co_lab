module ALU(output reg [32:0] res, input [31:0] a, input [31:0] b, input s0, input s1, input s2);

wire [31:0] w0,w1,w2,w3.w4;
parameter M = 32;
Add_Sub_32bit #(.N(M))  UUT (.A(a) , .B(b) , .k(0), .S(w0) );
Add_Sub_32bit #(.N(M))  UUT (.A(a) , .B(b) , .k(1), .S(w1) );
ANDORNOR UUT ( 	.A(A),.B(B), .S1(w2), .S2(w3),.S3(w4));

always @(a,b,s0,s1,s2,w0,w1,w2,w3,w4)

case({s2,s1,s0})

3'b000: res = {w0[31], w0};
3'b001: res = {w1[31], w1};
3'b010: res = {w2[31], w2};
3'b011: res = {w3[31], w3};
3'b100: res = {w4[31], w4};

endcase

endmodule



