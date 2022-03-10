`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2022 12:26:50 PM
// Design Name: 
// Module Name: up_downcounter_1dig
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


module up_downcounter_1dig(
    input clk, rst,
    input En,
    input Ud,
    
    output En_nxt,
    output [3:0] cnt
    
    );
    reg [3:0] tmp=0;
    reg done;
    
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                tmp <= 4'd0;
                end
        else 
            if(En)
            begin
                if(Ud)//count down
                begin
                    if(tmp > 4'd0)
                        begin
                        tmp <= tmp-1;
                        done <= 4'd0;
                        end
                    else
                        if(tmp == 4'd0)
                            tmp <= 4'd9;
                        if(tmp == 4'd1)
                            done <= 1;
                        else
                            done <= 0;
                end
                else
                    if(~Ud)     
                        begin
                            if(tmp < 4'd9)        
                                begin
                                tmp <= tmp+1;
                                done <= 0;
                                end
                            else
                                if(tmp == 4'd9)
                                    tmp <= 4'd0;
                                if(tmp == 4'd8)
                                    done <= 1;
                                else
                                    done <=0;
                       end
            end
            
  end
             
   assign cnt = tmp;
   assign En_nxt = done & En;
   
endmodule

