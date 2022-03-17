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
        input [3:0] dec_input,
        input clk,
        input rst,
        input Ud,
        input En,
        input [Digits-1:0] load,
        input [3:0] inp_mod,
        
        output [Digits*4-1:0] cnt_mod,
        output dec_out
        
    );
    //reg [7:0] inp_mod_tmp;
    wire [Digits-1:0] done;
    wire [Digits-1:0] dec_out_tmp;
      dec_3x8 EN_DECODER(
            .select(dec_input),
            .out(dec_out_tmp)
            );
    

    
        up_downcounter_1dig UN0(
                        .clk(clk), 
                        .rst(rst),
                        .En(dec_out_tmp[0]),
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
                                       .En(dec_out_tmp[i]),
                                       .Ud(Ud),
                                       .load(load),
                                       .inp(inp_mod),
                                       .cnt(cnt_mod[4*i+3:4*i]),
                                       .En_nxt(done[i])
                                       );
            
            end
            endgenerate
            
            
              
            
            
            
endmodule
