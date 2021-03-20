module CONV_L0(
		input	signed	[19:0]	data_in0,//in 20
		input	signed	[19:0]	data_in1,//in 20
		input	signed	[19:0]	data_in2,//in 20
		input	signed	[19:0]	data_in3,//in 20
		input	signed	[19:0]	data_in4,//in 20
		input	signed	[19:0]	data_in5,//in 20
		input	signed	[19:0]	data_in6,//in 20
		input	signed	[19:0]	data_in7,//in 20
		input	signed	[19:0]	data_in8,//in 20
		input					num_of_kernel,//in 1
		output	wire	[19:0]	data_out//out 20
		);
//////////////////// par //////////////////////
	parameter	signed	Kernel0_0=20'h0A89E;
	parameter	signed	Kernel0_1=20'h092D5;
	parameter	signed	Kernel0_2=20'h06D43;
	parameter	signed	Kernel0_3=20'h01004;
	parameter	signed	Kernel0_4=20'hF8F71;
	parameter	signed	Kernel0_5=20'hF6E54;
	parameter	signed	Kernel0_6=20'hFA6D7;
	parameter	signed	Kernel0_7=20'hFC834;
	parameter	signed	Kernel0_8=20'hFAC19;

	parameter	signed	Kernel1_0=20'hFDB55;
	parameter	signed	Kernel1_1=20'h02992;
	parameter	signed	Kernel1_2=20'hFC994;
	parameter	signed	Kernel1_3=20'h050FD;
	parameter	signed	Kernel1_4=20'h02F20;
	parameter	signed	Kernel1_5=20'h0202D;
	parameter	signed	Kernel1_6=20'h03BD7;
	parameter	signed	Kernel1_7=20'hFD369;
	parameter	signed	Kernel1_8=20'h05E68;
	parameter	signed	Kernel0_bias=20'h01310;
	parameter	signed	Kernel1_bias=20'hF7295;
//////////////////// var //////////////////////
	wire	signed	[39:0]	MUL_0;
	wire	signed	[39:0]	MUL_1;
	wire	signed	[39:0]	MUL_2;
	wire	signed	[39:0]	MUL_3;
	wire	signed	[39:0]	MUL_4;
	wire	signed	[39:0]	MUL_5;
	wire	signed	[39:0]	MUL_6;
	wire	signed	[39:0]	MUL_7;
	wire	signed	[39:0]	MUL_8;
	wire	signed	[19:0]	Bias;
	wire	signed	[40:0]	SUM;
//////////////////// cal //////////////////////
	assign	MUL_0=data_in0*((num_of_kernel)?Kernel1_0:Kernel0_0);
	assign	MUL_1=data_in1*((num_of_kernel)?Kernel1_1:Kernel0_1);
	assign	MUL_2=data_in2*((num_of_kernel)?Kernel1_2:Kernel0_2);
	assign	MUL_3=data_in3*((num_of_kernel)?Kernel1_3:Kernel0_3);
	assign	MUL_4=data_in4*((num_of_kernel)?Kernel1_4:Kernel0_4);
	assign	MUL_5=data_in5*((num_of_kernel)?Kernel1_5:Kernel0_5);
	assign	MUL_6=data_in6*((num_of_kernel)?Kernel1_6:Kernel0_6);
	assign	MUL_7=data_in7*((num_of_kernel)?Kernel1_7:Kernel0_7);
	assign	MUL_8=data_in8*((num_of_kernel)?Kernel1_8:Kernel0_8);

	assign	Bias=(num_of_kernel)?Kernel1_bias:Kernel0_bias;
	assign	SUM=(((MUL_0+MUL_1)+(MUL_2+MUL_3))+((MUL_4+MUL_5)+
		(MUL_6+MUL_7)))+(MUL_8+{4'd0,Bias,16'd0});
	assign	data_out=(SUM[15])?(SUM[35:16]+20'd1):SUM[35:16];
endmodule