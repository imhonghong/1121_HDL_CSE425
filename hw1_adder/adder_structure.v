module adder_structure(s,co,a,b,ci);
input [31:0]a;
input [31:0]b;
input ci;
output [31:0]s;
output co;

wire [32:0]c;

assign c[0]=ci;
genvar i;
generate
	for(i=0;i<=31;i=i+1)
		begin:FA_loop
		FA fa(s[i],c[i+1],a[i],b[i],c[i]);
		end
endgenerate

assign co=c[32];

endmodule
