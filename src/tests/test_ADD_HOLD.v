`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:53:48 04/01/2021
// Design Name:   reg_ADD_HOLD
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_ADD_HOLD.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_ADD_HOLD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_ADD_HOLD;

	// Inputs
	reg ALU_LOAD;
	reg ADL_BUS_ENABLE;
	reg SB_L_BUS_ENABLE;
	reg SB_H_BUS_ENABLE;
	reg [7:0] ALU_DATA;

	// Outputs
	wire [7:0] ADL_BUS;
	wire [7:0] SB_BUS;

	// Instantiate the Unit Under Test (UUT)
	reg_ADD_HOLD uut (
		.ALU_LOAD(ALU_LOAD), 
		.ADL_BUS_ENABLE(ADL_BUS_ENABLE), 
		.SB_L_BUS_ENABLE(SB_L_BUS_ENABLE), 
		.SB_H_BUS_ENABLE(SB_H_BUS_ENABLE), 
		.ALU_DATA(ALU_DATA), 
		.ADL_BUS(ADL_BUS), 
		.SB_BUS(SB_BUS)
	);

	initial begin
		// Initialize Inputs
		ALU_LOAD = 0;
		ADL_BUS_ENABLE = 0;
		SB_L_BUS_ENABLE = 0;
		SB_H_BUS_ENABLE = 0;
		ALU_DATA = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		$monitor($time, ": LOAD_SIGNAL: %b, ADL_BUS_ENABLE_SIGNAL: %b, SB_L_BUS_ENABLE_SIGNAL: %b, SB_H_BUS_ENABLE_SIGNAL: %b, DATA_IN_STATE: %h, ADL_OUT_STATE: %h, SB_OUT_STATE: %b",
		ALU_LOAD, ADL_BUS_ENABLE, SB_L_BUS_ENABLE, SB_H_BUS_ENABLE, ALU_DATA, ADL_BUS, SB_BUS);
		
		ALU_LOAD = 1;
		#1;
		ALU_LOAD = 0;
		#1;
		$display("Expected outputs. ADL: XXh, SB: XXXXXXXX\n");
		
		ADL_BUS_ENABLE = 1;
		#1;
		ADL_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs. ADL: 00h, SB: XXXXXXXX\n");
		
		ALU_DATA = 8'hFF;
		#1;
		$display("Expected outputs. ADL: 00h, SB: XXXXXXXX\n");
		
		ADL_BUS_ENABLE = 1;
		#1;
		ADL_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs. ADL: 00h, SB: XXXXXXXX\n");
		
		ALU_LOAD = 1;
		#1;
		ALU_LOAD = 0;
		#1;
		$display("Expected outputs. ADL: 00h, SB: XXXXXXXX\n");
		
		ADL_BUS_ENABLE = 1;
		#1;
		ADL_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs. ADL: FFh, SB: XXXXXXXX\n");
		
		SB_L_BUS_ENABLE = 1;
		#1;
		SB_L_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs. ADL: FFh, SB: X1111111\n");
		
		ALU_DATA = 8'h00;
		#1;
		$display("Expected outputs. ADL: FFh, SB: X1111111\n");
		
		ALU_LOAD = 1;
		#1;
		ALU_LOAD = 0;
		#1;
		$display("Expected outputs. ADL: FFh, SB: X1111111\n");
		
		SB_H_BUS_ENABLE = 1;
		#1;
		SB_H_BUS_ENABLE = 0;
		#1;
		$display("Expected outputs. ADL: FFh, SB: 01111111\n");
	end
      
endmodule

