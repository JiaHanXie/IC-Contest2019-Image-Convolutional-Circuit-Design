module MEM_L0(
		input					rst,//in 1
		input					clk,//in 1
		input			[19:0]	data_in,//in 20
		input			[8:0]	mux4mem,//in 9
		input			[8:0]	en4mem,//in 9
		output	reg		[19:0]	data_out0,//out 20
		output	reg		[19:0]	data_out1,//out 20
		output	reg		[19:0]	data_out2,//out 20
		output	reg		[19:0]	data_out3,//out 20
		output	reg		[19:0]	data_out4,//out 20
		output	reg		[19:0]	data_out5,//out 20
		output	reg		[19:0]	data_out6,//out 20
		output	reg		[19:0]	data_out7,//out 20
		output	reg		[19:0]	data_out8//out 20
		);
//////////////////// mem //////////////////////
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out0<=20'd0;
		end else if(en4mem[0])begin
			data_out0<=(mux4mem[0])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out1<=20'd0;
		end else if(en4mem[1])begin
			data_out1<=(mux4mem[1])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out2<=20'd0;
		end else if(en4mem[2])begin
			data_out2<=(mux4mem[2])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out3<=20'd0;
		end else if(en4mem[3])begin
			data_out3<=(mux4mem[3])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out4<=20'd0;
		end else if(en4mem[4])begin
			data_out4<=(mux4mem[4])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out5<=20'd0;
		end else if(en4mem[5])begin
			data_out5<=(mux4mem[5])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out6<=20'd0;
		end else if(en4mem[6])begin
			data_out6<=(mux4mem[6])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out7<=20'd0;
		end else if(en4mem[7])begin
			data_out7<=(mux4mem[7])?20'd0:data_in;
		end
	end
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			data_out8<=20'd0;
		end else if(en4mem[8])begin
			data_out8<=(mux4mem[8])?20'd0:data_in;
		end
	end
endmodule