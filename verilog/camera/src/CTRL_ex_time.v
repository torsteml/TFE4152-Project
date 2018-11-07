//-----------------------------------------------------------------------------
//
// Title       : CTRL_ex_time
// Design      : camera
// Author      : markusru
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\ICprosjekt\camera\src\CTRL_ex_time.v
// Generated   : Tue Nov  6 14:24:54 2018
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
//{module {CTRL_ex_time}}
module CTRL_ex_time (Exp_increase ,Exp_decrease ,clk ,Reset ,EXtime ,clkOut ,ResetOut);

output reg[4:0]  EXtime;
output wire clkOut;
output wire ResetOut;

input wire Exp_increase;
input wire Exp_decrease;
input wire clk;
input wire Reset;

// initial assign EXtime = 0;
//}} End of automatically maintained section

// -- Enter your statements here -- //
//initial begin

//end

always_ff @(posedge clk) begin
	if(Exp_increase) begin 
		if(EXtime < 30) EXtime <= EXtime + 1;  
	end
	else if(Exp_decrease) begin
		if(EXtime > 2) EXtime <= EXtime - 1;
	end
	if(Reset) EXtime = 2;
end	
	
assign clkOut = clk;
assign ResetOut = Reset;


endmodule
