`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 03:42:56 PM
// Design Name: 
// Module Name: Choose
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


module Choose(
    input [2:0] sel,
    input  change_in,//button
    input  rst,
    input  clk,
    output reg [2:0] LED1,LED2
    );

    reg state;
    reg next_state;
    

    always@(posedge clk or posedge rst)
        if (rst) 
            state <= 0;
        else 
            state <= next_state;
    
    always@(change_in or state)
    case (state)
        1'd0:
            begin
                if (change_in)
                    next_state <= 1;
                else 
                    next_state <= 0;
            end
        1'd1:
            begin
                if (change_in)
                    next_state <= 0;
                else 
                    next_state <= 1;
            end
    endcase
    always@(state or sel)
    begin
        if(state)
            LED1 = sel;
        else
            LED2 = sel;
    end
    
endmodule
