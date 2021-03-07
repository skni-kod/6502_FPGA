`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:04:16 03/07/2021
// Design Name:   reg_AI
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_AI.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_AI
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_AI;

	// Inputs
	reg ZERO_LOAD;
	reg SB_LOAD;
	reg [7:0] SB_DATA;

	// Outputs
	wire [7:0] TO_ALU;

	// Instantiate the Unit Under Test (UUT)
	reg_AI uut (
		.ZERO_LOAD(ZERO_LOAD), 
		.SB_LOAD(SB_LOAD), 
		.SB_DATA(SB_DATA), 
		.TO_ALU(TO_ALU)
	);

	initial begin
		// Initialize Inputs
		ZERO_LOAD = 0;
		SB_LOAD = 0;
		SB_DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": SB_LOAD_SIGNAL: %b, ZERO_SIGNAL: %b, DATA_IN_STATE: %h, DATA_OUT_STATE: %h", SB_LOAD, ZERO_LOAD, SB_DATA, TO_ALU);
		
		SB_DATA = 8'hFF;
		#1;
		$display("Expected output: XX");
		
		SB_LOAD = 1;
		#1;
		SB_LOAD = 0;
		#1;
		$display("Expected output: FF");
		
		ZERO_LOAD = 1;
		#1;
		ZERO_LOAD = 0;
		#1;
		$display("Expected output: 0");
		
		

	end
      
endmodule

