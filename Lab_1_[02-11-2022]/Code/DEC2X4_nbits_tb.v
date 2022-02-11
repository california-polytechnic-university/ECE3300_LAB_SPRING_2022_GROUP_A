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
// Description: A testbench for a decoder that should work for any nbits of input
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DEC2X4_nbits_tb
#(parameter DATA_WIDTH_TB=4)
    (

    );
    reg [DATA_WIDTH_TB-1:0] S_nbits_tb;
    reg  En_nbits_tb;
    wire [2**DATA_WIDTH_TB-1:0] P_nbits_tb;
   
    
    DEC2X4_nbits
        #(
            .DATA_WIDTH(DATA_WIDTH_TB)
        )
        DEC2X4_nbits_tb
             (
             .S_nbits(S_nbits_tb),
             .P_nbits(P_nbits_tb),
             .En_nbits(En_nbits_tb)
             );
        initial
                     begin:TSTB
                     if(DATA_WIDTH_TB>=2)begin
                     assign En_nbits_tb=1;
                     S_nbits_tb=2'b00;
                     #10
                     S_nbits_tb=2'b01;
                     #10
                     S_nbits_tb=2'b10;
                     #10
                     S_nbits_tb=2'b11;
                     end
                     if(DATA_WIDTH_TB >= 3)begin
                     
                     #10
                     S_nbits_tb=3'b100;
                     #10
                     S_nbits_tb=3'b101;
                     #10
                     S_nbits_tb=3'b110;
                     #10
                     S_nbits_tb=3'b111;
                     end
                     if(DATA_WIDTH_TB >=4)begin
                     #10
                     S_nbits_tb=4'b1000;
                     #10
                     S_nbits_tb=4'b1001;
                     #10
                     S_nbits_tb=4'b1010;
                     #10
                     S_nbits_tb=4'b1011;
                     #10
                     S_nbits_tb=4'b1100;
                     #10
                     S_nbits_tb=4'b1101;
                     #10
                     S_nbits_tb=4'b1110;
                     #10
                     S_nbits_tb=4'b1111;
                     end
                     #100
                     $finish;
                     end
        
endmodule