
module multdiv(
	data_operandA, data_operandB,
	ctrl_MULT, ctrl_DIV,
	clock,
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT;
	input ctrl_DIV, clock;


    output [31:0] data_result;
    output data_exception, data_resultRDY;

	wire currMul, eith;

    or eithOr(eith,ctrl_MULT,ctrl_DIV);
	dffe_ref dffe1(currMul,ctrl_MULT,clock,eith,1'b0);

	wire[31:0]counter1;
	counter count(counter1,clock,currMul,ctrl_MULT);

	wire [31:0] multiplied;
	wire multoverflow;
	mult multiplyUnit(multiplied,multoverflow,data_operandA,data_operandB,clock,counter1);
	assign data_result =multiplied;
	
	assign data_resultRDY = counter1[4]&counter1[0];
	assign data_exception = multoverflow;


endmodule


