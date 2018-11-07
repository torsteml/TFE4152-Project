//-----------------------------------------------------------------------------
//
// Title       : FSM_ex_control
// Design      : camera
// Author      : markusru
// Company     : NTNU
//
//-----------------------------------------------------------------------------
//
// File        : c:\My_Designs\ICprosjekt\camera\src\FSM_ex_control.v
// Generated   : Tue Nov  6 15:15:57 2018
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
//{module {FSM_ex_control}}
module FSM_ex_control (Reset ,Clk ,Erase ,Expose ,ADC ,NRE_1 ,NRE_2 ,Init ,Start ,Ovf5 );

output reg Erase ;
output wire Expose ;
output wire ADC ;
output wire NRE_1 ;
output wire NRE_2 ;
output wire Start ;

input wire Reset ;
input wire Clk ;
input wire Init ;
input wire Ovf5 ;

//}} End of automatically maintained section

// -- Enter your statements here -- //	
typedef enum logic[2:0]{S0,S1,S2}statetype;
statetype state, nextState;

always @(posedge Clk) begin
	if(Reset) begin
		state <= S0;
	else
		state <= nextState;
	end	  				   
	
	always_comb begin
		case(state)
			S0:
			Expose = 0; NRE_1 = 0; NRE_2 = 0; ADC = 0; Start = 0; Erase = 1;
			if(Init)
				nextState = S1;
			else
				nextState = S0;
				
			S1:
			
		endcase
	end
	
end
endmodule 

//if ( open  )
     //@(posedge clk) outp = Memory[addressOftheMemory];
