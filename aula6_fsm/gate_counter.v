module gate_counter(
	input rst,
	input clk,
	input enable,
	input dir,
	output reg start_stop,
	output reg end_stop,
	output reg [9:0] led_bar
);
	
	reg [3:0] count;
	reg [3:0] next_count;
	
	always @(posedge clk) begin
		if (rst) begin
			count <= 0;
		end
		
		if (enable) begin
			count <= next_count;
		end 
	end
	
	always @(*) begin
		if (dir) begin
			if (count == 4'b0000) begin
				next_count = count;
			end else begin
				next_count = count + 4'b0001;
			end
		end else begin
			if (count == 4'b1001) begin
				next_count = count;
			end else begin
				next_count = count - 4'b0001;
			end
		end
	end

	always @(*) begin
		case (count)
			4'b0000: begin
				led_bar = 10'b0000000000;
				start_stop = 1;
				end_stop = 0;
			end
			4'b0001: begin
				led_bar = 10'b0000000001;
				start_stop = 0;
				end_stop = 0;
			end
			4'b0010: begin
				led_bar = 10'b0000000011;
				start_stop = 0;
				end_stop = 0;
			end
			4'b0011: begin
				led_bar = 10'b0000000111;
				start_stop = 0;
				end_stop = 0;
			end
			4'b0100: begin
				led_bar = 10'b0000001111;
				start_stop = 0;
				end_stop = 0;
			end
			4'b0101: begin
				led_bar = 10'b0000011111;
				start_stop = 0;
				end_stop = 0;
			end
			4'b0110: begin
				led_bar = 10'b0000111111;
				start_stop = 0;
				end_stop = 0;
			end
			4'b0111: begin
				led_bar = 10'b0001111111;
				start_stop = 0;
				end_stop = 0;
			end
			4'b1000: begin
				led_bar = 10'b0011111111;
				start_stop = 0;
				end_stop = 0;
			end
			4'b1001: begin
				led_bar = 10'b0111111111;
				start_stop = 0;
				end_stop = 1;
			end
			default: begin
				led_bar = 10'b1011011010;
				start_stop = 1;
				end_stop = 1;
			end
		endcase
	end
	
endmodule 