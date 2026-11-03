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
		if(rst) begin
			state <= `STATE_IDLE;
		end else begin 
			state <= nextState;
		end
	end
	
	always @(*) begin
		case(state)
			`STATE_IDLE: begin
				if(start)
					nextState = `STATE_OP;
				else
					nextState = `STATE_IDLE;
			end
			`STATE_OP: begin
				if(done)
					nextState = `STATE_DONE;
				else
					nextState = `STATE_OP;
			end
			
			`STATE_DONE: begin
				nextState = `STATE_DONE;
			end
			
			default: begin
				nextState = `STATE_IDLE;
			end
		endcase
	end
	
	assign load = (state == `STATE_IDLE);
	assign clear = load;
	assign done = (state == `STATE_DONE);
	
endmodule 