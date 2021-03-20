`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:57:53 03/20/2021
// Design Name:   reg_PSR
// Module Name:   /home/ise/ISE_VM_SHARED/6502_FPGA/src/tests/test_PSR.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg_PSR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_PSR;

	// Inputs
	reg C_LOAD_DB0;
	reg C_LOAD_IR5;
	reg C_LOAD_ACR;
	reg Z_LOAD_DB1;
	reg Z_LOAD_DBZ;
	reg I_LOAD_DB2;
	reg I_LOAD_IR5;
	reg D_LOAD_DB3;
	reg D_LOAD_IR5;
	reg V_LOAD_DB6;
	reg V_LOAD_AVR;
	reg V_LOAD_I;
	reg N_LOAD_DB7;
	reg BUS_ENABLE;
	reg [7:0] DATA;
	reg IR5;
	reg ACR;
	reg AVR;

	// Outputs
	wire [7:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	reg_PSR uut (
		.C_LOAD_DB0(C_LOAD_DB0), 
		.C_LOAD_IR5(C_LOAD_IR5), 
		.C_LOAD_ACR(C_LOAD_ACR), 
		.Z_LOAD_DB1(Z_LOAD_DB1), 
		.Z_LOAD_DBZ(Z_LOAD_DBZ), 
		.I_LOAD_DB2(I_LOAD_DB2), 
		.I_LOAD_IR5(I_LOAD_IR5), 
		.D_LOAD_DB3(D_LOAD_DB3), 
		.D_LOAD_IR5(D_LOAD_IR5), 
		.V_LOAD_DB6(V_LOAD_DB6), 
		.V_LOAD_AVR(V_LOAD_AVR), 
		.V_LOAD_I(V_LOAD_I), 
		.N_LOAD_DB7(N_LOAD_DB7), 
		.BUS_ENABLE(BUS_ENABLE), 
		.DATA(DATA), 
		.IR5(IR5), 
		.ACR(ACR), 
		.AVR(AVR), 
		.OUT(OUT)
	);

	initial begin
		// Initialize Inputs
		C_LOAD_DB0 = 0;
		C_LOAD_IR5 = 0;
		C_LOAD_ACR = 0;
		Z_LOAD_DB1 = 0;
		Z_LOAD_DBZ = 0;
		I_LOAD_DB2 = 0;
		I_LOAD_IR5 = 0;
		D_LOAD_DB3 = 0;
		D_LOAD_IR5 = 0;
		V_LOAD_DB6 = 0;
		V_LOAD_AVR = 0;
		V_LOAD_I = 0;
		N_LOAD_DB7 = 0;
		BUS_ENABLE = 0;
		DATA = 0;
		IR5 = 0;
		ACR = 0;
		AVR = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		DATA = 8'hff;
		$monitor($time, ": Data on DB: %h, BUS_ENABLE_SIGNAL: %b, IR5: %b, ACR: %b, AVR: %b, OUTPUT_STATE: %b", DATA, BUS_ENABLE, IR5, ACR, AVR, OUT);
		$display("Test 1. RAW state, expected output: XX1XXXXX");
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		
		$display("Test 2. C_LOAD, 3 variants");
		#1;
		IR5 = 0;
		ACR = 1;
		
		C_LOAD_DB0 = 1;
		#1;
		C_LOAD_DB0 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1____1\n");
		
		#1;
		C_LOAD_IR5 = 1;
		#1;
		C_LOAD_IR5 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1____0\n");
		
		#1;
		C_LOAD_ACR = 1;
		#1;
		C_LOAD_ACR = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1____1\n");
		
		
		$display("Test 3. Z_LOAD, 2 variants");
		#1;
		
		Z_LOAD_DB1 = 1;
		#1;
		Z_LOAD_DB1 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1___1_\n");
		
		#1;
		Z_LOAD_DBZ = 1;
		#1;
		Z_LOAD_DBZ = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1___0_\n");
		
		$display("Test 4. I_LOAD, 2 variants");
		#1;
		IR5 = 0;
		
		I_LOAD_DB2 = 1;
		#1;
		I_LOAD_DB2 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1__1__\n");
		
		#1;
		I_LOAD_IR5 = 1;
		#1;
		I_LOAD_IR5 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1__0__\n");
		
		$display("Test 5. D_LOAD, 2 variants");
		#1;
		IR5 = 0;
		
		D_LOAD_DB3 = 1;
		#1;
		D_LOAD_DB3 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1_1___\n");
		
		#1;
		D_LOAD_IR5 = 1;
		#1;
		D_LOAD_IR5 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: __1_0___\n");
		
		$display("Test 6. V_LOAD, 3 variants");
		#1;
		AVR = 0;
		
		V_LOAD_DB6 = 1;
		#1;
		V_LOAD_DB6 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: _11_____\n");
		
		#1;
		V_LOAD_AVR = 1;
		#1;
		V_LOAD_AVR = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: _01_____\n");
		
		#1;
		V_LOAD_I = 1;
		#1;
		V_LOAD_I = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: _V1__V__\n");
		
		$display("Test 7. V_LOAD, 1 variant");
		#1;
		AVR = 0;
		
		N_LOAD_DB7 = 1;
		#1;
		N_LOAD_DB7 = 0;
		#1;
		BUS_ENABLE = 1;
		#1;
		BUS_ENABLE = 0;
		#1;
		$display("Expected output: 1_1_____\n");
		

        

	end
      
endmodule

