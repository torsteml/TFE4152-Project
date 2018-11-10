`timescale 1 ns / 1 ps

//module CTRL_ex_time (Exp_increase ,Exp_decrease ,clk ,Reset ,EXtime ,clkOut ,ResetOut);
module CTRL_ex_time (Exp_increase ,Exp_decrease ,clk ,Reset ,EXtime);

output reg[4:0]  EXtime;
//output wire clkOut;
//output wire ResetOut;

input wire Exp_increase;
input wire Exp_decrease;
input wire clk;
input wire Reset;

always_ff @(posedge clk) begin
	if(Exp_increase) begin 
		if(EXtime < 30) EXtime <= EXtime + 1;  
	end
	else if(Exp_decrease) begin
		if(EXtime > 2) EXtime <= EXtime - 1;
	end
	if(Reset) EXtime = 2;
end	
	
//assign clkOut = clk;
//assign ResetOut = Reset;


endmodule
