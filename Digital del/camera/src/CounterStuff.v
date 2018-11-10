`timescale 1 ns / 1 ps

module counterStuff(Exp_inc, Exp_dec, Clk, Reset, Start, Ovf5, EXtime);
	
input reg Exp_inc, Exp_dec, Clk, Reset, Start;
output wire[4:0] EXtime;
output wire Ovf5;
	
Timer_counter counter(Reset ,Clk ,Start ,EXtime ,Ovf5);
CTRL_ex_time timer(Exp_inc ,Exp_dec ,Clk ,Reset ,EXtime);
	
	
endmodule
