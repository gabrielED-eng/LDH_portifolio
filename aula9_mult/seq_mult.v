module seq_mult(
	input rst,
	input clk,
	
	input [3:0] a,
	input [3:0] b,
	output [7:0] m
);
	
	mult_fsm fsm(
		.rst(rst),
		.clk(clk),
		
		
	);
	
	mult_datapath dp(
		.a(),
		.b(),
		.m()
		
		
	);
	
endmodule 