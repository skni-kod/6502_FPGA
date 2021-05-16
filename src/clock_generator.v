`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:39 05/16/2021 
// Design Name: 
// Module Name:    clock_generator 
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
module clock_generator(
		input wire CLK,
		
		output reg PHI1,
		output reg PHI2
    );
	 
	 always@(*)
	 begin
		 PHI1 = CLK;
		 PHI2 = ~CLK;
	 end


endmodule
