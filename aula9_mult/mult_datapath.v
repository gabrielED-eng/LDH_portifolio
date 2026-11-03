module mult_datapath(
	input clk,
	
	input [3:0] a,
	input [3:0] b,
	
	input load,
	input clear,
	
	output zero,
	output [7:0] m 
);

	reg [7:0] acc;
	reg [6:0] reg_a;
	reg [3:0] reg_b;
	
	wire [7:0] s_out;
	
	ripple_carry_adder #(.BITS(7)) adder (
		.a(reg_a),
		.b(acc),
		.s(s_out)
	);
	
	always @(posedge clk) begin
		if (load)
			reg_a <= {3'b0, a[3:0]};
		else
			reg_a <= {reg_a[6:0],1'b0};
	end
	
	always @(posedge clk) begin
		if (load)
			reg_b <= b;
		else
			reg_b <= {1'b0,reg_b[3:0]};
	end
	
	always @(posedge clk) begin
		if(clear) begin
			acc <= 0;
			
		end else begin
			if(reg_b[0]) begin
				acc <= s_out;
			end
		end
	end
	
	assign zero = ((reg_a == 7'd0) || (reg_b == 4'd0));
	assign m = acc;
	
endmodule 