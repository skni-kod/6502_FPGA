`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   22:46:56 04/19/2019
// Design Name:   cpu_core
// Module Name:   E:/FPGA/CPU/cpu_core_test.v
// Project Name:  CPU
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: cpu_core
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module cpu_core_test;

	// Inputs
	reg [7:0] ROM [0:32748];
	reg clk;
	reg [7:0] din;
	reg reset;

	// Outputs
	wire [15:0] addr;
	wire clk_out;
	wire [7:0] a_out;
	wire [7:0] x_out;
	wire [7:0] y_out;
	wire [7:0] opcode_out;
	wire [15:0] pc_out;
	wire [3:0] opcode_state_out;
	wire[7:0] alu_opcode_out;
	wire[7:0] alu_out_out;
	wire alu_cout_out;
	wire alu_cin_out;

	// Instantiate the Unit Under Test (UUT)
	cpu_core uut (
		.clk(clk),
		.din(din),
		.addr(addr),
		.clk_out(clk_out),
		.a_out(a_out),
		.x_out(x_out),
		.y_out(y_out),
		.reset(reset),
		.opcode_out(opcode_out),
		.pc_out(pc_out),
		.opcode_state_out(opcode_state_out),
		.alu_opcode_out(alu_opcode_out),
		.alu_out_out(alu_out_out),
		.alu_cout_out(alu_cout_out),
		.alu_cin_out(alu_cin_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		/*ROM[0] = 8'hA9;
		ROM[1] = 8'd3;
		ROM[2] = 8'h69;
		ROM[3] = 8'd3;
		ROM[4] = 8'h69;
		ROM[5] = 8'd4;*/
		ROM[0] = 8'hA9; //LDA, #3
		ROM[1] = 8'h04;
		ROM[2] = 8'h38; //SEC
		ROM[3] = 8'hE9; //SBC, #2
		ROM[4] = 8'h02;
		ROM[5] = 8'h18; //CLC
		ROM[6] = 8'h69; //ADC, #4
		ROM[7] = 8'h04;
		ROM[8] = 8'h29; //AND, #5
		ROM[9] = 8'h05;
		ROM[10] = 8'h49; //EOR, #6
		ROM[11] = 8'h06;
		ROM[12] = 8'h09; //OR, #7
		ROM[13] = 8'h07;
		ROM[14] = 8'hAA; //TAX
		ROM[15] = 8'hA8; //TAY
		ROM[16] = 8'hA2; //LDX #$FF
		ROM[17] = 8'hFF;
		ROM[18] = 8'h8A; //TXA
		ROM[19] = 8'h98; //TYA
		ROM[20] = 8'hE8; //INX
		ROM[21] = 8'hC8; //INY
		ROM[22] = 8'hCA; //DEX
		ROM[23] = 8'h88; //DEY
		ROM[24] = 8'hA5; //LDA, $01
		ROM[25] = 8'h01;
		ROM[26] = 8'hB5; //LDA, $80,X
		ROM[27] = 8'h80;
		ROM[28] = 8'hAD;
		ROM[29] = 8'h01;
		ROM[30] = 8'h00;
		ROM[31] = 8'hBD;
		ROM[32] = 8'h01;
		ROM[33] = 8'h00;
		ROM[34] = 8'hA1;
		ROM[35] = 8'hD8;
		ROM[36] = 8'hA0;
		ROM[37] = 8'h01;
		ROM[38] = 8'hB1;
		ROM[39] = 8'h1D;
		ROM[127] = 8'hFF;
		ROM[128] = 8'h00;
		ROM[215] = 8'h00;
		ROM[216] = 8'h01;
		ROM[254] = 8'hAA;
		ROM[255] = 8'hFE;
		ROM[256] = 8'hEF;
		ROM[257] = 8'hDF;
		din = ROM[0];

		// Wait 100 ns for global reset to finish
		#100;
		$monitor($time, ": A=%h X=%h Y=%h opcode=%h, pc=%h opstate=%d, addr=%h, aluop=%b, alu_out=%h, alu_cout=%h, alu_cin=%h, data_in=%h",
		a_out, x_out, y_out, opcode_out, pc_out, opcode_state_out, addr, alu_opcode_out, alu_out_out, alu_cout_out, alu_cin_out, din);
		//$monitor($time, ": A=%h X=%h Y=%h c=%b opcode=%h", a_out, x_out, y_out, alu_cout_out, opcode_out);
		// Add stimulus here
		repeat(1000)
		begin
			#5 clk = ~clk;
		end
	end

	always @(addr)
	begin
		din = ROM[addr];
	end

endmodule

