`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 02/09/2022 05:35:05 PM
// Design Name: 
// Module Name: DEC2X4_nbits
// Project Name: Lab1  
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: Base 2x4 decoder
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DEC2X4(
    input [1:0] S,
    output [3:0] P,
    input En

    );
        
        wire s0_neg;
        wire s1_neg;
        not(s0_neg,S[0]);
        not(s1_neg,S[1]);
        and(P[0],s1_neg,s0_neg,En);
        and(P[1],s1_neg,S[0],En);
        and(P[2],S[1],s0_neg,En);
        and(P[3],S[1],S[0],En);
        
endmodule
