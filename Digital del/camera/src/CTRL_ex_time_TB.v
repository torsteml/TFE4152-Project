//-----------------------------------------------------------------------------
//
// Title       : Testbench
// Design      : camera
// Author      : markusru
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\ICprosjekt\camera\src\Testbench.v
// Generated   : Tue Nov  6 15:45:14 2018
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {Testbench}}
module CTRL_ex_time_TB;

reg Exp_increase;
reg Exp_decrease;
reg clk;
reg Reset;
//wire clkOut;
//wire ResetOut;
wire[4:0] EXtime;
	
CTRL_ex_time timer(Exp_increase ,Exp_decrease ,clk ,Reset ,EXtime);


	initial begin
		clk=0;Reset=0;Exp_increase=0;Exp_decrease=0;
		Reset = 1; #10;
		Reset = 0;
		Exp_increase = 1; #12
		Exp_increase = 0; 
		Exp_decrease = 1; #22;
		Exp_increase = 1; #350;
		Exp_decrease = 0; Exp_increase = 0;
	end
	
	always
		#5 clk = !clk;
	initial
		#500 $finish;
endmodule

