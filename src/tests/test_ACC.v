`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:36 03/06/2021
// Design Name:   reg_ACC
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_ACC.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_ACC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ACC;

	// Inputs
	reg LOAD;
	reg SB_BUS_ENABLE;
	reg DB_BUS_ENABLE;
	reg [7:0] DAA_DATA;

	// Outputs
	wire [7:0] SB_OUT;
	wire [7:0] DB_OUT;

	// Instantiate the Unit Under Test (UUT)
	reg_ACC uut (
		.LOAD(LOAD), 
		.SB_BUS_ENABLE(SB_BUS_ENABLE), 
		.DB_BUS_ENABLE(DB_BUS_ENABLE), 
		.DAA_DATA(DAA_DATA), 
		.SB_OUT(SB_OUT), 
		.DB_OUT(DB_OUT)
	);

	initial begin
		// Initialize Inputs
		LOAD = 0;
		SB_BUS_ENABLE = 0;
		DB_BUS_ENABLE = 0;
		DAA_DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		$monitor($time, ": LOAD_SIGNAL: %b, SB_ENABLE_SIGNAL: %b, DB_ENABLE_SIGNAL: %b, DATA_IN_STATE: %h, DB_DATA_OUT_STATE: %h, SB_DATA_OUT_STATE: %h", LOAD, SB_BUS_ENABLE, DB_BUS_ENABLE, DAA_DATA, DB_OUT, SB_OUT);
		// Add stimulus here
		
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("Expected outputs: DB=XX, SB=XX\n");
		
		DAA_DATA = 8'hFF;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("Expected outputs: DB=XX, SB=XX\n");
		
		SB_BUS_ENABLE = 1;
		#1;
		SB_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs: DB=XX, SB=FF\n");
		
		DAA_DATA = 8'hAA;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("Expected outputs: DB=XX, SB=FF\n");
		
		DB_BUS_ENABLE = 1;
		#1;
		DB_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs: DB=AA, SB=FF\n");
		
		

	end
      
endmodule

