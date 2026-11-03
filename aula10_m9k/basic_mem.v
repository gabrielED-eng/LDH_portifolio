module basic_mem
#(
	parameter ADDR_LEN = 10,
	parameter SIZE = 1 << ADDR_LEN
)
(
	input 				clk,

	input					wr_enable,
	input 		[7:0] wr_data,
	input 		[ADDR_LEN-1:0] wr_addr,
	
	output reg	[7:0] rd_data,
	input 		[ADDR_LEN-1:0] rd_addr
	
);

	reg [7:0] buffer [SIZE-1:0];

	always @(posedge clk) begin 
		if(wr_enable)begin
			buffer[wr_addr] <= wr_data;
		end
		rd_data <= buffer[rd_addr];
	end
	
endmodule 