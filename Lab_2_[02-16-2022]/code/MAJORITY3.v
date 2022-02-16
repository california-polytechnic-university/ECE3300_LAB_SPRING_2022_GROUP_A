`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 02/13/2022 11:45:01 AM
// Design Name: 
// Module Name: MAJORITY3
// Project Name: Lab2
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: majority encoder to generate carry out for a full adder
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MAJORITY3(
    input Maj_Cin, Maj_A, Maj_B,
    output Maj_Cout
    );
    wire maj_cin;
    wire a;
    wire b;
    wire cout_;
    assign Maj_Cout = ((Maj_Cin & Maj_B)|(Maj_Cin & Maj_A)|(Maj_A & Maj_B));
    
endmodule
