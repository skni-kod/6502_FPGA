`timescale 1ns / 1ps

module register(
    );
	 

endmodule



module reg_XY( //module for x and y registers
    input wire LOAD,
    input wire BUS_ENABLE,
    input wire [7:0] DATA,
    output reg [7:0] OUT
    );

	reg [7:0] register;
	


	always@(*)
	begin
		 if(LOAD)
			  register = DATA;
		 if(BUS_ENABLE)
			  OUT = register;
	end


endmodule

module reg_ACC( //module for accumulator register
	//prefix tells the name of source/target datapath
	input wire LOAD,
	input wire SB_BUS_ENABLE,
	input wire DB_BUS_ENABLE,
	input wire [7:0] DAA_DATA, //Data fed from Decimal Adjust Adders (DAA)
	output reg [7:0] SB_OUT,
	output reg [7:0] DB_OUT
	);

	reg [7:0] register;
	


	always@(*)
	begin
		if(LOAD)
			  register = DAA_DATA;
		if(SB_BUS_ENABLE)
			  SB_OUT = register;
		if(DB_BUS_ENABLE)
			  DB_OUT = register;
	end


endmodule


module reg_S( //module for Stack Pointer Register
	input wire RELOAD,
	input wire SB_LOAD,
   input wire SB_BUS_ENABLE,
   input wire ADL_BUS_ENABLE,
   input wire [7:0] SB_DATA,
   output reg [7:0] SB_OUT,
   output reg [7:0] ADL_OUT
   );

	reg [7:0] register;
	


	always@(*)
	begin
		if(SB_LOAD)
			register = SB_DATA;
		if(SB_BUS_ENABLE)
			SB_OUT = register;
		if(ADL_BUS_ENABLE)
			ADL_OUT = register;
		if(RELOAD)
			register = register;
	end


endmodule