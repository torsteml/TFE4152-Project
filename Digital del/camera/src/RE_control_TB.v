`timescale 1 ns / 1 ps

module RE_control_TB;

logic Init, Exp_increase, Exp_decrease, Clk, Reset, NRE_1, NRE_2, ADC, Expose, Erase;

RE_control controlunit(Init, Exp_increase, Exp_decrease, Clk, Reset, NRE_1, NRE_2, ADC, Expose, Erase);

initial begin
	Clk=0; Reset = 1; #10;
	Reset = 0; #5;
	Exp_increase = 1; #100;
	Exp_increase = 0; #10;
	Init = 1; #10;
	Init = 0;
	
end
	
always
	#5 Clk = !Clk;
initial
	#500 $finish;
endmodule