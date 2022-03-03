`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 02:33:19 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input clk,rst,
    input [4:0] s,
    
    input Ud,
    input En,
    
    output dp,
    output wire [6:0] Cnode,//7 segment display
    output wire [7:0] AN_top,//7 segment display
    output wire [3:0] cnt_top //led display
    );
    reg [3:0] SW;
    wire clk_divider;
    wire [3:0] tmp;      
    assign tmp = cnt_top;
    
        clk_divider CD(
                    .clk(clk),
                    //.rst(rst),
                    .En(En),
                    .s(s),
                    .clock_divider(clk_divider)      
                    );
            /*wire tmp1;
            assign tmp1 = clk_divider;*/
    up_downcounter UP0(
                        .clk(clk_divider),
                        .rst(rst),
                        .En(En),
                        .Ud(Ud),
                        .cnt(cnt_top)
                        );
        
       
       
        
        seg7_driver SD(
                      .clk(clk),
                      .rst(rst),
                      .SW(tmp),
                      .Cnode(Cnode), 
                      .dp(dp), 
                      .AN(AN_top)
                      );
        
        
      
                       
endmodule
