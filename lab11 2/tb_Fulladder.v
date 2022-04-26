// test_banch half adder
module tb_Fulladder;

reg a;

reg b;

reg cin;

wire sum;

wire carry;

Full_Adder uut ( .a(a),.b(b),.cin(cin),.Sum(sum), .Carry(carry));

initial begin

#10 a=1'b0;b=1'b0; cin = 1'b0; 
#10 a=1'b0;b=1'b1; cin = 1'b0; 
#10 a=1'b1;b=1'b0; cin = 1'b0; 
#10 a=1'b1;b=1'b1; cin = 1'b0;                       
#10$stop;

end

endmodule