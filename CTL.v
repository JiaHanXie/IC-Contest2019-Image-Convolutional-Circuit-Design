module CTL(
	input			rst,//in 1
	input			clk,//in 1
	input			ready,//in 1
	output			busy,//out 1
	output	[11:0]	iaddr,//out 12
	//
	output			crd,//out 1
	output	[11:0]	caddr_rd,//out 12
	//
	output			cwr,//out 1
	output	[11:0]	caddr_wr,//out 12
	//
	output	[2:0]	csel,//out 3
	//
	output	[8:0]	L0_mux4mem,//out 9
	output	[8:0]	L0_en4mem,//out 9
	output			L0_num_of_kernel,//out 1
	output	[3:0]	L1_en4mem,//out 4
	output	[1:0]	sel4mux_of_output//out 2
	);
//////////////////// def //////////////////////
	
//////////////////// FSM //////////////////////
//////////////////// other ////////////////////
endmodule