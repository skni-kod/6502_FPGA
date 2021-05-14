// Verilog test fixture created from schematic /home/ise/ISE_VM_SHARED/6502_FPGA/src/schematics/ALU_basic_setup.sch - Fri May 14 18:32:24 2021

`timescale 1ns / 1ps

module ALU_basic_setup_ALU_basic_setup_sch_tb();

// Inputs
   reg SB_TO_A;
   reg DB_TO_B;
   reg NOT_DB_TO_B;
   reg ADL_TO_B;
   reg sig_DAA;
   reg sig_CARRY_IN;
   reg sig_SUMS;
   reg sig_ANDS;
   reg sig_EORS;
   reg sig_ORS;
   reg sig_SRS;
   reg ALU_TO_HOLD;
   reg HOLD_TO_ADL;
   reg HOLD_L_TO_SB;
   reg HOLD_H_TO_SB;
   reg ZERO_A;
   reg dummy_HIGH;
   reg force_DB;
   reg force_SB;
   reg force_ADL;
   reg [7:0] DUMMY_DB;
   reg [7:0] DUMMY_ADL;
   reg [7:0] DUMMY_SB;

// Output
   wire [7:0] ADL;
   wire [7:0] SB;
   wire [7:0] DB;
   wire AVR_OUT;
   wire ACR_OUT;
   wire HC_OUT;

// Bidirs

// Instantiate the UUT
   ALU_basic_setup UUT (
		.SB_TO_A(SB_TO_A), 
		.DB_TO_B(DB_TO_B), 
		.NOT_DB_TO_B(NOT_DB_TO_B), 
		.ADL_TO_B(ADL_TO_B), 
		.ADL(ADL), 
		.sig_DAA(sig_DAA), 
		.sig_CARRY_IN(sig_CARRY_IN), 
		.sig_SUMS(sig_SUMS), 
		.sig_ANDS(sig_ANDS), 
		.sig_EORS(sig_EORS), 
		.sig_ORS(sig_ORS), 
		.sig_SRS(sig_SRS), 
		.SB(SB), 
		.DB(DB), 
		.ALU_TO_HOLD(ALU_TO_HOLD), 
		.HOLD_TO_ADL(HOLD_TO_ADL), 
		.HOLD_L_TO_SB(HOLD_L_TO_SB), 
		.HOLD_H_TO_SB(HOLD_H_TO_SB), 
		.ZERO_A(ZERO_A), 
		.AVR_OUT(AVR_OUT), 
		.ACR_OUT(ACR_OUT), 
		.HC_OUT(HC_OUT), 
		.dummy_HIGH(dummy_HIGH), 
		.force_DB(force_DB), 
		.force_SB(force_SB), 
		.force_ADL(force_ADL), 
		.DUMMY_DB(DUMMY_DB), 
		.DUMMY_ADL(DUMMY_ADL), 
		.DUMMY_SB(DUMMY_SB)
   );
// Initialize Inputs

	initial begin
		SB_TO_A = 0;
		DB_TO_B = 0;
		NOT_DB_TO_B = 0;
		ADL_TO_B = 0;
		sig_DAA = 0;
		sig_CARRY_IN = 0;
		sig_SUMS = 0;
		sig_ANDS = 0;
		sig_EORS = 0;
		sig_ORS = 0;
		sig_SRS = 0;
		ALU_TO_HOLD = 0;
		HOLD_TO_ADL = 0;
		HOLD_L_TO_SB = 0;
		HOLD_H_TO_SB = 0;
		ZERO_A = 0;
		dummy_HIGH = 0;
		force_DB = 0;
		force_SB = 0;
		force_ADL = 0;
		DUMMY_DB = 0;
		DUMMY_ADL = 0;
		DUMMY_SB = 0;
	end
endmodule
