module DATA_MUX(
	input		[19:0]	data_in0,//in 20
	input		[19:0]	data_in1,//in 20
	input		[19:0]	data_in2,//in 20
	input		[1:0]	sel,//in 2
	output	reg	[19:0]	data_out//out 20
	);
//////////////////// var //////////////////////
	always@(*)begin
		case(sel)
			2'd0:		data_out=data_in0;
			2'd1:		data_out=data_in1;
			2'd2:		data_out=data_in2;
			default:	data_out=20'dx;
		endcase
	end
endmodule