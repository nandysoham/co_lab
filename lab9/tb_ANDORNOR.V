// Test bench for ANDORNOR.v 

module tb_ANDORNOR();

reg [31:0]A, B; 

wire [32:0]Sand, Sor, Snor; 


ANDORNOR UUT ( 	.A(A),
		.B(B), 
		.S1(Sand), 
		.S2(Sor),
        .S3(Snor)
        );

initial 
begin

A = 30'd19999; B = 30'd112345; 

#100 
A = 16'd15; B = 16'd15;

#100 
A = 4'd11; B = 4'd10;

#100 
A = 4'd0; B = 4'd0;

#100 
A = 4'd5; B = 4'd7;

#100 
A = 4'd8; B = 4'd4;

#100 
A = 4'd1; B = 4'd15;

#100 
A = 4'd8; B = 4'd9; 

#100 
A = 4'd3; B = 4'd7; 

#100 
A = 4'd4; B = 4'd1; 

#100 
A = 4'd13; B = 4'd15; 


end




endmodule 