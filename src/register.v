`timescale 1ns / 1ps
//Following link leads to the block diagram of the 6502, on which all registers are based
//Original creator of the diagram:  Donald F. Hanson
//Original document: https://projects.ncsu.edu/wcae//WCAE1/hanson.pdf
//https://www.witwright.com/DonPub/6502-Block-Diagram.pdf
//Most of the names of inputs/outputs corresponds to datapaths/markings on this schematic
//If any differences/special circumstances happen to arise, they should be explicitly noted "in place",
//as it is done in the following module

module reg_XY( //module for x and y registers
	//Possible to use as ADDRESS BUS, PRECODE register as well,
	//Just lock BUS_ENABLE high
	input wire LOAD,
	input wire BUS_ENABLE,
	input wire [7:0] DATA,
	output reg [7:0] OUT
	);

	reg [7:0] register;
	

	//@(*), means that evaluation happens if any of revelant signals gets changed
	always@(*)
	begin
		if(LOAD)
			register = DATA;
		if(BUS_ENABLE)
			OUT = register;
	end


endmodule

//Module for Program Counter Low Register
module reg_PCL(
	input wire DB_BUS_ENABLE,
	input wire ADL_BUS_ENABLE,
	input wire CLK,
	input wire [7:0] DATA, //Fed from "Increment logic" block
	output reg [7:0] DB_BUS,
	output reg [7:0] ADL_BUS,
	output reg [7:0] PCL_LOOP //Datapath back to PCLS
	);

	reg [7:0] register;

	always@(*)
	begin
		if(CLK)
			register = DATA;
		if(DB_BUS_ENABLE)
			DB_BUS = register;
		if(ADL_BUS_ENABLE)
			ADL_BUS = register;

		//Fallback loop is always updated after cycle
		PCL_LOOP = register;
	end

endmodule

//Module for Program Counter Low Select Register
module reg_PCLS(
	input wire PCL_LOAD,
	input wire ADL_LOAD,
	input wire [7:0] PCL_DATA,
	input wire [7:0] ADL_DATA,
	output reg [7:0] OUT
	);

	reg [7:0] register;

	always@(*)
	begin
		if(PCL_LOAD)
			register = PCL_DATA;
		if(ADL_LOAD)
			register = ADL_DATA;

		//Data on output is refreshed with any input signal change
		OUT = register;
	end

endmodule


//module for A input register of ALU
//Prefix tells the name of source/target of data
module reg_AI(
		input wire ZERO_LOAD,
		input wire SB_LOAD,
		input wire [7:0] SB_DATA,
		output reg [7:0] TO_ALU //Data sent to ALU
	);

	reg [7:0] register;
	
	always@(*)
	begin
		if(ZERO_LOAD) 		
			register = 0;
		if(SB_LOAD)
			register = SB_DATA;

		//Data on output is refreshed with any input signal change
		TO_ALU = register;
	end

endmodule

//module for B input register of ALU
//Prefix tells the name of source/target of data
module reg_BI(
		input wire DB_LOAD,
		input wire INV_DB_LOAD, //Load data from inverted Data Bus
		input wire ADL_LOAD,
		input wire [7:0] ADL_DATA,
		input wire [7:0] DB_DATA,
		input wire [7:0] INV_DB_DATA,
		output reg [7:0] TO_ALU //Data sent to ALU
	);

	reg [7:0] register;

	always@(*)
	begin
		//Maybe implement inversion In Place?
		if(INV_DB_LOAD) 		
			register = INV_DB_DATA;
		if(DB_LOAD)
			register = DB_DATA;
		if(ADL_LOAD)
			register = ADL_DATA;

		//Data on output is refreshed with any input signal change
		TO_ALU = register;
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
