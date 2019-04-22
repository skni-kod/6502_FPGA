`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:56:36 04/20/2019 
// Design Name: 
// Module Name:    ALU_COMPLETE 
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
module ALU_COMPLETE(
    input [2:0] input_1_select,
    input [2:0] input_2_select,
    input [7:0] a_reg,
    input [7:0] x_reg,
    input [7:0] y_reg,
    input [7:0] data_in,
    input [7:0] sp,
    input [7:0] alu_opcode,
    output wire [7:0] out,
    input cin,
    output wire cout
    );

wire [7:0] mux_1_out;
wire [7:0] mux_2_out;

ALU_INPUT_MUX mux_1(
		.mux_code(input_1_select), 
		.a_reg(a_reg), 
		.x_reg(x_reg), 
		.y_reg(y_reg), 
		.data_in(data_in), 
		.sp(sp), 
		.out(mux_1_out)
);

ALU_INPUT_MUX mux_2(
		.mux_code(input_2_select), 
		.a_reg(a_reg), 
		.x_reg(x_reg), 
		.y_reg(y_reg), 
		.data_in(data_in), 
		.sp(sp), 
		.out(mux_2_out)
);

ALU alu(
		.a(mux_1_out),
		.b(mux_2_out),
		.opcode(alu_opcode),
		.carry_in(cin),
		.y(out),
		.carry_out(cout)
);

endmodule