`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    23:14:43 04/16/2019
// Design Name:
// Module Name:    cpu_core
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
module cpu_core(
	input wire clk,
	input wire reset,
	input wire[7:0] din,
	output reg[15:0] addr,
	output wire clk_out,
	output reg[7:0] a_out,
	output reg[7:0] x_out,
	output reg[7:0] y_out,
	output reg[7:0] opcode_out,
	output reg[15:0] pc_out,
	output reg[3:0] opcode_state_out,
	output reg[7:0] alu_opcode_out,
	output reg[7:0] alu_out_out,
	output reg alu_cout_out,
	output reg alu_cin_out
    );

localparam ST_RESET = 3'd0;
localparam ST_FETCH = 3'd1;
localparam ST_RUN = 3'd2;

localparam ALU_IN_MUX_A = 8'h01;
localparam ALU_IN_MUX_X  = 8'h02;
localparam ALU_IN_MUX_Y = 8'h03;
localparam ALU_IN_MUX_DATA = 8'h04;
localparam ALU_IN_MUX_SP = 8'h05;
localparam ALU_IN_MUX_ONE = 8'h06;

localparam ALU_CARRY_MUX_0 = 8'h01;
localparam ALU_CARRY_MUX_1  = 8'h02;
localparam ALU_CARRY_MUX_CIN = 8'h03;

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

reg [7:0] A;
reg [7:0] X;
reg [7:0] Y;
reg [7:0] data_in;
reg [7:0] stack_pointer;

reg [15:0] pc = 3'd0;
reg [2:0] state = 3'd0;
reg [2:0] opcode_state = 3'd0;
reg [7:0] opcode = 8'd0;
reg [7:0] absolute = 8'd0;
reg done = 8'd0;

wire [7:0] alu_out;
reg [7:0] alu_opcode;
reg alu_cin = 0;
wire alu_cout;

reg [2:0] input_1_select;
reg [2:0] input_2_select;
reg [1:0] input_carry;

ALU_COMPLETE alu(
	.input_1_select(input_1_select),
	.input_2_select(input_2_select),
	.input_carry(input_carry),
	.a_reg(A),
	.x_reg(X),
	.y_reg(Y),
	.data_in(din),
	.sp(stack_pointer),
	.alu_opcode(alu_opcode),
	.out(alu_out),
	.cin(alu_cin),
	.cout(alu_cout)
);
assign clk_out = clk;

//STATE MACHINE
always@(posedge clk or posedge reset)
begin
	if(reset)
	begin
		state = ST_RESET;
	end
	else
		case(state)
			ST_RESET:
			begin
				A = 8'd0;
				X = 8'd0;
				Y = 8'd0;
				pc = 16'd0;
				opcode = 8'd0;
				stack_pointer = 8'd255;
				data_in = 8'd0;
				state = ST_FETCH;
			end
			ST_FETCH:
			begin
				addr = pc;
				opcode = din;
				state = ST_RUN;
			end
			ST_RUN:
			begin
				if(done)
				begin
					state = ST_FETCH;
					opcode_state = 3'd0;
					pc = pc + 1;
					done = 3'd0;
				end
			end
		endcase
end

always@(A, X, Y, opcode, pc, opcode_state, alu_opcode, alu_out, alu_cout, alu_cin)
begin
	a_out = A;
	x_out = X;
	y_out = Y;
	opcode_out = opcode;
	pc_out = pc;
	opcode_state_out = opcode_state;
	alu_opcode_out = alu_opcode;
	alu_out_out = alu_out;
	alu_cout_out = alu_cout;
	alu_cin_out = alu_cin;
end

//MICROCODE
always@(posedge clk)
begin
	addr = pc;
	if(state == ST_RUN)
		case(opcode)
			8'hA9: //LDA, #
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
					end
					3'd1:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA5: //LDA, zp
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
					end
					3'd1:
					begin
						opcode_state = opcode_state + 1;
						addr = din;
					end
					3'd2:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hB5: //LDA, zp,X
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
						alu_opcode = ALU_OP_ADD;
						input_1_select = ALU_IN_MUX_DATA;
						input_2_select = ALU_IN_MUX_X;
					end
					3'd1:
					begin
						opcode_state = opcode_state + 1;
						addr = alu_out;
					end
					3'd2:
					begin
						opcode_state = opcode_state + 1;
					end
					3'd3:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hAD: //LDA, abs
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
					end
					3'd1:
					begin
						absolute = din;
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
					end
					3'd2:
					begin
						addr = {din, absolute};
						opcode_state = opcode_state + 1;
					end
					3'd3:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hBD: //LDA, abs,X
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
						alu_opcode = ALU_OP_ADD;
						input_1_select = ALU_IN_MUX_DATA;
						input_2_select = ALU_IN_MUX_X;
					end
					3'd1:
					begin
						absolute = alu_out;
						pc = pc + 1;
						addr = pc;
						if (alu_cout == 0)
						begin
							opcode_state = opcode_state + 1;
							alu_opcode = ALU_OP_PASS_A;
							input_1_select = ALU_IN_MUX_DATA;
						end
						else
						begin
							opcode_state = opcode_state + 1;
							alu_opcode = ALU_OP_INC;
							input_1_select = ALU_IN_MUX_DATA;
						end
					end
					3'd2:
					begin
						opcode_state = opcode_state + 1;
					end
					3'd3:
					begin
						addr = {alu_out, absolute};
						opcode_state = opcode_state + 1;
					end
					3'd4:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA2: //LDX, #
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
					end
					3'd1:
					begin
						X = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA0: //LDY, #
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
					end
					3'd1:
					begin
						Y = din;
						done = 8'd1;
					end
				endcase
			end
			8'hAA: //TAX, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_PASS_A;
						input_1_select = ALU_IN_MUX_A;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						X = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h8A: //TXA, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_PASS_A;
						input_1_select = ALU_IN_MUX_X;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'hA8: //TAY, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_PASS_A;
						input_1_select = ALU_IN_MUX_A;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						Y = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h98: //TYA, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_PASS_A;
						input_1_select = ALU_IN_MUX_Y;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'hE8: //INX, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_INC;
						input_1_select = ALU_IN_MUX_X;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						X = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'hCA: //DEX, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_DEC;
						input_1_select = ALU_IN_MUX_X;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						X = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'hC8: //INY, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_INC;
						input_1_select = ALU_IN_MUX_Y;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						Y = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h88: //DEY, i
			begin
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_DEC;
						input_1_select = ALU_IN_MUX_Y;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						Y = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h69: //ADC, #
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						addr = pc;
						alu_opcode = ALU_OP_ADD;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd1:
					begin
						A = alu_out;
						input_carry = ALU_CARRY_MUX_CIN;
						done = 8'd1;
					end
				endcase
			end
			8'hE9: //SBC, #
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						alu_opcode = ALU_OP_SUB;
						addr = pc;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd1:
					begin
						A = alu_out;
						input_carry = ALU_CARRY_MUX_CIN;
						done = 8'd1;
					end
				endcase
			end
			8'h29: //AND, i
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						alu_opcode = ALU_OP_AND;
						addr = pc;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h09: //ORA, i
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						alu_opcode = ALU_OP_OR;
						addr = pc;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h49: //EOR, i
			begin
				case(opcode_state)
					3'd0:
					begin
						pc = pc + 1;
						opcode_state = opcode_state + 1;
						alu_opcode = ALU_OP_XOR;
						addr = pc;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h38: //SEC, i
			begin
				input_carry = ALU_CARRY_MUX_1;
				done = 8'd1;
			end
			8'h18: //CLC, i
			begin
				input_carry = ALU_CARRY_MUX_0;
				done = 8'd1;
			end
			8'hEA: //NOP, i
			begin
				done = 8'd1;
			end
			default:
			begin
			end
		endcase
end
endmodule
