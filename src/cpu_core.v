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
localparam ALU_OP_NOP = 8'h32;

reg [7:0] A;
reg [7:0] X;
reg [7:0] Y;
reg [7:0] data_in;
reg [7:0] stack_pointer;

reg [15:0] pc = 3'd0;
reg [2:0] state = 3'd0;
reg [2:0] opcode_state = 3'd0;
reg [7:0] opcode = 8'd0;
reg [7:0] lsbyte = 8'd0;
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

task immediate;
begin
	(* full_case *)
	case(opcode_state)
		3'd0:
		begin
			pc = pc + 1;
			opcode_state = opcode_state + 1;
			addr = pc;
		end
	endcase
end
endtask

task zeropage;
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
	endcase
end
endtask

task zeropage_register;
input y_register;
begin
	case(opcode_state)
		3'd0:
		begin
			pc = pc + 1;
			opcode_state = opcode_state + 1;
			addr = pc;
			input_carry = ALU_CARRY_MUX_0;
			alu_opcode = ALU_OP_ADD;
			input_1_select = ALU_IN_MUX_DATA;
			if(y_register)
				input_2_select = ALU_IN_MUX_Y;
			else
				input_2_select = ALU_IN_MUX_X;
		end
		3'd1:
		begin
			opcode_state = opcode_state + 1;
		end
		3'd2:
		begin
			opcode_state = opcode_state + 1;
			addr = alu_out;
		end
	endcase
end
endtask

task absolute;
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
			lsbyte = din;
			pc = pc + 1;
			opcode_state = opcode_state + 1;
			addr = pc;
		end
		3'd2:
		begin
			addr = {din, lsbyte};
			opcode_state = opcode_state + 1;
		end
	endcase
end
endtask

task absolute_register;
input y_register;
begin
	case(opcode_state)
		3'd0:
		begin
			pc = pc + 1;
			opcode_state = opcode_state + 1;
			addr = pc;
			alu_opcode = ALU_OP_ADD;
			input_carry = ALU_CARRY_MUX_0;
			input_1_select = ALU_IN_MUX_DATA;
			if(y_register)
				input_2_select = ALU_IN_MUX_Y;
			else
				input_2_select = ALU_IN_MUX_X;
		end
		3'd1:
		begin
			lsbyte = alu_out;
			pc = pc + 1;
			addr = pc;
			if (alu_cout == 0)
			begin
				opcode_state = opcode_state + 2;
				alu_opcode = ALU_OP_PASS_A;
				input_carry = ALU_CARRY_MUX_0;
				input_1_select = ALU_IN_MUX_DATA;
			end
			else
			begin
				opcode_state = opcode_state + 1;
				alu_opcode = ALU_OP_INC;
				input_carry = ALU_CARRY_MUX_0;
				input_1_select = ALU_IN_MUX_DATA;
			end
		end
		3'd2:
		begin
			opcode_state = opcode_state + 1;
		end
		3'd3:
		begin
			addr = {alu_out, lsbyte};
			opcode_state = opcode_state + 1;
		end
	endcase
end
endtask

task indexed_indirect;
begin
	case(opcode_state)
		3'd0:
		begin
			pc = pc + 1;
			opcode_state = opcode_state + 1;
			addr = pc;
			input_carry = ALU_CARRY_MUX_0;
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
			lsbyte = din;
		end
		3'd3:
		begin
			opcode_state = opcode_state + 1;
			addr = alu_out + 1;
		end
		3'd4:
		begin
			opcode_state = opcode_state + 1;
			addr = {din, lsbyte};
		end
	endcase
end
endtask

task indirect_indexed;
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
			lsbyte = din;
			input_carry = ALU_CARRY_MUX_0;
			alu_opcode = ALU_OP_ADD;
			input_1_select = ALU_IN_MUX_DATA;
			input_2_select = ALU_IN_MUX_Y;
		end
		3'd2:
		begin
			opcode_state = opcode_state + 1;
			addr = lsbyte + 1;
			lsbyte = alu_out;
			alu_opcode = ALU_OP_NOP;
		end
		3'd3:
		begin
			if (alu_cout == 0)
			begin
				opcode_state = opcode_state + 2;
				addr = {din, lsbyte};
			end
			else
			begin
				opcode_state = opcode_state + 1;
				addr = {din + 1, lsbyte};
			end
		end
	endcase
