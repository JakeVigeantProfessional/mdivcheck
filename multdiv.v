// module multdiv(
// 	data_operandA, data_operandB, 
// 	ctrl_MULT, ctrl_DIV, 
// 	clock, 
// 	data_result, data_exception, data_resultRDY);

//     input [31:0] data_operandA, data_operandB;
//     input ctrl_MULT, ctrl_DIV, clock;

//     output [31:0] data_result;
//     output data_exception, data_resultRDY;

//     wire either, currentMult, currentDiv, currentMultAndMultRdy, currentDivAndDivRdy;
//     or(either, ctrl_MULT, ctrl_DIV);
//     dffe_ref saveMult(currentMult, ctrl_MULT, clock, either, 1'b0);
//     dffe_ref saveDiv(currentDiv, ctrl_DIV, clock, either, 1'b0);

    
//     wire[31:0] multRes, divRes;
//     wire multException, divException, multRdy, divRdy;

//     mult multiply(data_operandA, data_operandB, clock, ctrl_MULT, multRes, multException, multRdy);
//     // div divide(data_operandA, data_operandB, clock, ctrl_DIV, divRes, divException, divRdy);
    
//     assign currentMultAndMultRdy = currentMult ? multRdy : 1'b0;
//     assign currentDivAndDivRdy = currentDiv ? divRdy : 1'b0;

//     mux_2_32bit selectRes(data_result, currentDiv, multRes, divRes);
//     mux_2 selectException(data_exception, currentDiv, multException, divException);
//     mux_2 selectReady(data_resultRDY, currentDiv, currentMultAndMultRdy, currentDivAndDivRdy);
// endmodule

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


