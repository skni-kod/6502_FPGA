`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:34:30 04/20/2019
// Design Name:   ALU_INPUT_MUX
// Module Name:   E:/FPGA/CPU/alu_in_mux_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_INPUT_MUX
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_in_mux_test;

	// Inputs
	reg [2:0] mux_code;
	reg [7:0] a_reg;
	reg [7:0] x_reg;
	reg [7:0] y_reg;
	reg [7:0] data_in;
	reg [7:0] sp;

	// Outputs
	wire [7:0] out;
	
	localparam ALU_IN_MUX_A = 8'h01;
	localparam ALU_IN_MUX_X  = 8'h02;
	localparam ALU_IN_MUX_Y = 8'h03;
	localparam ALU_IN_MUX_DATA = 8'h04;
	localparam ALU_IN_MUX_SP = 8'h05;
	localparam ALU_IN_MUX_ONE = 8'h06;

	// Instantiate the Unit Under Test (UUT)
	ALU_INPUT_MUX uut (
		.mux_code(mux_code), 
		.a_reg(a_reg), 
		.x_reg(x_reg), 
		.y_reg(y_reg), 
		.data_in(data_in), 
		.sp(sp), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		mux_code = 0;
		a_reg = 1;
		x_reg = 2;
		y_reg = 3;
		data_in = 4;
		sp = 5;

		// Wait 100 ns for global reset to finish
		#100;
      $monitor($time, ": out=%d", out);
		#10 mux_code = ALU_IN_MUX_A;
		#10 mux_code = ALU_IN_MUX_X;
		#10 mux_code = ALU_IN_MUX_Y;
		#10 mux_code = ALU_IN_MUX_DATA;
		#10 mux_code = ALU_IN_MUX_SP;
		#10 mux_code = ALU_IN_MUX_ONE;
		// Add stimulus here

	end
      
endmodule