end
endtask

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
				immediate();
				(* full_case *)
				case(opcode_state)
					3'd1:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA5: //LDA, zp
			begin
				zeropage();
				case(opcode_state)
					3'd2:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hB5: //LDA, zp,X
			begin
				zeropage_register(1'd0);
				case(opcode_state)
					3'd3:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hAD: //LDA, abs
			begin
				absolute();
				case(opcode_state)
					3'd3:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hBD: //LDA, abs,X
			begin
				absolute_register(1'd0);
				case(opcode_state)
					3'd4:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA1: //LDA, (ind,X)
			begin
				indexed_indirect();
				case(opcode_state)
					3'd5:
					begin
						A = din;
						done = 8'd1;
					end
				endcase
			end
			8'hB1: //LDA, (ind),Y
			begin
				indirect_indexed();
				case(opcode_state)
					3'd4:
					begin
						opcode_state = opcode_state + 1;
						A = din;
					end
					3'd5:
					begin
						if (alu_cout == 0)
						begin
							A = din;
						end
						done = 8'd1;
					end
				endcase
			end
			8'hA2: //LDX, #
			begin
				immediate();
				case(opcode_state)
					3'd1:
					begin
						X = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA6: //LDX, zp
			begin
				zeropage();
				case(opcode_state)
					3'd2:
					begin
						X = din;
						done = 8'd1;
					end
				endcase
			end
			8'hB6: //LDX, zp,Y
			begin
				zeropage_register(1'd1);
				case(opcode_state)
					3'd3:
					begin
						X = din;
						done = 8'd1;
					end
				endcase
			end
			8'hAE: //LDX, abs
			begin
				absolute();
				case(opcode_state)
					3'd3:
					begin
						X = din;
						done = 8'd1;
					end
				endcase
			end
			8'hBD: //LDX, abs,Y
			begin
				absolute_register(1'd1);
				case(opcode_state)
					3'd4:
					begin
						X = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA0: //LDY, #
			begin
				immediate();
				case(opcode_state)
					3'd1:
					begin
						Y = din;
						done = 8'd1;
					end
				endcase
			end
			8'hA4: //LDY, zp
			begin
				zeropage();
				case(opcode_state)
					3'd2:
					begin
						Y = din;
						done = 8'd1;
					end
				endcase
			end
			8'hB4: //LDY, zp,X
			begin
				zeropage_register(1'd0);
				case(opcode_state)
					3'd3:
					begin
						Y = din;
						done = 8'd1;
					end
				endcase
			end
			8'hAC: //LDY, abs
			begin
				absolute();
				case(opcode_state)
					3'd3:
					begin
						Y = din;
						done = 8'd1;
					end
				endcase
			end
			8'hBC: //LDY, abs,X
			begin
				absolute_register(1'd0);
				case(opcode_state)
					3'd4:
					begin
						Y = din;
						done = 8'd1;
					end
				endcase
			end
			8'h69: //ADC, #
			begin
				immediate();
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_ADD;
						input_carry = ALU_CARRY_MUX_CIN;
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
			8'h65: //ADC, zp
			begin
				zeropage();
				case(opcode_state)
					3'd1:
					begin
						alu_opcode = ALU_OP_ADD;
						input_carry = ALU_CARRY_MUX_CIN;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd2:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h75: //ADC, zp,X
			begin
				zeropage_register(1'd0);
				case(opcode_state)
					3'd2:
					begin
						alu_opcode = ALU_OP_ADD;
						input_carry = ALU_CARRY_MUX_CIN;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd3:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'hAC: //ADC, abs
			begin
				absolute();
				case(opcode_state)
					3'd2:
					begin
						alu_opcode = ALU_OP_ADD;
						input_carry = ALU_CARRY_MUX_CIN;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
					end
					3'd3:
					begin
						A = alu_out;
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
						input_carry = ALU_CARRY_MUX_0;
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
						input_carry = ALU_CARRY_MUX_0;
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
						input_carry = ALU_CARRY_MUX_0;
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
						input_carry = ALU_CARRY_MUX_0;
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
						input_carry = ALU_CARRY_MUX_0;
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
						input_carry = ALU_CARRY_MUX_0;
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
						input_carry = ALU_CARRY_MUX_0;
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
						input_carry = ALU_CARRY_MUX_0;
						opcode_state = opcode_state + 1;
					end
					3'd1:
					begin
						Y = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'hE9: //SBC, #
			begin
				immediate();
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_SUB;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
						input_carry = ALU_CARRY_MUX_CIN;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h29: //AND, #
			begin
				immediate();
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_AND;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
						input_carry = ALU_CARRY_MUX_0;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h09: //ORA, #
			begin
				immediate();
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_OR;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
						input_carry = ALU_CARRY_MUX_0;
					end
					3'd1:
					begin
						A = alu_out;
						done = 8'd1;
					end
				endcase
			end
			8'h49: //EOR, #
			begin
				immediate();
				case(opcode_state)
					3'd0:
					begin
						alu_opcode = ALU_OP_XOR;
						input_1_select = ALU_IN_MUX_A;
						input_2_select = ALU_IN_MUX_DATA;
						input_carry = ALU_CARRY_MUX_0;
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
				alu_cin = 1'b1;
				done = 8'd1;
			end
			8'h18: //CLC, i
			begin
				alu_cin = 1'b0;
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
