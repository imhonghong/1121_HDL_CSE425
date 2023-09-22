module adder_dataflow_reg(s,co,a,b,ci,clk);
parameter width=32;
output reg [width-1:0]s;
output reg co;
input [width-1:0]a;
input [width-1:0]b;
input ci;
input clk;
wire co_;
wire [width-1:0]s_;

assign {co_,s_}=a+b+ci;

always@(posedge clk)
begin
	s<=s_;
	co<=co_;
end

endmodule
