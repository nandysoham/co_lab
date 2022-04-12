// test_banch half adder
module tb_Halfadder;

reg a;

reg b;

reg cin;

wire sum;

wire carry;

ha uut ( .a(a),.b(b),.cin(cin),.sum(sum), .carry(carry));

initial begin

#10 a=1’b0;b=1’b0; cin = 1b'0;                       

#10 a=1’b0;b=1’b1 ; cin = 1b'0;                        

#10 a=1’b1;b=1’b0;  cin = 1b'0;                      

#10 a=1’b1;b=1’b1; cin = 1b'0            

#10$stop;

end

endmodule