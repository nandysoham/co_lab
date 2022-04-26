
module feedbackdff(Q,clk,in);
output reg Q;
input clk;
input in;

reg D;

always @(posedge clk)
begin
	D<=(~Q|in);
	Q<=D;
end
endmodule
