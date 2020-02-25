`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    18:41:25 02/25/2020
// Design Name:
// Module Name:    ALU_CARRY_MUX
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
module ALU_CARRY_MUX(
	input [1:0] mux_code,
	input cin,
	output reg out
    );

	localparam ALU_CARRY_MUX_0 = 8'h01;
	localparam ALU_CARRY_MUX_1  = 8'h02;
	localparam ALU_CARRY_MUX_CIN = 8'h03;

	always@(*)
	begin
		case(mux_code)
			ALU_CARRY_MUX_0:
				out = 0;
			ALU_CARRY_MUX_1:
				out = 1;
			ALU_CARRY_MUX_CIN:
				out = cin;
			default:
				out = cin;
		endcase
	end

endmodule
