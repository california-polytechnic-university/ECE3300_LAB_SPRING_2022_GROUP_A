`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 03:33:32 PM
// Design Name: 
// Module Name: mux_2x1
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


module mux_2x1(
output F,
input I0,I1, sel 

);

 
reg F_tmp;

    always @(sel or I1 or I0)
    begin
        if(sel)
            F_tmp=I1;
        else
            F_tmp=I0;
        
    end
    assign F=F_tmp;
   
endmodule
