`timescale 1ns / 1ps

module PASS_MOS(
    input wire ENABLE,
    inout [7:0] INOUT1,
    inout [7:0] INOUT2
    );

tranif1(INOUT1, INOUT2, ENABLE);
endmodule
