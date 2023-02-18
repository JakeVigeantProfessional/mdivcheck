module ctrl_reg(in, clk, enable_in, out);
    input in, clk, enable_in;

    output out;

    dffe_ref ctrl_dffe(out, in, clk, enable_in, 1'b0);
endmodule