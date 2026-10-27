`define STATE_IDLE 2'b01
`define STATE_OP 	 2'b10
`define STATE_DONE 2'b11

module mult_fsm(
	input rst,
	input clk,
	
	input zero,
	
	input start,
	
	output load,
	output clear,
	
	output done
);

	reg [1:0] state;
	reg [1:0] nextState;

	always @(posedge clk or posedge rst) begin
	
	end
	
	always @(*) begin
	
	end

endmodule 