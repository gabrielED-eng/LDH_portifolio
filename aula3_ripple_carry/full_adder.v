`timescale 1ns/1ns
module full_adder(
	input a,
	input b,
	input ci,
	output s,
	output co
);

	//Modelagem data flow
	//assign s = (a & b & ci) | (~a & b & ~ci) | (~a & ~b & ci) | (a & ~b & ~ci);
	//assign co = (a & b) | (ci & b) | (ci & a);
	
	//modelagem estrutural
	wire w1,w2,w3;
	
	and #2 u1 (w1,a,b);
	and #2 u2 (w2,ci,b);
	and #2 u3 (w3,ci,a);
	or  #3 u4 (co,w1,w2,w3);
	
	wire w4,w5,w6,w7,na,nb,nci;
	
	not #1 n1 (na,a);
	not #1 n2 (nb,b);
	not #1 n3 (nci,ci);
	
	and #3 u5 (w4,a,b,ci);
	and #3 u6 (w5,na,b,nci);
	and #3 u7 (w6,na,nb,ci);
	and #3 u8 (w7,a,nb,nci);
	or  #4 u9 (s,w4,w5,w6,w7);
	
endmodule
