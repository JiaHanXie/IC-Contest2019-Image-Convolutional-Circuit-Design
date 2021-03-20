module Layer1(
	input				rst,//in 1
	input				clk,//in 1
	input	[19:0]		data_in,//in 20
	input	[3:0]		en4mem,//in 4
	output	[19:0]		data_out//out 20
		);
//////////////////// var //////////////////////
	reg		[19:0]	MEM	[0:3];
	reg		[2:0]	i;
	wire	[19:0]	MAX;
	wire	[19:0]	S0_MAX;
	wire	[19:0]	S1_MAX;
//////////////////// MEM //////////////////////
	always@(posedge clk or posedge rst)begin
		if(rst)begin
			for(i=3'd0;i<3'd4;i=i+1)begin
				MEM[i]<=20'd0;
			end
		end else begin
			for(i=3'd0;i<3'd4;i=i+1)begin
				if(en4mem[i])begin
					MEM[i]<=data_in;
				end
			end
		end
	end
	assign S0_MAX=(MEM[0]>MEM[1])?MEM[0]:MEM[1];
	assign S1_MAX=(MEM[1]>MEM[2])?MEM[1]:MEM[2];
	assign MAX=(S0_MAX>S1_MAX)?S0_MAX:S1_MAX;
endmodule