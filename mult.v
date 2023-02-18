module mult(product,overflow,multiplicand, multiplier, clk, counter);
	input [31:0] multiplicand,multiplier, counter;
	input clk;
	output [31:0] product;
	output overflow;

	wire signed [64:0] running_prod_init, in, running_prod, running_prod_out;
	wire signed [2:0]ctrl_bits;
	wire temp2,temp3,temp4, temp5;

	assign running_prod_init[0] = 1'b0;
    assign running_prod_init[32:1] = multiplier[31:0];
    assign running_prod_init[64:33] = 32'b0;

	and a04204(temp2,~counter[0],~counter[1],~counter[2],~counter[3],~counter[4]);


	assign in=temp2 ? running_prod_init:running_prod>>>2;



    product_reg prReg(in, clk, 1'b1, 1'b1, 1'b0, running_prod_out);
	assign ctrl_bits[0] = running_prod_out[0];
	assign ctrl_bits[1] = running_prod_out[1];
	assign ctrl_bits[2] = running_prod_out[2];


	wire temp9,temp10,temp11;

	or fjeofgrgewfoej(temp8,temp6,temp7);

	and jdfebroivjsfo(temp9,ctrl_bits[0],ctrl_bits[1],ctrl_bits[2]);
	or fjeoergegwfoej(temp11,!ctrl_bits[2],temp9);
	wire [31:0]w98,w99,w100;
	assign w98= (ctrl_bits[0] & ctrl_bits[1] & ctrl_bits[2]) | (~ctrl_bits[0] & ~ctrl_bits[1] & ~ctrl_bits[2]) ? 0 : multiplicand;
	assign w100=w98<<1;
  assign w99 = (ctrl_bits[0] & ctrl_bits[1] & ~ctrl_bits[2]) |  (~ctrl_bits[0] & ~ctrl_bits[1] & ctrl_bits[2]) ? w100 :w98;

	wire [31:0]num1,num2,ans,notted;
	wire useless;
	or32 ofeohfofheu(num1,0,running_prod_out[64:33]);
	not32 nefneofe(notted,w99);
	assign num2= temp11 ? w99 : notted;
	thirtytwobitadder jfijfiejfi(ans,num1,num2,useless,!temp11);


	or32 fenfe(running_prod[64:33],ans,0);
	or32 fejnfe(running_prod[32:1],running_prod_out[32:1],0);
	or fejjnfe(running_prod[0],running_prod_out[0],1'b0);

	or32 dvijjjj(product,running_prod[32:1],0);

	wire wrong;
	and acjidjicjd(wrong,multiplicand[31],multiplier[31],product[31]);
	wire chkFir;
	and a999999(chkFir,running_prod_out[64] , running_prod_out[63] , running_prod_out[62] ,
        running_prod_out[61] , running_prod_out[60] , running_prod_out[59] , running_prod_out[58] ,
        running_prod_out[57] , running_prod_out[56] , running_prod_out[55] , running_prod_out[54] ,
        running_prod_out[53] , running_prod_out[52] , running_prod_out[51] , running_prod_out[50] ,
        running_prod_out[49] , running_prod_out[48] , running_prod_out[47] , running_prod_out[46] ,
        running_prod_out[45] , running_prod_out[44] , running_prod_out[43] , running_prod_out[42] ,
        running_prod_out[41] , running_prod_out[40] , running_prod_out[39] , running_prod_out[38] ,
        running_prod_out[37] , running_prod_out[36] , running_prod_out[35] , running_prod_out[34] ,
        running_prod_out[33] , running_prod_out[32]);
	wire chkSec;
	and a99h9999(chkSec,~running_prod_out[64] , ~running_prod_out[63] , ~running_prod_out[62] ,
			  ~running_prod_out[61] , ~running_prod_out[60] , ~running_prod_out[59] , ~running_prod_out[58] ,
			  ~running_prod_out[57] , ~running_prod_out[56] , ~running_prod_out[55] , ~running_prod_out[54] ,
			  ~running_prod_out[53] , ~running_prod_out[52] , ~running_prod_out[51] , ~running_prod_out[50] ,
			  ~running_prod_out[49] , ~running_prod_out[48] , ~running_prod_out[47] , ~running_prod_out[46] ,
			  ~running_prod_out[45] , ~running_prod_out[44] , ~running_prod_out[43] , ~running_prod_out[42] ,
			  ~running_prod_out[41] , ~running_prod_out[40] , ~running_prod_out[39] , ~running_prod_out[38] ,
			  ~running_prod_out[37] , ~running_prod_out[36] , ~running_prod_out[35] , ~running_prod_out[34] ,
			  ~running_prod_out[33] , ~running_prod_out[32]);

	or ovfRes(overflow,wrong,~(chkFir | chkSec));

endmodule

