module clk_1s(
	input clk_50M,
	input reset,
	output reg clk_out
);

	reg [24:0] count;

	always @(posedge clk_50M) begin
		if (reset) begin
			count <= 25'd0;
			clk_out <= 0;
		end else begin
			count <= count + 1;
			
			if(count == 25'd25000000)begin
				clk_out <= ~clk_out;
			end
		end
	end

endmodule
