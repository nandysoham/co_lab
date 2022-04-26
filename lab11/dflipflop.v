module dflipflop(Q,clk,D);
output reg Q;
input D;
input clk;
always @(posedge clk)
begin
	Q<=D;
end

endmodule