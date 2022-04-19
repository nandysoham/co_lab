// Test bench for ANDORNOR.v 

module tb_ALU();

reg [31:0]a, b;
reg s0,s1,s2 

wire [32:0] res; 


ALU UUT ( 	.res(res),
		.a(a), 
		.b(b), 
		.s0(s0),
        .s1(s1),
        .s2(s2),
        );

initial 
begin

a = 30'd19999; b = 30'd112345; s0 = 1'b0; s1 = 1'b0; s2 = 1'b0;

#100 
a = 30'd19999; b = 30'd112345; s0 = 1'b0; s1 = 1'b0; s2 = 1'b1;

#100 
a = 30'd19999; b = 30'd112345; s0 = 1'b0; s1 = 1'b1; s2 = 1'b0;

#100 
a = 30'd10011; b = 30'd1425; s0 = 1'b0; s1 = 1'b0; s2 = 1'b0;

end




endmodule 