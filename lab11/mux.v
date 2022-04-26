module mux(res, s0,s1, a,b);
input s0;
input s1;

input [31:0]a;
input [31:0]b;

output reg [31:0]res;


always@(a,b,s0,s1)

case({s0,s1})
3'b01: res=b;
3'b10: res=a;
endcase

endmodule