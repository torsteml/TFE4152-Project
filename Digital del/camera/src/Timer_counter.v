`timescale 1 ns / 1 ps

module Timer_counter ( Reset ,clk ,Start ,Initial ,Ovf5 );

output logic Ovf5 ;

input wire Reset ;
input wire clk ;
input wire Start ;
input reg[4:0] Initial ;
reg[4:0] counter;
initial
	counter = 0;

typedef enum logic[1:0]{S0,S1}statetype;
statetype state, nextState;

always @(posedge clk) begin
	if(Reset)
		state = S0;
	else
		state = nextState;	  				   
	
	case(state)
		S0: begin
			Ovf5 = 0;
			if(Start) nextState = S1;	
			else nextState = S0;
		end
		S1:	begin
			if(counter == Initial-1) begin
				Ovf5 = 1;
				nextState = S0;
			end
			else counter = counter + 1;
		end
			
	endcase
		

	
	
end

endmodule
