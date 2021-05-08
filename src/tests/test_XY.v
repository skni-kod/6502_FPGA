`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:56:16 03/06/2021
// Design Name:   reg_XY
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_XY.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_XY
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_XY;

	// Inputs
	reg LOAD;
	reg BUS_ENABLE;
	reg [7:0] DATA;

	// Outputs
	wire [7:0] DATA_OUT;

	// Instantiate the Unit Under Test (UUT)
	reg_XY uut (
		.LOAD(LOAD), 
		.BUS_ENABLE(BUS_ENABLE), 
		.DATA(DATA), 
		.DATA_OUT(DATA_OUT)
	);

	initial begin
		// Initialize Inputs
		LOAD = 0;
		BUS_ENABLE = 0;
		DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
      $monitor($time, ": LOAD_SIGNAL: %b, BUS_ENABLE_SIGNAL: %b, DATA_IN_STATE: %h, DATA_OUT_STATE: %h", LOAD, BUS_ENABLE, DATA, DATA_OUT);
		// Add stimulus here
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("Expected output: xx\n");
		
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: 00\n");
		
		DATA = 8'hAA;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("Expected output: 00\n");
		
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: AA\n");
		
		DATA = 8'hFF;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("Expected output: AA\n");
		
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: FF\n");
		
		DATA = 8'h00;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("Expected output: FF\n");
		
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: 00\n");

		

	end
      
endmodule

