`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 02:15:36 PM
// Design Name: 
// Module Name: up_downcounter
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


module up_downcounter(
    input clk, rst,
    input En,
    input Ud,
    output wire [3:0] cnt
    
    );
    reg[3:0] tmp;
    
    
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                if(Ud==4'd0)
                     tmp <=4'd9;//
                
                else
                     tmp <= 4'd0;
                
            end
         else
            begin
                if(Ud)
                    begin
                        if(tmp > 4'd0 && En==1)
                            tmp <= tmp-1;
                        else 
                            tmp <= 4'd9;
                    end  
                else
                    begin
                        if(tmp < 9 && En==1)
                            tmp <= tmp+1;
                        else
                            tmp <= 4'd0;
                            
                    end
            end
   end
   assign cnt = tmp;
endmodule
