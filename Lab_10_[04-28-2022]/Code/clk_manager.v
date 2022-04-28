`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 03:37:38 PM
// Design Name: 
// Module Name: clk_manager
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


module clk_manager
        (
        input clk,
        input rst,
        input [4:0] s,
        output sys_clk //output
        );
        
        reg [31:0] tmp;
        //assign s[4] = 1;
        always@(posedge clk or posedge rst)
            begin                   
            if(rst)             
                tmp <=0;        
            else                
                tmp <= tmp+1;   
        end                     
                                
        assign sys_clk = tmp[s];
endmodule
