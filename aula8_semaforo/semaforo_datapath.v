module semaforo_datapath(
	input clk,
	input clear,
	input [1:0] sel,
	output top
);

	wire [4:0] cnt;
	reg [4:0] sel_time;

	counter u1(
		.rst(clear),
		.clk(clk),
		.cnt_out(cnt)
	);
	
	assign top = (cnt == sel_time);
	
	always @(*) begin 
		case(sel)
			0: sel_time = 5;
			1: sel_time = 1;
			2: sel_time = 3;
			default: sel_time = 31;
		endcase
	end
	
endmodule 