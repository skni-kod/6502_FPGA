`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:06:45 04/14/2021
// Design Name:   reg_PCHS
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_PCHS.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_PCHS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PCHS;

	// Inputs
	reg PCH_LOAD;
	reg ADH_LOAD;
	reg [7:0] PCH_DATA;
	reg [7:0] ADH_DATA;

	// Outputs
	wire [7:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	reg_PCHS uut (
		.PCH_LOAD(PCH_LOAD), 
		.ADH_LOAD(ADH_LOAD), 
		.PCH_DATA(PCH_DATA), 
		.ADH_DATA(ADH_DATA), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		PCH_LOAD = 0;
		ADH_LOAD = 0;
		PCH_DATA = 0;
		ADH_DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": PCL_LOAD_SIGNAL: %b, ADL_LOAD_SIGNAL: %b, PCL_DATA_IN_STATE: %h, ADL_DATA_IN_STATE: %h, DATA_OUT_STATE: %h", PCH_LOAD, ADH_LOAD, PCH_DATA, ADH_DATA, OUT);
		
		#1;
		$display("Expected output: XX");
		
		ADH_DATA = 8'hAA;
		#1;
		$display("Expected output: XX");
		
		ADH_LOAD = 1;
		#1;
		ADH_LOAD = 0;
		#1;
		$display("Expected output: AA");
		
		PCH_DATA = OUT + 1;
		#1;
		$display("Expected output: AA");
		
		PCH_LOAD = 1;
		#1;
		PCH_LOAD = 0;
		#1;
		$display("Expected output: AB");
	end
      
endmodule

