`timescale 1ns/10ps
`include "Layer0.v"
`include "Layer1.v"
`include "Layer2.v"
`include "DATA_MUX.v"
`include "CTL.v"
module  CONV(
	input						clk,
	input						reset,
	input						ready,
	output		wire			busy,
	output		wire	[11:0]	iaddr,
	input				[19:0]	idata,
	output		wire			crd,
	input				[19:0]	cdata_rd,
	output		wire	[11:0]	caddr_rd,
	output		wire			cwr,
	output		wire	[19:0]	cdata_wr,
	output		wire	[11:0]	caddr_wr,
	output		wire	[2:0]	csel
	);
//////////////////// var //////////////////////
	wire	[8:0]	L0_mux4mem;
	wire	[8:0]	L0_en4mem;
	wire			L0_num_of_kernel;
	wire	[19:0]	L0_data_out;
	wire	[3:0]	L1_en4mem;
	wire	[19:0]	L1_data_out;
	wire	[19:0]	L2_data_out;
	wire	[1:0]	sel4mux_of_output;
//////////////////// module ///////////////////
	Layer0 layer0(
		.rst				(reset),//in 1
		.clk				(clk),//in 1
		.data_in			(idata),//in 20
		.mux4mem			(L0_mux4mem),//in 9
		.en4mem				(L0_en4mem),//in 9
		.num_of_kernel		(L0_num_of_kernel),//in 1
		.data_out			(L0_data_out)//out 20
		);
	Layer1 layer1(
		.rst				(reset),//in 1
		.clk				(clk),//in 1
		.data_in			(cdata_rd),//in 20
		.en4mem				(L1_en4mem),//in 4
		.data_out			(L1_data_out)//out 20
		);
	Layer2 layer2(
		.rst				(reset),//in 1
		.clk				(clk),//in 1
		.data_in			(cdata_rd),//in 20
		.data_out			(L2_data_out)//out 20
		);
	DATA_MUX data_mux(
		.data_in0			(L0_data_out),//in 20
		.data_in1			(L1_data_out),//in 20
		.data_in2			(L2_data_out),//in 20
		.sel				(sel4mux_of_output),//in 2
		.data_out			(cdata_wr)//out 20
		);
	CTL ctl(
		.rst				(reset),//in 1
		.clk				(clk),//in 1
		.ready				(ready),//in 1
		.busy				(busy),//out 1
		.iaddr				(iaddr),//out 12
		.crd				(crd),//out 1
		.caddr_rd			(caddr_rd),//out 12
		.cwr				(cwr),//out 1
		.caddr_wr			(caddr_wr),//out 12
		.csel				(csel),//out 3
		.L0_mux4mem			(L0_mux4mem),//out 9
		.L0_en4mem			(L0_en4mem),//out 9
		.L0_num_of_kernel	(L0_num_of_kernel),//out 1
		.L1_en4mem			(L1_en4mem),//out 4
		.sel4mux_of_output	(sel4mux_of_output)//out 2
		);
endmodule