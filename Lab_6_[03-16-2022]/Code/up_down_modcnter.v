`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias 
// 
// Create Date: 03/16/2022 08:51:16 AM
// Design Name: 
// Module Name: up_down_modcnter
// Project Name: Lab 6
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: Top file for lab6
// 
// Dependencies: Modular Up/Down counter with parameter Digits
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module up_down_modcnter
    #(parameter Digits=8)
    (
        input clk,
        input rst,
        input Ud,
        input En,
        input load,
        input [3:0] inp_mod,
        
        output [Digits*4-1:0] cnt_mod
        
        
    );
    
    wire [Digits-1:0] done;
    
        
        up_downcounter_1dig UN0(
                        .clk(clk), 
                        .rst(rst),
                        .En(En),
                        .Ud(Ud),
                        .load(load),
                        .inp(inp_mod),
                        .cnt(cnt_mod[3:0]),
                        .En_nxt(done[0])
                        );
                        
        genvar i;
        generate
        for(i=1;i<Digits;i=i+1)
            begin
            
                up_downcounter_1dig UN(
                                       .clk(clk), 
                                       .rst(rst),
                                       .En(done[i-1]),
                                       .Ud(Ud),
                                       .load(load),
                                       //.inp(inp_mod),
                                       .cnt(cnt_mod[4*i+3:4*i]),
                                       .En_nxt(done[i])
                                       );
            
            end
            endgenerate
            
            
              
            
            
            
endmodule
