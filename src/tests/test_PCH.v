`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:06:13 04/14/2021
// Design Name:   reg_PCH
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_PCH.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_PCH
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PCH;

	// Inputs
	reg DB_BUS_ENABLE;
	reg ADH_BUS_ENABLE;
	reg CLK;
	reg [7:0] DATA;

	// Outputs
	wire [7:0] DB_BUS;
	wire [7:0] ADH_BUS;
	wire [7:0] PCH_LOOP;

	// Instantiate the Unit Under Test (UUT)
	reg_PCH uut (
		.DB_BUS_ENABLE(DB_BUS_ENABLE), 
		.ADH_BUS_ENABLE(ADH_BUS_ENABLE), 
		.CLK(CLK), 
		.DATA(DATA), 
		.DB_BUS(DB_BUS), 
		.ADH_BUS(ADH_BUS), 
		.PCH_LOOP(PCH_LOOP)
	);

	initial begin
		// Initialize Inputs
		DB_BUS_ENABLE = 0;
		ADH_BUS_ENABLE = 0;
		CLK = 0;
		DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": CLOCK_SIGNAL: %b, DB_ENABLE_SIGNAL: %b, ADH_ENABLE_SIGNAL: %b, DATA_IN_STATE: %h, DB_DATA_OUT_STATE: %h, ADH_DATA_OUT_STATE: %h, LOOPBACK_DATA_OUT_STATE: %h",
		CLK, DB_BUS_ENABLE, ADH_BUS_ENABLE, DATA, DB_BUS, ADH_BUS, PCH_LOOP);
		
		#1;
		$display("Expected outputs: DB=XX, ADH=XX, LOOP=XX");
		
		DATA = 8'hAA;
		#1;
		$display("Expected outputs: DB=XX, ADH=XX, LOOP=XX");
		
		CLK = 1;
		#1;
		CLK = 0;
		#1;
		$display("Expected outputs: DB=XX, ADH=XX, LOOP=AA");
		
		DB_BUS_ENABLE = 1;
		#1;
		DB_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs: DB=AA, ADH=XX, LOOP=AA");
		
		DATA = 8'hBB;
		#1;
		$display("Expected outputs: DB=AA, ADH=XX, LOOP=AA");
		
		CLK = 1;
		#1;
		CLK = 0;
		#1;
		$display("Expected outputs: DB=AA, ADH=XX, LOOP=BB");
		
		ADH_BUS_ENABLE = 1;
		#1;
		ADH_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs: DB=AA, ADH=BB, LOOP=BB");
	end
      
endmodule

