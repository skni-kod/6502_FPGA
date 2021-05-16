`timescale 1ns / 1ps

module OPEN_DRAIN_ADH(
    input wire sig_ZERO,
	 input wire sig_OTHER,
    output reg [7:0] DATA_OUT
    );

	always@(*)
	begin
		if(sig_ZERO)
			DATA_OUT[0] = 0;
		else
			DATA_OUT[0] = 1'bz;
			
		if (sig_OTHER)
			DATA_OUT[7:1] = 7'b0000000;
		else
			DATA_OUT[7:1] = 7'bzzzzzzz;
	end

endmodule


module OPEN_DRAIN_ADL(
    input wire sig_ZERO,
	 input wire sig_ONE,
	 input wire sig_TWO,
    output reg [7:0] DATA_OUT
    );

	always@(*)
	begin
		if(sig_ZERO)
			DATA_OUT[0] = 0;
		else
			DATA_OUT[0] = 1'bz;
			
		if(sig_ONE)
			DATA_OUT[1] = 0;
		else
			DATA_OUT[1] = 1'bz;
			
		if(sig_TWO)
			DATA_OUT[2] = 0;
		else
			DATA_OUT[2] = 1'bz;
			
		
	end

endmodule