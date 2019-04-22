`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:32:12 04/16/2019
// Design Name:   ALU_INPUT_MUX
// Module Name:   E:/FPGA/CPU/alu_input_mux_test.v
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

module alu_input_mux_test;

	// Inputs
	reg [1:0] mux_code;
	reg [7:0] a_reg;
	reg [7:0] x_reg;
	reg [7:0] y_reg;
	reg [7:0] data_in;
	reg [7:0] sp;

	// Outputs
	wire [7:0] out;

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
		a_reg = 0;
		x_reg = 0;
		y_reg = 0;
		data_in = 0;
		sp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

