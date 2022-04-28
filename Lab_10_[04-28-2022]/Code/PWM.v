`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 03:29:59 PM
// Design Name: 
// Module Name: PWM
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


module PWM
    #(localparam R=4)(
    input clk,
    input rst,
    //input load,
    input [R-1:0] duty,
    output reg PWM
    );
    
    reg [R-1:0] tmp;
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
            tmp <= 0;
        else
            tmp <= tmp + 1;
    end

always@(posedge clk)
begin      
    if(tmp < duty)
        PWM <=1;
    else
        PWM <=0;    
end
    
    
endmodule