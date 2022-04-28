`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2022 11:40:18 AM
// Design Name: 
// Module Name: seg7_wrapper
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


module seg7_wrapper(
                    input clk,
                    input rst,
                    //input dir,
                    output [6:0] Cnode,
                    input [31:0] SW,
                    output dp, 
                    output [7:0] AN 
                    );
                     
                     reg [31:0] SW_cont; 
                     
                     seg7_driver SEG (
                                      .clk(clk),
                                      .rst(rst),
                                      .SW(SW_cont),
                                      .Cnode(Cnode), 
                                      .dp(dp), 
                                      .AN(AN)
                                      );
                   always@(posedge clk or posedge rst) 
                    begin 
                        if (rst)
                            SW_cont <= 0;
                        else 
                            SW_cont[31:0] <= SW;
                            
                            
                    end   
                     

   
endmodule
