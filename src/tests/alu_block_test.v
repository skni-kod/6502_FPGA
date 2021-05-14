`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:15 05/14/2021
// Design Name:   ALU_block
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/alu_block_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_block_test;

	// Inputs
	reg sig_DAA;
	reg sig_CARRY_IN;
	reg sig_SUMS;
	reg sig_ANDS;
	reg sig_EORS;
	reg sig_ORS;
	reg sig_SRS;
	reg [7:0] reg_A;
	reg [7:0] reg_B;

	// Outputs
	wire sig_AVR;
	wire sig_ACR;
	wire sig_HC;
	wire [7:0] ALU_OUT;

	// Instantiate the Unit Under Test (UUT)
	ALU_block uut (
		.sig_DAA(sig_DAA), 
		.sig_CARRY_IN(sig_CARRY_IN), 
		.sig_SUMS(sig_SUMS), 
		.sig_ANDS(sig_ANDS), 
		.sig_EORS(sig_EORS), 
		.sig_ORS(sig_ORS), 
		.sig_SRS(sig_SRS), 
		.reg_A(reg_A), 
		.reg_B(reg_B), 
		.sig_AVR(sig_AVR), 
		.sig_ACR(sig_ACR), 
		.sig_HC(sig_HC), 
		.ALU_OUT(ALU_OUT)
	);

	initial begin
		// Initialize Inputs
		sig_DAA = 0;
		sig_CARRY_IN = 0;
		sig_SUMS = 0;
		sig_ANDS = 0;
		sig_EORS = 0;
		sig_ORS = 0;
		sig_SRS = 0;
		reg_A = 0;
		reg_B = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, "-> A: %b, B: %b, Output of operation: OUT = %b, Overflow = %b, Carry out = %b", reg_A, reg_B,  ALU_OUT, sig_AVR, sig_ACR);
		
		$display("Registers initialization");
		reg_A = 8'hF0;
		reg_B = 8'h00;
		#1;
		
		$display("\nAdding values of registers...");
		sig_SUMS = 1;
		#1;
		$display("Deactivating addition");
		sig_SUMS = 0;
		#1;
		
		$display("\nANDing values of registers...");
		sig_ANDS = 1;
		#1;
		$display("Deactivating AND signal");
		sig_ANDS = 0;
		#1;
		
		$display("\nXORing values of registers...");
		sig_EORS = 1;
		#1;
		$display("Deactivating XOR signal");
		sig_EORS = 0;
		#1;
		
		$display("\nORing values of registers...");
		sig_ORS = 1;
		#1;
		$display("Deactivating OR signal");
		sig_ORS = 0;
		#1;
		
		$display("\nShifting right value of A register...");
		sig_SRS = 1;
		#1;
		$display("Deactivating SR signal");
		sig_SRS = 0;
		#1;
		
		$display("\n\nReinitializing registers with different values");
		reg_A = 8'hAB;
		reg_B = 8'hF1;
		#1;
		
		$display("\nReruning tests....\n\n");
		
		$display("\nAdding values of registers...");
		sig_SUMS = 1;
		#1;
		$display("Deactivating addition");
		sig_SUMS = 0;
		#1;
		
		$display("\nANDing values of registers...");
		sig_ANDS = 1;
		#1;
		$display("Deactivating AND signal");
		sig_ANDS = 0;
		#1;
		
		$display("\nXORing values of registers...");
		sig_EORS = 1;
		#1;
		$display("Deactivating XOR signal");
		sig_EORS = 0;
		#1;
		
		$display("\nORing values of registers...");
		sig_ORS = 1;
		#1;
		$display("Deactivating OR signal");
		sig_ORS = 0;
		#1;
		
		$display("\nShifting right value of A register...");
		sig_SRS = 1;
		#1;
		$display("Deactivating SR signal");
		sig_SRS = 0;
		#1;
	end
      
endmodule

