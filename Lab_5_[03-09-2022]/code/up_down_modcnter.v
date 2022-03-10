`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 11:48:22 AM
// Design Name: 
// Module Name: up_down_modcnter
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


module up_down_modcnter
    #(parameter Digits=4)
    (
        input clk,
        input rst,
        input Ud,
        input En,
        
        output [15:0] cnt_mod
        
        
    );
    
    wire [Digits-1:0]done;
    
        
        up_downcounter_1dig UN0(
                        .clk(clk), 
                        .rst(rst),
                        .En(En),
                        .Ud(Ud),
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
                                       .cnt(cnt_mod[4*i+3:4*i]),
                                       .En_nxt(done[i])
                                       );
            
            end
            endgenerate
            
            
              
            
            
            
endmodule
