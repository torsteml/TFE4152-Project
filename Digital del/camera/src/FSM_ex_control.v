`timescale 1 ns / 1 ps

module FSM_ex_control (Reset ,Clk ,Erase ,Expose ,ADC ,NRE_1 ,NRE_2 ,Init ,Start ,Ovf5 );

output reg Erase ;
output logic Expose ;
output logic ADC ;
output logic NRE_1 ;
output logic NRE_2 ;
output logic Start ;

input wire Reset ;
input wire Clk ;
input wire Init ;
input wire Ovf5 ;

reg[3:0] counter;
initial
	counter = 0;

typedef enum logic[2:0]{S0,S1,S2}statetype;
statetype state, nextState;

always @(posedge Clk) begin
	if(Reset)
		state = S0;
	else
		state = nextState;	  				   
	
	case(state)
		S0: begin
			Expose = 0; NRE_1 = 1; NRE_2 = 1; ADC = 0; Start = 0; Erase = 1;
			if(Init)
				nextState = S1;
			else
				nextState = S0;
		end
		
		S1: begin
			Expose = 1; Start = 1; Erase = 0;
			if(Ovf5)
				nextState = S2;
			else
				nextState = S1;
		end
		
		S2: begin
			Expose = 0; Start = 0; Erase = 0;
			case(counter)
				1: NRE_1 = 0;
				2: ADC = 1;
				3: ADC = 0;
				4: NRE_1 = 1;
				5: NRE_2 = 0;
				6: ADC = 1;
				7: ADC = 0;
				8: begin
					NRE_2 = 1;
					nextState = S0;
				end
			endcase
			counter = counter + 1;
		end
		
		
	endcase	
	
end
endmodule 