// Test bench for Add_Sub_Nbit.v 


module tb_Add_Sub_32bit();

parameter M = 64; // Test vectors size is 2^64 x 2^64 x 2 = 2^129

reg [M-1:0]a, b; 
reg s; 

wire [M:0]Y;

 
Add_Sub_32bit #(.N(M))  UUT (.A(a) , .B(b) , .k(s), .S(Y) );

initial begin

repeat(50)
begin
#10 a = $random; b = $random; s = $random; 
#100 // 100 units delay 
$display("a=%d,b=%d,s=%d,Sum=%d",$signed(a),$signed(b),s,$signed(Y));
end

$stop;
end

endmodule 