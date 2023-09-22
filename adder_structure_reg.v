module adder_structure_reg(s,co,a,b,ci,clk);
input [31:0]a;
input [31:0]b;
input ci;
input clk;
output reg [31:0]s;
output reg co;

wire [32:0]c_;
wire [31:0]s_;

assign c_[0]=ci;

genvar i;
generate
	for(i=0;i<=31;i=i+1)
		begin:FA_loop
		FA fa(s_[i],c_[i+1],a[i],b[i],c_[i]);
		end
endgenerate

always@(posedge clk)
begin
	s<=s_;
	co<=c_[32];
end

endmodule
