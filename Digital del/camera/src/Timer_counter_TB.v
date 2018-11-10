`timescale 1 ns / 1 ps

module Timer_counter_TB;

reg Start;
reg clk;
reg Reset;
reg[4:0] Initial;
initial Initial = 20;
wire Ovf5;
	
Timer_counter timer(Reset ,clk ,Start ,Initial ,Ovf5);

initial begin
	clk=0; Reset = 1; Start=0; #10;
	Reset = 0; #5;
	Start = 1; #20;
	Start = 0;
	
end
	
always
	#5 clk = !clk;
initial
	#500 $finish;
endmodule