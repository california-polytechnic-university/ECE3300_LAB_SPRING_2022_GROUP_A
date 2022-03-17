`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 03:31:10 PM
// Design Name: 
// Module Name: dec_2x4
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


module dec_2x4(
                input [1:0] s,
                input en,
                output [3:0] dec
               );
               wire [1:0] s_neg;
               
               not(s_neg[0],s[0]); 
               not(s_neg[1],s[1]);
               and(dec[3],s[1],s[0],en);
               and(dec[2],s[1],s_neg[0],en);
               and(dec[1],s_neg[1],s[0],en);
               and(dec[0],s_neg[1],s_neg[0],en);

endmodule
