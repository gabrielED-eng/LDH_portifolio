module mult_datapath(
	input [3:0] a,
	input [3:0] b,
	input [7:0] m,

	input load,
	input clear,
	
	output zero
);

	reg [7:0] acc;
	reg [3:0] reg_a;
	reg [3:0] reg_b;

	wire [3:0] shift_a;
	wire [3:0] shift_b;
	
	wire [3:0] sel_a;
	wire [3:0] sel_b;
	
	ripplecarry_adder #(.BITS(7)) adder (
		.a(),
		.b(),
		.s()
	);
	
endmodule 