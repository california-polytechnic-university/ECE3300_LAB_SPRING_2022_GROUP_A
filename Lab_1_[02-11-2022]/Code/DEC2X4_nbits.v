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
// Description: A decoder that should work for any nbits of input
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DEC2X4_nbits
#(parameter DATA_WIDTH = 3)
    (
    input [DATA_WIDTH-1:0] S_nbits,
    output [(2**DATA_WIDTH)-1:0] P_nbits,
    input En_nbits
    );
   wire [1:0] temp_nbits;//wires to creat 2 enables for 3x8
   wire [3:0] En_temp;//wires to create 4 enables for 4x16
           genvar i;
           generate
            if(DATA_WIDTH%2==1)//odd #ofinputs
               begin
               //wire [1:0] temp_nbits;
               assign temp_nbits[0]=~S_nbits[DATA_WIDTH-1];
               assign temp_nbits[1]=S_nbits[DATA_WIDTH-1];
                    
                  for(i=0;i<(2**DATA_WIDTH)/4;i=i+1)
                     begin 
                       DEC2X4 UNIT1
                       (
                          .S(S_nbits[1:0]),
                          .P(P_nbits[4*i+3:4*i]),
                          .En(temp_nbits[i])
                       );
                       end
               end
            else if(DATA_WIDTH%2==0 && DATA_WIDTH==2)//even2x4
              begin
                DEC2X4 UNIT0
                (
                  .S(S_nbits[DATA_WIDTH-1:DATA_WIDTH-2]),
                  .P(P_nbits),
                  .En(En_nbits)
                 );
                 end
             else//even 4x16
              begin
               
              DEC2X4 UNIT0
                (
                  .S(S_nbits[DATA_WIDTH-1:DATA_WIDTH-2]),
                  .P(En_temp),
                  .En(En_nbits)
                );
                for(i=0;i<DATA_WIDTH;i=i+1)
                begin
                  DEC2X4 UNIT
                  (
                     .S(S_nbits[1:0]),
                     .P(P_nbits[4*i+3:4*i]),
                     .En(En_temp[i])
                  );
                end
              end
           endgenerate

endmodule
