module product_reg(in, clk, enable_in, enable_out, reset, out);
    input [64:0] in;
    input clk, enable_in, enable_out, reset;

    output [64:0] out;

    wire [64:0] q;

    genvar p;
    generate
        for(p=0; p < 65; p = p +1) begin: loop
            dffe_ref dffe(q[p], in[p], clk, enable_in, reset);
            assign out[p] = enable_out ? q[p] : 1'bz;
        end
    endgenerate
endmodule