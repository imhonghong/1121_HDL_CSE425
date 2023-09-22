module FA(sum,c_out,a,b,c_in);
input a,b,c_in;
output sum,c_out;
wire s1,c1,s2;

assign s1=a^b;
assign c1=a&b;
assign sum=s1^c_in;
assign s2=s1&c_in;
assign c_out=s2^c1;

endmodule
