`timescale 100ns/100ns

module filter_tb;
	
	reg rst,clk;
	reg signed [11:0] x;
	wire signed [11:0] y;

	always #5 clk = ~clk;
	
	bw2 f1(
		.rst(rst),
		.clk(clk),
		.x(x),
		.y(y)
	);
	
	
	always begin
		#10 $monitor("%d	%d",x,y);
	end
	
	initial begin
		clk = 0;
		rst = 1;
		#10;
		rst = 0;
		x = 12'sb010000000000;
		#10
		x = 12'sd0;
		#50
		$finish;
	end
	
endmodule 