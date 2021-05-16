`timescale 1ns / 1ps

module OPEN_DRAIN(
    input wire DATA_IN,
    output reg [7:0] DATA_OUT
    );

always@(*)
begin
	if(DATA_IN)
		DATA_OUT = 8'h00;
	else
		DATA_OUT = 8'hZZ;
end

endmodule
