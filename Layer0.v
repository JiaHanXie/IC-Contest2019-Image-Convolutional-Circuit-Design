`include "MEM_L0.v"
`include "CONV_L0.v"
`include "ReLU.v"
module Layer0(
		input					rst,//in 1
		input					clk,//in 1
		input			[19:0]	data_in,//in 20
		input			[8:0]	mux4mem,//in 9
		input			[8:0]	en4mem,//in 9
		input					num_of_kernel,//in 1
		output	wire	[19:0]	data_out//out 20
		);
//////////////////// var //////////////////////
	wire	[19:0]	data0;
	wire	[19:0]	data1;
	wire	[19:0]	data2;
	wire	[19:0]	data3;
	wire	[19:0]	data4;
	wire	[19:0]	data5;
	wire	[19:0]	data6;
	wire	[19:0]	data7;
	wire	[19:0]	data8;
	wire	[19:0]	out_of_conv;
//////////////////// module ///////////////////
	MEM_L0 mem4l0(
		.rst(rst),//in 1
		.clk(clk),//in 1
		.data_in(data_in),//in 20
		.mux4mem(mux4mem),//in 9
		.en4mem(en4mem),//in 9
		.data_out0(data0),//out 20
		.data_out1(data1),//out 20
		.data_out2(data2),//out 20
		.data_out3(data3),//out 20
		.data_out4(data4),//out 20
		.data_out5(data5),//out 20
		.data_out6(data6),//out 20
		.data_out7(data7),//out 20
		.data_out8(data8)//out 20
		);
	CONV_L0 Convl0(
		.data_in0(data0),//in 20
		.data_in1(data1),//in 20
		.data_in2(data2),//in 20
		.data_in3(data3),//in 20
		.data_in4(data4),//in 20
		.data_in5(data5),//in 20
		.data_in6(data6),//in 20
		.data_in7(data7),//in 20
		.data_in8(data8),//in 20
		.num_of_kernel(num_of_kernel),//in 1
		.data_out(out_of_conv)//out 20
		);
	ReLU relu(
		.data_in(out_of_conv),//in 20
		.data_out(data_out)//out 20
		);
endmodule