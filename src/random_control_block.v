`timescale 1ns / 1ps

module random_control_block(
		input wire [7:0] sig_I30,
		input wire [7:0] sig_interrupt,
		input wire sig_RDY,
		input wire sig_R_NOT_W,
		input wire sig_SV,
		input wire [7:0] timing_IN,
		
		output wire [7:0] timing_OUT,
		
		output wire DL_DB,
		output wire DL_ADL,
		output wire DL_ADH,
		
		output wire ZERO_ADH0,
		output wire ZERO_ADH_OVER0,
		
		output wire ADH_ABH,
		output wire ADL_ABL,
		output wire PCL_PCL,
		output wire ADL_PCL,
		
		output wire I_PC,
		
		output wire PCL_DB,
		output wire PCL_ADL,
		
		output wire PCH_PCH,
		output wire ADH_PCH,
		output wire PCH_DB,
		output wire PCH_ADH,
		
		output wire SB_ADH,
		output wire SB_DB,
		
		output wire ZERO_ADL0,
		output wire ZERO_ADL1,
		output wire ZERO_ADL2,
		
		output wire S_ADL,
		output wire SB_S,
		output wire S_S,
		output wire S_SB,
		
		output wire NOT_DB_ADD,
		output wire DB_ADD,
		output wire ADL_ADD,
		
		output wire I_ADDC,
		
		output wire DAA,
		output wire DSA,
		
		output wire SUMS,
		output wire ANDS,
		output wire EORS,
		output wire ORS,
		output wire SRS,
		
		output wire ADD_ADL,
		output wire ADD_SB_L,
		output wire ADD_SB_7,
		output wire ZERO_ADD,
		output wire SB_ADD,
		
		output wire SB_AC,
		output wire AC_DB,
		output wire AC_SB,
		
		output wire SB_X,
		output wire X_SB,
		output wire SB_Y,
		output wire Y_SB,
		
		output wire P_DB,
		output wire DB0_C,
		output wire IR5_C,
		output wire ACT_C,
		
		output wire DB1_Z,
		output wire DBZ_Z,
		
		output wire DB2_I,
		output wire IR5_I,
		
		output wire DB3_D,
		output wire IR5_D,
		
		output wire DB6_V,
		output wire AVR_V,
		
		output wire I_V,
		output wire DB7_N
    );


endmodule
