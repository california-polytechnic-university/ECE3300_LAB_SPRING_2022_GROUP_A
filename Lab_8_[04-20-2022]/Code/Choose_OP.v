`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joseph Popoviciu
// 
// Create Date: 04/18/2022 01:50:22 PM
// Design Name: 
// Module Name: Choose_OP
// Project Name: Lab8
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: Artix-7 100T csg324
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Choose_OP(
    input [1:0] sel,
    input  change_in,//button
    input  rst,
    input  clk,
    output reg [1:0] aluOut,bsOut,
    output wire state_to_led
    );

    reg state;
    reg next_state;
    
    assign state_to_led = state;
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
            aluOut <= sel;
        else
            bsOut <= sel;
    end
    
endmodule
