module semaforo(
	input rst,
	input clk_50M,
	output [2:0] ligths
);
	wire clear;
	wire [1:0] sel;
	wire top;
	wire clk_1s;
	
	clk_1s u0(
		.clk_50M(clk_50M),
		.reset(rst),
		.clk_out(clk_1s)
	);
	
	semaforo_fsm u1(
		.clk		(clk_1s),
		.rst		(rst),
		.top		(top),
		.sel		(sel),
		.clear	(clear),
		.lights	(ligths)
	);
	
	semaforo_datapath u2(
		.clk		(clk_1s),
		.clear	(clear),
		.sel		(sel),
		.top		(top)
	);
endmodule 