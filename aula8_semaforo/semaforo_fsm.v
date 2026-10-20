`define STATE_RED 				3'd0
`define STATE_RED_LOAD 			3'd1
`define STATE_GREEN 				3'd2
`define STATE_GREEN_LOAD 		3'd3
`define STATE_YELLOW 			3'd4
`define STATE_YELLOW_LOAD 		3'd5

module semaforo_fsm(
	input clk,
	input rst,
	
	input top,
	
	output reg [1:0]sel,
	output reg clear,
	
	output reg [2:0] lights
);

	reg [2:0] state;
	reg [2:0] next_state;

	always @(posedge clk or posedge rst) begin
		if (rst)
			state <= `STATE_RED_LOAD;
		else 
			state <= next_state;
	end
	
	always @(*) begin
		case(state)
			`STATE_RED_LOAD : next_state = `STATE_RED;
			`STATE_RED : begin
				if(top)
					next_state = `STATE_GREEN_LOAD;
				else
					next_state = `STATE_RED;
			end
			
			`STATE_GREEN_LOAD : next_state = `STATE_GREEN;
			`STATE_GREEN : begin
				if(top)
					next_state = `STATE_YELLOW_LOAD;
				else
					next_state = `STATE_GREEN;
			end
			
			`STATE_YELLOW_LOAD : next_state = `STATE_YELLOW;
			`STATE_YELLOW : begin
				if(top)
					next_state = `STATE_RED_LOAD;
				else
					next_state = `STATE_YELLOW;
			end
		endcase
	end
	
	always @(*) begin
		case(state)
			`STATE_RED_LOAD : begin
				clear = 1;
				lights = 3'b001;
				sel = 2'd1;
			end
			
			`STATE_RED : begin
				clear = 0;
				lights = 3'b001;
				sel = 2'd0;
			end
			
			`STATE_GREEN_LOAD : begin
				clear = 1;
				lights = 3'b010;
				sel = 2'd1;
			end
			
			`STATE_GREEN : begin
				clear = 0;
				lights = 3'b010;
				sel = 2'd2;
			end
			
			`STATE_YELLOW_LOAD : begin
				clear = 1;
				lights = 3'b100;
				sel = 2'd1;
			end
			
			`STATE_YELLOW : begin
				clear = 0;
				lights = 3'b100;
				sel = 2'd1;
			end
		endcase
	end

endmodule 