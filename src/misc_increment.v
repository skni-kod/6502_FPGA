`timescale 1ns / 1ps
//Following link leads to the block diagram of the 6502, on which all modules are based
//Original creator of the diagram:  Donald F. Hanson
//Original document: https://projects.ncsu.edu/wcae//WCAE1/hanson.pdf
//https://www.witwright.com/DonPub/6502-Block-Diagram.pdf
//Most of the names of inputs/outputs corresponds to datapaths/markings on this schematic
//If any differences/special circumstances happen to arise, they should be explicitly noted "in place"


//Increment logic of Program Counters
module misc_INC_PC(
	input wire [7:0] IN_PCXS,
	input wire sig_INC,
	
	output reg CARRY_OUT,
	output reg [7:0] OUT_PCX
    );
	 
	 always@(*)
	 begin
		if (sig_INC)
			{CARRY_OUT, OUT_PCX} = IN_PCXS + 1;
		else
		begin
			CARRY_OUT = 0;
			OUT_PCX = IN_PCXS;
		end
		
	 end


endmodule
