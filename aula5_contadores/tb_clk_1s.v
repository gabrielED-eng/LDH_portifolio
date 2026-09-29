`timescale 10ns/10ns

module tb_clk_1s;

	reg clk_50M;
	reg reset;
	wire clk_out;
	
	clk_1s dut(
		.clk_50M(clk_50M),
		.clk_out(clk_out),
		.reset(reset)
	);

	always #10 clk_50M = ~clk_50M; 
	
	
	initial begin
		clk_50M = 0;
		reset = 1;
		#2
		reset = 0;
		#200000000
		$finish;
	end
endmodule
