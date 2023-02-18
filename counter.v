module counter(out,clk,en,reset);
	input clk,en,reset;
	output [31:0] out;
	wire tempey;
	wire [31:0] w1, currCount;
	assign w1= 1;
    counter_reg creg(currCount, clk, en, 1'b1, reset, out);
	thirtytwobitadder adder(currCount,out,w1,tempey,1'b0);
endmodule
