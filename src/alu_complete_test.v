`timescale 1ns / 10ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:27:01 04/20/2019
// Design Name:   ALU_COMPLETE
// Module Name:   E:/FPGA/CPU/alu_complete_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_COMPLETE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_complete_test;

	localparam ALU_IN_MUX_A = 8'h01;
	localparam ALU_IN_MUX_X  = 8'h02;
	localparam ALU_IN_MUX_Y = 8'h03;
	localparam ALU_IN_MUX_DATA = 8'h04;
	localparam ALU_IN_MUX_SP = 8'h05;
	localparam ALU_IN_MUX_ONE = 8'h06;
	
	localparam ALU_OP_AND = 8'h01;
	localparam ALU_OP_OR  = 8'h02;
	localparam ALU_OP_XOR = 8'h03;
	localparam ALU_OP_NOT = 8'h04;

	localparam ALU_OP_ASL = 8'h11;
	localparam ALU_OP_ROL = 8'h12;
	localparam ALU_OP_ASR = 8'h13;
	localparam ALU_OP_ROR = 8'h14;

	localparam ALU_OP_ADD = 8'h21;
	localparam ALU_OP_INC = 8'h22;
	localparam ALU_OP_SUB = 8'h23;
	localparam ALU_OP_DEC = 8'h24;

	// Inputs
	reg [2:0] input_1_select;
	reg [2:0] input_2_select;
	reg [7:0] a_reg;
	reg [7:0] x_reg;
	reg [7:0] y_reg;
	reg [7:0] data_in;
	reg [7:0] sp;
	reg [7:0] alu_opcode;
	reg cin;
	wire cout;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	ALU_COMPLETE uut (
		.input_1_select(input_1_select), 
		.input_2_select(input_2_select), 
		.a_reg(a_reg), 
		.x_reg(x_reg), 
		.y_reg(y_reg), 
		.data_in(data_in), 
		.sp(sp), 
		.alu_opcode(alu_opcode), 
		.out(out), 
		.cin(cin), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		input_1_select = 0;
		input_2_select = 0;
		a_reg = 1;
		x_reg = 2;
		y_reg = 3;
		data_in = 4;
		sp = 5;
		alu_opcode = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
                $monitor($time, ": output=%d, carry=%d", out, cout);
		#10 input_1_select = ALU_IN_MUX_A;
			input_2_select = ALU_IN_MUX_A;
			alu_opcode = ALU_OP_ADD;
		#10 input_1_select = ALU_IN_MUX_A;
			input_2_select = ALU_IN_MUX_X;
			alu_opcode = ALU_OP_ADD;
		#10 input_1_select = ALU_IN_MUX_A;
			input_2_select = ALU_IN_MUX_Y;
			alu_opcode = ALU_OP_ADD;
		#10 input_1_select = ALU_IN_MUX_A;
			input_2_select = ALU_IN_MUX_DATA;
			alu_opcode = ALU_OP_ADD;
		#10 input_1_select = ALU_IN_MUX_A;
			input_2_select = ALU_IN_MUX_SP;
			alu_opcode = ALU_OP_ADD;
		#10 input_1_select = ALU_IN_MUX_A;
			input_2_select = ALU_IN_MUX_ONE;
			alu_opcode = ALU_OP_ADD;
		// Add stimulus here
		#100;
		$finish(2);

	end
      
endmodule