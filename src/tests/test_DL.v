`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:06 04/14/2021
// Design Name:   reg_DL
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_DL.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_DL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_DL;

	// Inputs
	reg LOAD;
	reg DB_BUS_ENABLE;
	reg ADL_BUS_ENABLE;
	reg ADH_BUS_ENABLE;
	reg [7:0] DATA;

	// Outputs
	wire [7:0] DB_OUT;
	wire [7:0] ADL_OUT;
	wire [7:0] ADH_OUT;

	// Instantiate the Unit Under Test (UUT)
	reg_DL uut (
		.LOAD(LOAD), 
		.DB_BUS_ENABLE(DB_BUS_ENABLE), 
		.ADL_BUS_ENABLE(ADL_BUS_ENABLE), 
		.ADH_BUS_ENABLE(ADH_BUS_ENABLE), 
		.DATA(DATA), 
		.DB_OUT(DB_OUT), 
		.ADL_OUT(ADL_OUT), 
		.ADH_OUT(ADH_OUT)
	);

	initial begin
		// Initialize Inputs
		LOAD = 0;
		DB_BUS_ENABLE = 0;
		ADL_BUS_ENABLE = 0;
		ADH_BUS_ENABLE = 0;
		DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": LOAD_SIGNAL: %b, DB_BUS_ENABLE_SIGNAL: %b, ADL_BUS_ENABLE_SIGNAL: %b, ADH_BUS_ENABLE_SIGNAL: %b, DATA_IN_STATE: %h, DB_DATA_OUT_STATE: %h, ADL_DATA_OUT_STATE: %h, ADH_DATA_OUT_STATE: %h",
		LOAD, DB_BUS_ENABLE, ADL_BUS_ENABLE, ADH_BUS_ENABLE, DATA, DB_OUT, ADL_OUT, ADH_OUT);
		#1;
		$display("\tExpeted outputs: DB=XX, ADL=XX, ADH=XX");
		
		DATA = 8'hAA;
		#1;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("\tExpeted outputs: DB=XX, ADL=XX, ADH=XX");
		

		DB_BUS_ENABLE = 1;
		#1;
		DB_BUS_ENABLE = 0;
		#1;
		$display("\tExpeted outputs: DB=AA, ADL=XX, ADH=XX");
		
		DATA = 8'hBB;
		#1;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("\tExpeted outputs: DB=AA, ADL=XX, ADH=XX");
		

		ADL_BUS_ENABLE = 1;
		#1;
		ADL_BUS_ENABLE = 0;
		#1;
		$display("\tExpeted outputs: DB=AA, ADL=BB, ADH=XX");
		
		DATA = 8'hCC;
		#1;
		LOAD = 1;
		#1;
		LOAD = 0;
		#1;
		$display("\tExpeted outputs: DB=AA, ADL=BB, ADH=XX");
		

		ADH_BUS_ENABLE = 1;
		#1;
		ADH_BUS_ENABLE = 0;
		#1;
		$display("\tExpeted outputs: DB=AA, ADL=BB, ADH=CC");
		
		

	end
      
endmodule

