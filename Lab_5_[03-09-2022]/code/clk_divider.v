`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 11:48:55 AM
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


module clk_divider
    //#(parameter SWITCH=5, parameter N=2**SWITCH)
        
        (
        input clk,
        input rst,
        
        input [4:0] s,
        output sys_clk //output
        );
        
        
        reg [31:0] tmp;
        
        always@(posedge clk)
            begin                   
            if(rst)             
                tmp <=0;        
            else                
                tmp <= tmp+1;   
        end                     
                                
        assign sys_clk = tmp[s];
        
endmodule