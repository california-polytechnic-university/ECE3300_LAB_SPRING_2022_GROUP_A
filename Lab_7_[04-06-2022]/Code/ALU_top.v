`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2022 05:02:51 PM
// Design Name: 
// Module Name: ALU_top
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


module ALU_top(
    input clk,
    input rst,
    input [4:1] SW_SPEED,
    input signed [4:0] OPa_top, OPb_top,//OPa[4] and OPb[4] represent the sign
    input [1:0] operation_top,
    
    
    
    
    output dp,
    output [6:0] Cnode,//7 segment display
    output [7:0] AN_top,//7 segment display
    output [7:0] LED//led display
    
    );
    wire [4:0] OPa_tmp,OPb_tmp;
    wire [1:0] operation_tmp;
    wire [31:0] OPc_tmp;
    wire sys_clk;
    wire [9:0] input_tmp;
    
    assign input_tmp = {OPa_tmp, OPb_tmp};
    assign OPa_tmp = OPa_top;
    assign OPb_tmp = OPb_top;
    assign operation_tmp = operation_top;
    
    
    clk_divider(
            .clk(clk),
            .rst(rst),
            .s(SW_SPEED),
            .sys_clk(sys_clk) //output
            );
    
    ALU CALC(
        .OPa(OPa_tmp),
        .OPb(OPb_tmp),//OPa[4] and OPb[4] represent the sign
        .operation(operation_tmp),
        .OPc(OPc_tmp)
        );
    
    
    seg7_wrapper DISP(
                 .clk(sys_clk),
                 .rst(rst),
                 .SW(OPc_tmp),
                 .Cnode(Cnode), 
                 .dp(dp), 
                 .AN(AN_top)
                 );
    
    
endmodule
