`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias 
// 
// Create Date: 03/16/2022 08:50:54 AM
// Design Name: 
// Module Name: clk_divider
// Project Name: Lab 6
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: Clock manager to control the refresh rate of the clock
// 
// Dependencies: NEXYS A7 100T 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_divider(
        input clk,
        input rst,
        
        input [4:0] s,
        output sys_clk //output
        );
        
        reg [31:0] tmp;
        
        always@(posedge clk or posedge rst)
            begin                   
            if(rst)             
                tmp <=0;        
            else                
                tmp <= tmp+1;   
        end                     
                                
        assign sys_clk = tmp[s];
        
endmodule
