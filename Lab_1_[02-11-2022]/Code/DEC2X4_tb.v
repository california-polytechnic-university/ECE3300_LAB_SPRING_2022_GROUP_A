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
// Description: Testbench for 2x4 Decoder
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DEC2X4_tb(

    );
    reg [1:0] S_tb;
        //Defining the output wires for the DEC2X4 MODULE
        wire [3:0] P_tb;
        reg En_tb;
        wire temp_tb;
        
     DEC2X4 COMP_1 (
                
                .S(S_tb),
                .P(P_tb),
                .En(temp_tb)
                );  
                 
      initial
         begin: TST1
            S_tb[0] = 1'b0;
            S_tb[1] = 1'b0;
         #10
            S_tb[0] = 1'b1;
            S_tb[1] = 1'b0;
         #10
            S_tb[0] = 1'b0;
            S_tb[1] = 1'b1;
         #10
            S_tb[0] = 1'b1;
            S_tb[1] = 1'b1;
         #1000
         $finish;
         end
endmodule
