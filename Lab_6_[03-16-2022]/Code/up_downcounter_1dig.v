`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 03/16/2022 08:52:11 AM
// Design Name: 
// Module Name: up_downcounter_1dig
// Project Name: Lab 6
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: Top file for lab6
// 
// Dependencies: Single digit up/down counter with reset, enable, and load with an input of 4-bits 
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
    input load,
    input [3:0] inp,
    
    output En_nxt,
    output [3:0] cnt
    
    );
    reg [3:0] tmp=0;
    reg done;
    reg [9:0] inp_tmp;
    
    always@(inp or load)
    begin   
    case(inp)
    4'b0000: inp_tmp = 0;
    4'b0001: inp_tmp = 1;     
    4'b0010: inp_tmp = 2;
    4'b0011: inp_tmp = 3;
    4'b0100: inp_tmp = 4;
    4'b0101: inp_tmp = 5;
    4'b0110: inp_tmp = 6;
    4'b0111: inp_tmp = 7;
    4'b1000: inp_tmp = 8;
    4'b1001: inp_tmp = 9;
    endcase  
    end
    
    always@(posedge clk or posedge rst)
    begin
    
 
        
    if(rst)
            begin
                tmp <= 4'd0;
                end
        else
            if(load)
               begin
               
               tmp <= inp_tmp;
               end
            else
                if(En)
                    begin
                        if(Ud)//count down
                        begin
                            if(tmp > 4'd0)
                                begin
                                tmp <= tmp-1;
                                done <= 0;
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
