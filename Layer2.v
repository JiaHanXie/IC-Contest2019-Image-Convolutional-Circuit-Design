module Layer2(
		input				rst,//in 1
		input				clk,//in 1
		input		[19:0]	data_in,//in 20
		output	reg	[19:0]	data_out//out 20
		);
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out<=20'd0;
		end else begin
			data_out<=data_in;
		end
	end
endmodule