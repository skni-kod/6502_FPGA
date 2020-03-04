`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    22:16:06 12/03/2018
// Design Name:
// Module Name:    ALU
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module ALU(
	input wire [7:0] a,
	input wire [7:0] b,
	input wire [7:0] opcode,
	input wire carry_in,

	output reg [7:0]  y,
	output reg carry_out
	/*output reg zero,
	output reg overflow,*/
	/*output reg sign*/
    );

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

	localparam ALU_OP_PASS_A = 8'h31;
	localparam ALU_OP_NOP = 8'h32;
	//localparam ALU_OP_CMP = 8'h31;

	always @(*)
	begin
		case(opcode)
			ALU_OP_AND:
				y = a & b;
			ALU_OP_OR:
				y = a | b;
			ALU_OP_XOR:
				y = a ^ b;
			ALU_OP_NOT:
				y = ~a;
			ALU_OP_ASL:
				{carry_out, y} = a << 1;
			ALU_OP_ROL:
				{carry_out, y} = {a, carry_in};
			ALU_OP_ROR:
				{carry_out, y} = {a[0], carry_in, a[7:1]};
			ALU_OP_ADD:
				{carry_out, y} = a + b + carry_in;
			ALU_OP_INC:
				{carry_out, y} = a + 1'b1;
			ALU_OP_SUB:
				begin
					{carry_out, y} = a - b - (1'b1 - carry_in);
					carry_out = carry_out ^ 1;
				end
			ALU_OP_DEC:
				y = a - 1'b1;
			ALU_OP_PASS_A:
				{carry_out, y} = 8'b0 + a;
			ALU_OP_NOP:
				;
			/*ALU_OP_CMP:
				begin
					if(a >= b)
					begin
						zero = 1'b1;
						carry_out = 1'b1;
					end
					else if (a==b)
					begin
						zero = 1'b1;
						carry_out = 1'b0;
					end
					else
					begin
						zero = 1'b0;
						carry_out = 1'b0;
					end
				end*/
			default:
				{carry_out, y} = 8'b0 + a;
		endcase
	end
endmodule
