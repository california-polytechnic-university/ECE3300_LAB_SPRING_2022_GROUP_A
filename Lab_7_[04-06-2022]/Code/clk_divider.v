`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 02:37:49 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
        input clk,
        input rst,
        
        input [4:1] s,
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