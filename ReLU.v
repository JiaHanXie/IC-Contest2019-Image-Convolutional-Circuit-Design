module ReLU(
		input				signed	[19:0]	data_in,//in 20
		output		wire	signed	[19:0]	data_out//out 20
		);
	assign data_out=(data_in>0)?data_in:20'd0;
endmodule