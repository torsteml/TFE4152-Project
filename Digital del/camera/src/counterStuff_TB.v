`timescale 1 ns / 1 ps

module counterStuff_TB;

reg Exp_inc, Exp_dec, Clk, Reset, Start;
wire Ovf5;
wire[4:0] EXtime;

counterStuff test(Exp_inc, Exp_dec, Clk, Reset, Start, Ovf5, EXtime);

initial begin
	Clk=0; Reset = 1; Exp_inc = 0; Exp_dec = 0; Start = 0; #10;
	Reset = 0; #5;
	Exp_inc = 1; #70;
	Exp_inc = 0;
	Exp_dec = 1; #20;
	Exp_dec = 0;
	Start = 1; #20;
	Start = 0;
	
end
	
always
	#5 Clk = !Clk;
initial
	#500 $finish;
endmodule