`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 03:09:09 PM
// Design Name: 
// Module Name: Serializer
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
`define firstcycle  2'b00 
`define secondcycle 2'b01
`define thirdcycle  2'b10
`define fourthcycle 2'b11

module Serializer
#(parameter width = 12)
                (
                input clk,
                input rst,
                input pull,
                input [width-1:0] Fifo_output,
                output reg [3:0] RGB_A, RGB_B, RGB_C,
                output reg pull_signal
                ); 

reg [1:0] state;
reg [1:0] next_state;

always@(posedge clk or posedge rst)
    if (rst) 
        state = `firstcycle; 
    else 
        state = next_state; 
        
always@(pull or state)
begin
   case (state)
        `firstcycle:
            begin 
                if(pull)
                    next_state = `secondcycle;
                else
                    next_state = `firstcycle;
            end 
        `secondcycle:
            begin 
                if(pull)
                    next_state = `thirdcycle;
                else
                    next_state = `firstcycle;    
            end 
        `thirdcycle: 
            begin 
                if (pull)
                    next_state = `fourthcycle;
                else
                    next_state = `firstcycle;
            end
         `fourthcycle:
            begin
                if(pull)
                    next_state = `firstcycle;
                else
                    next_state = `fourthcycle;    
            end
      endcase
end         

always@(state)
begin
    case(state)
        `firstcycle:            pull_signal = 1'b0;
        `secondcycle: begin     
                                pull_signal = 1'b0; 
                                RGB_A = Fifo_output[3:0];
                      end
        `thirdcycle:            RGB_B = Fifo_output[7:4];
        `fourthcycle:  begin
                 RGB_C = Fifo_output[11:8];
                 pull_signal = 1'b1;
                 end
    endcase
end                           
            
                         


endmodule
