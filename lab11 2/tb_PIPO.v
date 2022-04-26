module tb_PIPO();
reg D1,D2,D3,D4;
reg clk;
wire Q1,Q2,Q3,Q4;
PIPO dut(.Q1(Q1),.Q2(Q2),.Q3(Q3),.Q4(Q4),.clk(clk),.D1(D1),.D2(D2),.D3(D3),.D4(D4));
initial begin
	clk=0;
		forever #10 clk=~clk;
end
initial begin
D1<=0;
D2<=0;
D3<=0;
D4<=0;

#50

D1<=0;
D2<=1;
D3<=0;
D4<=1;
end
endmodule