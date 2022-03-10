`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2022 08:38:02 AM
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


module Top
    (
    input clk,
    input disp_rst,
    input sys_rst,
    input Ud,
    input [4:0] SW_SPEED,
    input dir,
    input En,
    
    output dp,
    output [6:0] Cnode,//7 segment display
    output [7:0] AN_top,//7 segment display
    output [7:0] LED//led display
    
    );
    
    
    wire sys_clk;
    wire [31:0] UP_SEG;    
    wire done;
    
    
            clk_divider CLK_DIVIDER
                                    (
                                    .clk(clk),
                                    .rst(disp_rst),
                                    .s(SW_SPEED),
                                    .sys_clk(sys_clk)      
                                    );
                    
            assign LED = UP_SEG;
            
            up_down_modcnter UP_DOWN_COUNTER
                                            (
                                            .clk(sys_clk),
                                            .rst(sys_rst),
                                            .En(En),
                                            .Ud(Ud),
                                            .cnt_mod(UP_SEG)
                                            );
                    
            
                    

        
            seg7_driver SD
                          (
                          .clk(clk),
                          .rst(disp_rst),
                          .SW(UP_SEG),
                          .Cnode(Cnode), 
                          .dp(dp), 
                          .AN(AN_top)
                          );
    
endmodule
