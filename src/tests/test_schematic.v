// Verilog test fixture created from schematic /home/ise/Verilog/6502_FPGA/src/test.sch - Sun May  2 21:42:05 2021

`timescale 1ns / 1ps

module test_test_sch_tb();

// Inputs
   reg X_LOAD;
   reg X_BE;
	reg Y_LOAD;
   reg Y_BE;
   reg [7:0] DATA_IN;

// Output
   wire [7:0] DATA_OUT;

// Bidirs

// Instantiate the UUT
   test UUT (
		.X_LOAD(X_LOAD), 
		.X_BE(X_BE),
		.Y_LOAD(Y_LOAD), 
		.Y_BE(Y_BE), 		
		.DATA_IN(DATA_IN), 
		.DATA_OUT(DATA_OUT)
   );
// Initialize Inputs

   initial begin
		X_LOAD = 0;
		X_BE = 0;
		Y_LOAD = 0;
		Y_BE = 0;
		DATA_IN = 0;
		
		#1;
		X_LOAD = 1;
		#1;
		X_LOAD = 0;
		#1;
		X_BE = 1;
		#1;
		X_BE = 0;
		#1;
		
		DATA_IN = 8'hAA;
		#1;
		X_LOAD = 1;
		#1;
		X_LOAD = 0;
		#1;
		X_BE = 1;

   end
	
endmodule
