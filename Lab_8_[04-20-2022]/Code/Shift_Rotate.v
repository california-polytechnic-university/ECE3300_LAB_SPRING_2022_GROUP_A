`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 03:32:52 PM
// Design Name: 
// Module Name: Barrel_Shifter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Barrel_Shifter
#(parameter N = 4,L = $clog2(N))
        (
        input Sel_shift,//if high, shift instead of rotate
        input [L-1:0] Sel,
        input [N-1:0] b,
        output wire [N-1:0] P
        );
        
        wire V_tmp;
        wire [N-1:0] V;
        
        
        genvar i;
        generate
            begin         
                for(i=0; i < (N-1); i=i+1)//creates the multiplexers, 1 mux per bit in registe
                    begin
                    mux_2x1 UN1(
                                .F(V[i]),
                                .I0(b[i]),
                                .I1(b[(i+1)%N]), 
                                .sel(Sel[0])
                                );
                    end 
                for(i=0; i < N/2; i=i+1)//loops for the number of levels
                    begin 
                       
                        mux_2x1 UN2(
                                 .F(P[i]),
                                 .I0(V[i]),
                                 .I1(V[(i+2)%N]), 
                                 .sel(Sel[1])
                                 );
                    end    
 
            end
endgenerate
      
      assign V[3] = Sel[0] ? ( Sel_shift ? 0 : b[0] ) : b[3];            
      assign P[2] = Sel[1] ? ( Sel_shift ? 0 : V[0] ) : V[2];
      assign P[3] = Sel[1] ? ( Sel_shift ? 0 : V[1] ) : V[3];       
endmodule           
                                       
                    
 

