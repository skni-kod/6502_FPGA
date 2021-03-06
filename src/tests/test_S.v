`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:01:33 03/06/2021
// Design Name:   reg_S
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_S.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_S
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_S;

	// Inputs
	reg RELOAD;
	reg SB_LOAD;
	reg SB_BUS_ENABLE;
	reg ADL_BUS_ENABLE;
	reg [7:0] SB_DATA;

	// Outputs
	wire [7:0] SB_OUT;
	wire [7:0] ADL_OUT;

	// Instantiate the Unit Under Test (UUT)
	reg_S uut (
		.RELOAD(RELOAD), 
		.SB_LOAD(SB_LOAD), 
		.SB_BUS_ENABLE(SB_BUS_ENABLE), 
		.ADL_BUS_ENABLE(ADL_BUS_ENABLE), 
		.SB_DATA(SB_DATA), 
		.SB_OUT(SB_OUT), 
		.ADL_OUT(ADL_OUT)
	);

	initial begin
		// Initialize Inputs
		RELOAD = 0;
		SB_LOAD = 0;
		SB_BUS_ENABLE = 0;
		ADL_BUS_ENABLE = 0;
		SB_DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": SB_LOAD_SIGNAL: %b, SB_ENABLE_SIGNAL: %b, ADL_ENABLE_SIGNAL: %b, RELOAD_SIGNAL: %b, SB_DATA_IN_STATE: %h, SB_DATA_OUT_STATE: %h, ADL_DATA_OUT_STATE: %h",
		SB_LOAD, SB_BUS_ENABLE, ADL_BUS_ENABLE, RELOAD, SB_DATA, SB_OUT, ADL_OUT);
		
		RELOAD = 1;
		#1;
		RELOAD = 0;
		#1;
		$display("\tExpected values: SB: XX, ADL: XX\n");
		
		SB_BUS_ENABLE = 1;
		#1;
		SB_BUS_ENABLE = 0;
		#1;
		$display("\tExpected values: SB: XX, ADL: XX\n");
		
		ADL_BUS_ENABLE = 1;
		#1;
		ADL_BUS_ENABLE = 0;
		#1;
		$display("\tExpected values: SB: XX, ADL: XX\n");
		
		SB_DATA = 8'hFF;
		SB_LOAD = 1;
		#1;
		SB_LOAD = 0;
		#1;
		$display("\tExpected values: SB: XX, ADL: XX\n");
		
		ADL_BUS_ENABLE = 1;
		#1;
		ADL_BUS_ENABLE = 0;
		#1;
		$display("\tExpected values: SB: XX, ADL: FF\n");
		
		SB_DATA = 8'hAA;
		SB_LOAD = 1;
		#1;
		SB_LOAD = 0;
		#1;
		$display("\tExpected values: SB: XX, ADL: FF\n");
		
		SB_BUS_ENABLE = 1;
		#1;
		SB_BUS_ENABLE = 0;
		#1;
		$display("\tExpected values: SB: AA, ADL: FF\n");
		
		RELOAD = 1;
		#1;
		RELOAD = 0;
		#1;
		SB_BUS_ENABLE = 1;
		#1;
		SB_BUS_ENABLE = 0;
		#1;
		$display("\tExpected values: SB: AA, ADL: FF\n");
		

	end
      
endmodule

