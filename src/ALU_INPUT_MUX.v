`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:25 04/16/2019 
// Design Name: 
// Module Name:    ALU_INPUT_MUX 
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
module ALU_INPUT_MUX(
	input [2:0] mux_code,
	input [7:0] a_reg,
	input [7:0] x_reg,
	input [7:0] y_reg,
	input [7:0] data_in,
	input [7:0] sp,
	output reg [7:0] out
    );

	localparam ALU_IN_MUX_A = 8'h01;
	localparam ALU_IN_MUX_X  = 8'h02;
	localparam ALU_IN_MUX_Y = 8'h03;
	localparam ALU_IN_MUX_DATA = 8'h04;
	localparam ALU_IN_MUX_SP = 8'h05;
	localparam ALU_IN_MUX_ONE = 8'h06;

	always@(*)
	begin
		case(mux_code)
			ALU_IN_MUX_A:
				out = a_reg;
			ALU_IN_MUX_X:
			   out = x_reg;
			ALU_IN_MUX_Y:
				out = y_reg;
			ALU_IN_MUX_DATA:
				out = data_in;
			ALU_IN_MUX_SP:
				out = sp;
			ALU_IN_MUX_ONE:
				out = 8'h01;
			default:
				out = data_in;
		endcase
	end

endmodule