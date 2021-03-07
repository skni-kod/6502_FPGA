`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:13:19 03/07/2021
// Design Name:   reg_BI
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_BI.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_BI
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_BI;

	// Inputs
	reg DB_LOAD;
	reg INV_DB_LOAD;
	reg ADL_LOAD;
	reg [7:0] ADL_DATA;
	reg [7:0] DB_DATA;

	// Outputs
	wire [7:0] TO_ALU;

	// Instantiate the Unit Under Test (UUT)
	reg_BI uut (
		.DB_LOAD(DB_LOAD), 
		.INV_DB_LOAD(INV_DB_LOAD), 
		.ADL_LOAD(ADL_LOAD), 
		.ADL_DATA(ADL_DATA), 
		.DB_DATA(DB_DATA),  
		.TO_ALU(TO_ALU)
	);

	initial begin
		// Initialize Inputs
		DB_LOAD = 0;
		INV_DB_LOAD = 0;
		ADL_LOAD = 0;
		ADL_DATA = 0;
		DB_DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": DB_LOAD_SIGNAL: %b, INV_DB_LOAD_SIGNAL: %b, ADL_LOAD_SIGNAL: %b, ADL_DATA: %h, DB_DATA: %h, OUTPUT: %h", DB_LOAD, INV_DB_LOAD, ADL_LOAD, ADL_DATA, DB_DATA, TO_ALU);
		#1;
		$display("Expected output: XX\n");
		
		DB_DATA = 8'hAA;
		ADL_DATA = 8'hBB;
		
		DB_LOAD = 1;
		#1;
		DB_LOAD = 0;
		#1
		$display("Expected output: AA\n");
		
		INV_DB_LOAD = 1;
		#1;
		INV_DB_LOAD = 0;
		#1;
		$display("Expected outpuy: 55\n");
		
		ADL_LOAD = 1;
		#1;
		ADL_LOAD = 0;
		#1;
		$display("Expected output: BB\n");
		
		

	end
      
endmodule

