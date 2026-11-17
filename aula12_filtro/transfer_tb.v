`timescale 100ns/100ns

module transfer_tb;
	
	integer f;
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
		$fwrite(f, "%d,	%d\n",x,y);
	end
	
	initial begin
		f = $fopen("output.csv","w");
		
		clk = 0;
		rst = 1;
		#10 x = 12'sd0;
		rst = 0;
		
		#10 x = 12'sd0;
		#10 x = 12'sd1203;
		#10 x = 12'sd1947;
		#10 x = 12'sd1947;
		#10 x = 12'sd1203;
		#10 x = 12'sd0;
		#10 x = -12'sd1204;
		#10 x = -12'sd1948;
		#10 x = -12'sd1948;
		#10 x = -12'sd1204;
		
		#100
		$fclose();
		$finish;
	end

endmodule 