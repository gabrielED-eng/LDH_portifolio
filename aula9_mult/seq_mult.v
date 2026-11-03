module seq_mult(
	input rst,
	input clk,
	
	input [3:0] a,
	input [3:0] b,
	output [7:0] m,
	
	input start,
	output done
);

	wire load, clear, zero;
	
	mult_fsm fsm(
		.rst(rst),
		.clk(clk),
		.load(load),
		.start(start),
		.clear(clear),
		.zero(zero),
		.done(done)
	);
	
	mult_datapath dp(
		.clk(clk),
		.a(a),
		.b(b),
		.load(load),
		.clear(clear),
		.zero(zero),
		.m(m)
	);
	
endmodule 