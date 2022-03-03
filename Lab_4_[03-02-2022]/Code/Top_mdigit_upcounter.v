`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 12:45:26 PM
// Design Name: 
// Module Name: Top_mdigit_upcounter
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


module Top_mdigit_upcounter
(
    input clk,rst,
    input [4:0] s,
    input dir,
    input En,
    
    output dp,
    output wire [6:0] Cnode,//7 segment display
    output wire [7:0] AN_top,//7 segment display
    output wire [7:0] cnt1_top//led display
    
    );
    reg [31:0] SW;
    
    wire clk_divider;
    wire [7:0] tmp1;    
    
    
    
            clk_divider CD
                    (
                    .clk(clk),
                    //.rst(rst),
                    .En(En),
                    .s(s),
                    .clock_divider(clk_divider)      
                    );
                    
            /*wire tmp1;
            assign tmp1 = clk_divider;*/
            
            up_counter UP0
                    (
                    .clk(clk_divider),
                    .rst(rst),
                    .En(En),
                    .cnt1(cnt1_top)
                    );
                    assign tmp1 = cnt1_top;
        /*seg7_wrapper(
                   .clk(clk),
                   .rst(rst),
                   .dir(dir),
                   .Cnode(Cnode),
                   .SW(tmp),
                   .dp(dp), 
                   .AN(AN_top) 
                   );*/
        
       seg7_driver SD
                   (
                   .clk(clk),
                   .rst(rst),
                   .SW(tmp1),
                   .Cnode(Cnode), 
                   .dp(dp), 
                   .AN(AN_top)
                   );
    
endmodule
