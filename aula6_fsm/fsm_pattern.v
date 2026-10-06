`define S0	3'b000
`define S1 	3'b001
`define S2 	3'b010
`define S3 	3'b011
`define S4 	3'b100

module fsm_pattern(
	input rst,
	input clk,
	// sinais de controle
	input in,
	//saidas
	output out
);

	reg [2:0] state;
	reg [2:0] next_state;
	
	//motor de estados
	always @(posedge clk) begin
		if (rst) begin
			state <= `S0;
		end else begin
			state <= next_state;
		end
	end
	
	//logíca de transição
	always @(*) begin
		case(state)
			`S0: begin
				if (in)
					next_state = `S1;
				else
					next_state = `S0;
			end
			
			`S1: begin
				if (in)
					next_state = `S2;
				else
					next_state = `S0;
			end
			
			`S2: begin
				if (in)
					next_state = `S1;
				else
					next_state = `S3;
			end
			
			`S3: begin
				if (in)
					next_state = `S4;
				else
					next_state = `S0;
			end
			
			`S4: begin
					next_state = `S4;
			end
		endcase
	end
	
	//logíca de saída
	assign out = state[2];
	
endmodule 