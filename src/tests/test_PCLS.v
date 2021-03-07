`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:01:19 03/07/2021
// Design Name:   reg_PCLS
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_PCLS.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_PCLS
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PCLS;

	// Inputs
	reg PCL_LOAD;
	reg ADL_LOAD;
	reg [7:0] PCL_DATA;
	reg [7:0] ADL_DATA;

	// Outputs
	wire [7:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	reg_PCLS uut (
		.PCL_LOAD(PCL_LOAD), 
		.ADL_LOAD(ADL_LOAD), 
		.PCL_DATA(PCL_DATA), 
		.ADL_DATA(ADL_DATA), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		PCL_LOAD = 0;
		ADL_LOAD = 0;
		PCL_DATA = 0;
		ADL_DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": PCL_LOAD_SIGNAL: %b, ADL_LOAD_SIGNAL: %b, PCL_DATA_IN_STATE: %h, ADL_DATA_IN_STATE: %h, DATA_OUT_STATE: %h", PCL_LOAD, ADL_LOAD, PCL_DATA, ADL_DATA, OUT);
		
		#1;
		$display("Expected output: XX");
		
		ADL_DATA = 8'hAA;
		#1;
		$display("Expected output: XX");
		
		ADL_LOAD = 1;
		#1;
		ADL_LOAD = 0;
		#1;
		$display("Expected output: AA");
		
		PCL_DATA = OUT + 1;
		#1;
		$display("Expected output: AA");
		
		PCL_LOAD = 1;
		#1;
		PCL_LOAD = 0;
		#1;
		$display("Expected output: AB");
		
		

	end
      
endmodule

