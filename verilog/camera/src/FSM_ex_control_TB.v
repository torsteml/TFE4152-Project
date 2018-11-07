`timescale 1 ns / 1 ps

module FSM_ex_control_TB;

reg Init;
reg clk;
reg Reset;
reg Ovf5;
wire NRE_1;
wire NRE_2;
wire ADC;
wire Expose;
wire Erase;
wire Start;
	
FSM_ex_control control(Reset ,clk ,Erase ,Expose ,ADC ,NRE_1 ,NRE_2 ,Init ,Start ,Ovf5);

initial
	$monitor($realtime,,"ns %h %h %h %h %h %h %h %h %h %h",Reset ,clk ,Erase ,Expose ,ADC ,NRE_1 ,NRE_2 ,Init ,Start ,Ovf5);
	initial begin
		clk = 0;Init = 0; Reset = 1; #15;
		Reset = 0;
		Init = 1; #10
		Init = 0;
	end
	
	always
		#5 clk = !clk;
	initial
		#500 $finish;
endmodule
