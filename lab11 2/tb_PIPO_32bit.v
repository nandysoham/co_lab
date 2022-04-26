module tb_PIPO_32bit();
reg [31:0]D;
reg clk;
wire [31:0]Q;
PIPO_32bit dut(.Q(Q),.D(D),.clk(clk));
initial begin
	clk=0;
		forever #10 clk=~clk;
end
initial begin
D='b00101010101111001011101110101111;
#50
D='b10101110101011111010101010111010;
end
endmodule