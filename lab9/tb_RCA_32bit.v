// Test bench for RCA_32bit.v 

module tb_RCA_32bit();

reg [31:0]A, B; 
reg [0:0]C0; //single bit

wire [32:0]Sum; // sum = A + B + cin


RCA_32bit UUT ( 	.A(A),
		.B(B), 
		.cin(C0), 
		.S(Sum));

initial 
begin

A = 30'd19999; B = 30'd112345; C0 = 1'b1; 

#100 
A = 16'd15; B = 16'd15; C0 = 1'b1; 

#100 
A = 4'd11; B = 4'd10; C0 = 1'b0; 

#100 
A = 4'd0; B = 4'd0; C0 = 1'b1; 

#100 
A = 4'd5; B = 4'd7; C0 = 1'b0; 

#100 
A = 4'd8; B = 4'd4; C0 = 1'b0; 

#100 
A = 4'd1; B = 4'd15; C0 = 1'b1; 

#100 
A = 4'd8; B = 4'd9; C0 = 1'b0; 

#100 
A = 4'd3; B = 4'd7; C0 = 1'b1; 

#100 
A = 4'd4; B = 4'd1; C0 = 1'b1; 

#100 
A = 4'd13; B = 4'd15; C0 = 1'b0; 


end




endmodule 