`timescale 1 ns / 1 ps

module RE_control(Init, Exp_increase, Exp_decrease, Clk, Reset, NRE_1, NRE_2, ADC, Expose, Erase);
	
input logic Init, Exp_increase, Exp_decrease, Clk, Reset; 
output logic NRE_1, NRE_2, ADC, Expose, Erase;
wire[4:0] EXtime; 
logic Start, Ovf5;

CTRL_ex_time timeBlock(Exp_increase ,Exp_decrease ,Clk ,Reset ,EXtime);
Timer_counter counterBlock(Reset ,Clk ,Start ,EXtime ,Ovf5);
FSM_ex_control stateBlock(Reset ,Clk ,Erase ,Expose ,ADC ,NRE_1 ,NRE_2 ,Init ,Start ,Ovf5);
	
endmodule