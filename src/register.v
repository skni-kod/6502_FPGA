`timescale 1ns / 1ps
//Following link leads to the block diagram of the 6502, on which all registers are based
//Original creator of the diagram:  Donald F. Hanson
//Original document: https://projects.ncsu.edu/wcae//WCAE1/hanson.pdf
//https://www.witwright.com/DonPub/6502-Block-Diagram.pdf
//Most of the names of inputs/outputs corresponds to datapaths/markings on this schematic
//If any differences/special circumstances happen to arise, they should be explicitly noted "in place",
//as it is done in the following module

module reg_XY( //module for x and y registers
	//Possible to use as ADDRESS BUS, PRECODE, INSTRUCTION, register as well,
	//Just lock BUS_ENABLE high
	input wire LOAD,
	input wire BUS_ENABLE,
	input wire [7:0] DATA,
	output reg [7:0] DATA_OUT
	);

	reg [7:0] register;
	

	//@(*), means that evaluation happens if any of revelant signals gets changed
	always@(*)
	begin
		if(LOAD)
			register = DATA;
			
		if(BUS_ENABLE)
			DATA_OUT = register;
		else
			DATA_OUT = 8'hZZ;
	end


endmodule

//Module for Input Data Latch
module reg_DL( 
	input wire LOAD,
	input wire DB_BUS_ENABLE,
	input wire ADL_BUS_ENABLE,
	input wire ADH_BUS_ENABLE,
	input wire [7:0] DATA,
	output reg [7:0] DB_OUT,
	output reg [7:0] ADL_OUT,
	output reg [7:0] ADH_OUT
	);

	reg [7:0] register;
	

	always@(*)
	begin
		if(LOAD)
			register = DATA;
			
		if(DB_BUS_ENABLE)
			DB_OUT = register;
		else
			DB_OUT = 8'hZZ;
			
		if(ADL_BUS_ENABLE)
			ADL_OUT = register;
		else
			ADL_OUT = 8'hZZ;
			
		if(ADH_BUS_ENABLE)
			ADH_OUT = register;
		else
			ADH_OUT = 8'hZZ;
	end


endmodule

//Module for Adder Hold Register, holding ALU optput
module reg_ADD_HOLD(
	input wire ALU_LOAD,
	input wire ADL_BUS_ENABLE,
	input wire SB_L_BUS_ENABLE,
	input wire SB_H_BUS_ENABLE,
	input wire [7:0] ALU_DATA,

	output reg [7:0] ADL_BUS,
	output reg [7:0] SB_BUS
);

	reg [7:0] register;
	
	always@(*)
	begin
		if(ALU_LOAD)
			register = ALU_DATA;
			
		if(SB_L_BUS_ENABLE)
			SB_BUS[6:0] = register[6:0]; 
		else
			SB_BUS[6:0] = 7'bzzzzzzz;
			
		if(SB_H_BUS_ENABLE)
			SB_BUS[7] = register[7];
		else
			SB_BUS[7] = 1'bz;
			
		if(ADL_BUS_ENABLE)
			ADL_BUS = register;
		else
			ADL_BUS = 8'hZZ;

	end

endmodule

//Module for Processor Status Register
//First set of inputs are command lines
//Second set of inputs are data lines
//X_LOAD_Y means load given Y signal into X bit of register
//DBx means x-th bit of Data Bus
module reg_PSR( 
	input wire C_LOAD_DB0,
	input wire C_LOAD_IR5,
	input wire C_LOAD_ACR,

	input wire Z_LOAD_DB1,
	input wire Z_LOAD_DBZ, //DBZ is NOR'ed DB input
	
	input wire I_LOAD_DB2,
	input wire I_LOAD_IR5,
	
	input wire D_LOAD_DB3,
	input wire D_LOAD_IR5,

	input wire V_LOAD_DB6,
	input wire V_LOAD_AVR,
	input wire V_LOAD_I, //Copy I to V ???

	input wire N_LOAD_DB7,

	input wire BUS_ENABLE,


	input wire [7:0] DATA,
	input wire IR5,
	input wire ACR,
	input wire AVR,

	output reg [7:0] DATA_OUT
	);

	reg [7:0] register;
	
	

	always@(*)
	begin
		register[5] = 1;
		//bits 4 and 5 theoretically do not exist within the register itself
		//instead they are set on the fly by certain instructions
		//5th bit is always set to 1 though, so it is hardcoded here as well

		//INPUT section
		if(C_LOAD_ACR)
			register[0] = ACR;
		if(C_LOAD_IR5)
			register[0] = IR5;
		if(C_LOAD_DB0)
			register[0] = DATA[0];

		if(Z_LOAD_DB1)
			register[1] = DATA[1];
		if(Z_LOAD_DBZ) begin
			if(DATA>0)
				register[1] = 0;
			else
				register[1] = 1;
		end

		if(I_LOAD_DB2)
			register[2] = DATA[2];
		if(I_LOAD_IR5)
			register[2] = IR5;

		if(D_LOAD_DB3)
			register[3] = DATA[3];
		if(D_LOAD_IR5)
			register[3] = IR5;

		if(V_LOAD_AVR)
			register[6] = AVR;
		if(V_LOAD_DB6)
			register[6] = DATA[6];
		if(V_LOAD_I)
			register[6] = register[2];

		if(N_LOAD_DB7)
			register[7] = DATA[7];


		//OUTPUT section
		if(BUS_ENABLE)
			DATA_OUT = register;
		else
			DATA_OUT = 8'hZZ;
		

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
		else
			DB_BUS = 8'hZZ;
			
		if(ADL_BUS_ENABLE)
			ADL_BUS = register;
		else
			ADL_BUS = 8'hZZ;

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
	output reg [7:0] DATA_OUT
	);

	reg [7:0] register;

	always@(*)
	begin
		if(PCL_LOAD)
			register = PCL_DATA;
		if(ADL_LOAD)
			register = ADL_DATA;
		//Data on output is refreshed with any input signal change
		DATA_OUT = register;
	end

endmodule

//Module for Program Counter High Register
module reg_PCH(
	input wire DB_BUS_ENABLE,
	input wire ADH_BUS_ENABLE,
	input wire CLK,
	input wire [7:0] DATA, //Fed from "Increment logic" block
	output reg [7:0] DB_BUS,
	output reg [7:0] ADH_BUS,
	output reg [7:0] PCH_LOOP //Datapath back to PCHS
	);

	reg [7:0] register;

	always@(*)
	begin
		if(CLK)
			register = DATA;
			
		if(DB_BUS_ENABLE)
			DB_BUS = register;
		else
			DB_BUS = 8'hZZ;
			
		if(ADH_BUS_ENABLE)
			ADH_BUS = register;
		else
			ADH_BUS = 8'hZZ;
			

		//Fallback loop is always updated after cycle
		PCH_LOOP = register;
	end

endmodule

//Module for Program Counter High Select Register
module reg_PCHS(
	input wire PCH_LOAD,
	input wire ADH_LOAD,
	input wire [7:0] PCH_DATA,
	input wire [7:0] ADH_DATA,
	output reg [7:0] DATA_OUT
	);

	reg [7:0] register;

	always@(*)
	begin
		if(PCH_LOAD)
			register = PCH_DATA;
		if(ADH_LOAD)
			register = ADH_DATA;
		//Data on output is refreshed with any input signal change
		DATA_OUT = register;
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
		input wire INV_DB_LOAD,
		input wire ADL_LOAD,
		input wire [7:0] ADL_DATA,
		input wire [7:0] DB_DATA,
		output reg [7:0] TO_ALU //Data sent to ALU
	);

	reg [7:0] register;

	always@(*)
	begin
		//Inversion of Data Bus realised in_place
		if(INV_DB_LOAD) 		
			register = ~DB_DATA;
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
		else
			SB_OUT = 8'hZZ;
			  
		if(DB_BUS_ENABLE)
			DB_OUT = register;
		else
			DB_OUT = 8'hZZ;
			  
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
		if(RELOAD)
			register = register;
		else if(SB_LOAD)
			register = SB_DATA;
			
		if(SB_BUS_ENABLE)
			SB_OUT = register;
		else
			SB_OUT = 8'hZZ;
			
		if(ADL_BUS_ENABLE)
			ADL_OUT = register;
		else
			SB_OUT = 8'hZZ;
		
	end

endmodule
