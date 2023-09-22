module adder_behavior_reg(s,co,a,b,ci,clk);
parameter width=32;
input [width-1:0]a,b;
input ci;
output reg [width-1:0]s;
output reg co;
input clk;
reg [width-1:0]s_;
reg co_;

always@(*)
	begin
	{co_,s_}<=a+b+ci;
	end
	
always@(posedge clk)
	begin
	co<=co_;
	s<=s_;
	end
	
endmodule

	