`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:48:18 03/07/2021
// Design Name:   reg_PCL
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_PCL.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_PCL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PCL;

	// Inputs
	reg DB_BUS_ENABLE;
	reg ADL_BUS_ENABLE;
	reg CLK;
	reg [7:0] DATA;

	// Outputs
	wire [7:0] DB_BUS;
	wire [7:0] ADL_BUS;
	wire [7:0] PCL_LOOP;

	// Instantiate the Unit Under Test (UUT)
	reg_PCL uut (
		.DB_BUS_ENABLE(DB_BUS_ENABLE), 
		.ADL_BUS_ENABLE(ADL_BUS_ENABLE), 
		.CLK(CLK), 
		.DATA(DATA), 
		.DB_BUS(DB_BUS), 
		.ADL_BUS(ADL_BUS), 
		.PCL_LOOP(PCL_LOOP)
	);

	initial begin
		// Initialize Inputs
		DB_BUS_ENABLE = 0;
		ADL_BUS_ENABLE = 0;
		CLK = 0;
		DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": CLOCK_SIGNAL: %b, DB_ENABLE_SIGNAL: %b, ADL_ENABLE_SIGNAL: %b, DATA_IN_STATE: %h, DB_DATA_OUT_STATE: %h, ADL_DATA_OUT_STATE: %h, LOOPBACK_DATA_OUT_STATE: %h",
		CLK, DB_BUS_ENABLE, ADL_BUS_ENABLE, DATA, DB_BUS, ADL_BUS, PCL_LOOP);
		
		#1;
		$display("Expected outputs: DB=XX, ADL=XX, LOOP=XX");
		
		DATA = 8'hAA;
		#1;
		$display("Expected outputs: DB=XX, ADL=XX, LOOP=XX");
		
		CLK = 1;
		#1;
		CLK = 0;
		#1;
		$display("Expected outputs: DB=XX, ADL=XX, LOOP=AA");
		
		DB_BUS_ENABLE = 1;
		#1;
		DB_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs: DB=AA, ADL=XX, LOOP=AA");
		
		DATA = 8'hBB;
		#1;
		$display("Expected outputs: DB=AA, ADL=XX, LOOP=AA");
		
		CLK = 1;
		#1;
		CLK = 0;
		#1;
		$display("Expected outputs: DB=AA, ADL=XX, LOOP=BB");
		
		ADL_BUS_ENABLE = 1;
		#1;
		ADL_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs: DB=AA, ADL=BB, LOOP=BB");
		

	end
      
endmodule

