`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:34 05/08/2021 
// Design Name: 
// Module Name:    ALU_block 
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
module ALU_block(
		input wire sig_DAA,
		input wire sig_CARRY_IN,
		
		input wire sig_SUMS,
		input wire sig_ANDS,
		input wire sig_EORS,
		input wire sig_ORS,
		input wire sig_SRS,
		
		input wire [7:0] reg_A,
		input wire [7:0] reg_B,
		
		output reg sig_AVR, //Overflow
		output reg sig_ACR, //Carry
		output reg sig_HC,  //Half Carry - Decimal mode feature
		
		output reg [7:0] ALU_OUT
    );
	 
	 reg [7:0] buf_SUM;
	 reg [7:0] buf_AND;
	 reg [7:0] buf_XOR;
	 reg [7:0] buf_OR;
	 reg [7:0] buf_SR;
	 reg buf_AVR;
	 reg buf_ACR_SR;
	 reg buf_ACR_SUM;
	 reg buf_HC;
	 
	 always@(*) begin
		{buf_ACR_SUM, buf_SUM} <= reg_A + reg_B;
		buf_AND <= reg_A & reg_B;
		buf_XOR <= reg_A ^ reg_B;
		buf_OR <= reg_A | reg_B;
		buf_ACR_SR = reg_A[0]; //Not the most elegant solution for overflow bit check, although propably the simplest one
		buf_SR <= reg_A >> 1;
		
		//Overflow check
		//Checks if sign change occurs while adding numbers with the same sign
		if(sig_SUMS && ( (~reg_A[7] && ~reg_B[7] && buf_SUM[7]) || (reg_A[7] && reg_B[7] && ~buf_SUM[7]) ))
			buf_AVR = 1;
		else
			buf_AVR = 0;
			
		//Apllying valid buffers to the output
		ALU_OUT = 8'hZZ;
		sig_ACR = 1'bz;
		sig_AVR = 1'bz;
		
		//Half-Carry is used only for BCD mode
		//That is not currently implemented
		//Yet...
		sig_HC = 1'bz;
		
		if (sig_SUMS)
		begin
			ALU_OUT = buf_SUM;
			sig_ACR = buf_ACR_SUM;
			sig_AVR = buf_AVR;
		end
		else if (sig_ANDS)
			ALU_OUT = buf_AND;
		else if (sig_EORS)
			ALU_OUT = buf_XOR;
		else if (sig_ORS)
			ALU_OUT = buf_OR;
		else if (sig_SRS)
		begin
			ALU_OUT = buf_SR;
			sig_ACR = buf_ACR_SR;
		end
		
	 
	 end 


endmodule
