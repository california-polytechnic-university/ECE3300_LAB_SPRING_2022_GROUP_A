`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 12:41:24 PM
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
        //input rst,
        input En,
        input [4:0] s,
        output reg clock_divider_refresh,
        output reg clock_divider //output
        );
        
        wire [31:0] w;
        reg [31:0] tmp;
        
        always@(posedge clk)
        begin
            tmp <= tmp+1;
            
            case(s)
                        5'b00000 : clock_divider <= w[0];//multiplexer
                        5'b00001 : clock_divider <= w[1];
                        5'b00010 : clock_divider <= w[2];
                        5'b00011 : clock_divider <= w[3];
                        5'b00100 : clock_divider <= w[4];
                        5'b00101 : clock_divider <= w[5];
                        5'b00110 : clock_divider <= w[6];
                        5'b00111 : clock_divider <= w[7];
                        5'b01000 : clock_divider <= w[8];
                        5'b01001 : clock_divider <= w[9];
                        5'b01010 : clock_divider <= w[10];
                        5'b01011 : clock_divider <= w[11];
                        5'b01100 : clock_divider <= w[12];
                        5'b01101 : clock_divider <= w[13];
                        5'b01110 : clock_divider <= w[14];
                        5'b01111 : clock_divider <= w[15];
                        5'b10000 : clock_divider <= w[16];
                        5'b10001 : clock_divider <= w[17];
                        5'b10010 : clock_divider <= w[18];
                        5'b10011 : clock_divider <= w[19];
                        5'b10100 : clock_divider <= w[20];
                        5'b10101 : clock_divider <= w[21];
                        5'b10110 : clock_divider <= w[22];
                        5'b10111 : clock_divider <= w[23];
                        5'b11000 : clock_divider <= w[24];
                        5'b11001 : clock_divider <= w[25];
                        5'b11010 : clock_divider <= w[26];
                        5'b11011 : clock_divider <= w[27];
                        5'b11100 : clock_divider <= w[28];
                        5'b11101 : clock_divider <= w[29];
                        5'b11110 : clock_divider <= w[30];
                        5'b11111 : clock_divider <= w[31];
                        endcase
        end
        assign w = tmp;
    
endmodule
