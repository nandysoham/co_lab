module tb_dflipflop();
reg D;
reg clk;
wire Q;
dflipflop dut(.Q(Q),.clk(clk),.D(D));
initial begin
	clk=0;
		forever #10 clk=~clk;
end
initial begin
D<=0;
#50
D<=1;
end
endmodule
