`timescale 1us/1us

module tb_basic_add;
	//Sinais
	reg	[3:0] a;
	reg 	[3:0] b;
	wire	[4:0] s;
	
	
	//Instancia do DUT
	adder_4b dut(
		.a(a),.b(b),.s(s)
	);
	
	//Stimuli
	
	initial begin //bloco initial, executa uma unica vez. (NÃO É SINTETIZAVEl)
		a = 0; b = 0;
		#10 
		a = 10;
		b = 4;
		#10
		a = 5;
		b = 5;
		#10
		$finish;
	end
	
	
endmodule
