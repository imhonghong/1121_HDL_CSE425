`timescale 10ns/1ns

module tb;
reg	[31:0]a,b;
reg	ci;
reg clk;
wire [31:0]s1,s2,s3,s4,s5,s6;
wire co1,co2,co3,co4,co5,co6;


adder_structure     a1(s1,co1,a,b,ci);
adder_dataflow      a2(s2,co2,a,b,ci);
adder_behavior      a3(s3,co3,a,b,ci);
adder_structure_reg a4(s4,co4,a,b,ci,clk);
adder_dataflow_reg  a5(s5,co5,a,b,ci,clk);
adder_behavior_reg  a6(s6,co6,a,b,ci,clk);

//--------generate clk--------//
initial begin
#1;
clk<=1;
end
always begin
#5 clk<=~clk;
end

//--------generate random input--------//
initial repeat(10) begin
  a<=$random;b<=$random;ci<=$random;
#10;
end

//--------check input--------//
initial begin
	#2; 
	repeat(10) begin
		if({co1,s1}==(a+b+ci)&&{co2,s2}==(a+b+ci)&&{co3,s3}==(a+b+ci)&&{co4,s4}==(a+b+ci)&&{co5,s5}==(a+b+ci)&&{co6,s6}==(a+b+ci))
		$display("all test is passed");
		end
	#10;
end



//--------define ending time--------//
initial begin
#120 $finish;
end

endmodule
