`timescale 1ns/1ns

module fsm_pattern_tb;
reg rst, clk, in;

wire out;

fsm_pattern dut(
	.rst(rst),
	.clk(clk),
	.in(in),
	.out(out)
);


always #1 clk=~clk;

initial begin
	clk = 0;
	rst = 1;
	in = 0;
	#3
	rst = 0;
	#2
	#2 in = 0;
	#2 in = 0;
	#2 in = 1;
	#2 in = 0;
	#2 in = 1;
	#2 in = 1;
	#2 in = 0;
	#2 in = 1;
	#2 in = 0;
	#2 in = 0;
	#2 in = 1;
	#2 in = 0;
	#10
	$finish;
end

endmodule 