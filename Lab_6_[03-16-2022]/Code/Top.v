`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 03/16/2022 08:50:34 AM
// Design Name: 
// Module Name: Top
// Project Name: Lab 6
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: Top file for lab6
// 
// Dependencies: NEXYS A7 100T
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
    input load,
    input [3:0] inp_top,
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
    wire [3:0] inp_tmp_top;
    
    assign inp_tmp_top = inp_top;
    
    
    
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
                                            .load(load),
                                            .inp_mod(inp_tmp_top),
                                            .Ud(Ud),
                                            .cnt_mod(UP_SEG)
                                            );
                    
                          
                          seg7_wrapper(
                                       .clk(clk),
                                       .rst(disp_rst),
                                       .SW(UP_SEG),
                                       .Cnode(Cnode),
                                       .dir(dir), 
                                       .dp(dp), 
                                       .AN(AN_top)
                                       );
    
endmodule
