`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:12:59 02/20/2019
// Design Name:   ALU
// Module Name:   E:/FPGA/CPU/alu_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_test;

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

localparam ALU_OP_CMP = 8'h31;

	reg [7:0] A;
	reg [7:0] B;
	reg [7:0] op_code;
	reg Cin;

	// Outputs
	wire [7:0] Y;
	wire Cout;
	//wire Z;
	//wire O;
	
	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(A),
		.b(B),
		.opcode(op_code),
		.carry_in(Cin),
		.y(Y),
		.carry_out(Cout)
		/*.zero(Z),
		.overflow(O)*/
	);

	initial begin
		$monitor($time, ": A=%b B=%b Cin=%b   Y=%b Cout=%b", A,B,Cin,Y,Cout);
		$display("DODAWANIA");
		#10; {Cin, A, B, op_code} = {1'b0, 8'd1, 8'd1, ALU_OP_ADD};
		#10; {Cin, A, B, op_code} = {1'b0, 8'b11111111, 8'd1, ALU_OP_ADD};
		#10; {Cin, A, B, op_code} = {1'b1, 8'b11111111, 8'b11111111, ALU_OP_ADD};
		#10; {Cin, A, B, op_code} = {1'b0, 8'b11111111, 8'b11111111, ALU_OP_ADD};
		#10; $display("ODEJMOWANIA");
		#10; {Cin, A, B, op_code} = {1'b1, 8'd25, 8'd255, ALU_OP_SUB};
		#10; {Cin, A, B, op_code} = {1'b1, 8'b11111111, 8'd1, ALU_OP_SUB};
		#10; {Cin, A, B, op_code} = {1'b1, 8'b11111111, 8'b11111111, ALU_OP_SUB};
	end
      
endmodule

