`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 12:39:20 PM
// Design Name: 
// Module Name: seg7_driver
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
    `define AN_OFF = 4'b1111
    

module seg7_driver(
             input clk,
             input rst,
             input [31:0] SW,
             output reg [15:0]  Cnode, 
             output dp, 
             output [7:0] AN
             );
             
           //wire [7:0] AEN; 
           //assign AEN = 8'b11111111;
                    
           reg [19:0] tmp; 
                
           reg [3:0] digit;
                    
           assign dp = 1'b1; 
                
               always@(digit)
                    begin      
                        case(digit)
                        4'd0:  Cnode <= 7'b1000000;
                        4'd1:  Cnode <= 7'b1111001;
                        4'd2:  Cnode <= 7'b0100100;
                        4'd3:  Cnode <= 7'b0110000;              
                        4'd4:  Cnode <= 7'b0011001;
                        4'd5:  Cnode <= 7'b0010010;
                        4'd6:  Cnode <= 7'b0000010;
                        4'd7:  Cnode <= 7'b1111000;
                        4'd8:  Cnode <= 7'b0000000;
                        4'd9:  Cnode <= 7'b0010000;
                        4'd10: Cnode <= 7'b0001000;
                        4'd11: Cnode <= 7'b0000011;
                        4'd12: Cnode <= 7'b1000110;
                        4'd13: Cnode <= 7'b0100001;
                        4'd14: Cnode <= 7'b0000110;
                        4'd15: Cnode <= 7'b0001110;                       
                        endcase
                   end  
            //f/2**n
                  
                  always@(posedge clk or posedge rst)
                    begin 
                        if(rst)
                            begin 
                                tmp <= 20'd0;
                            end 
                        else 
                            begin 
                                tmp <= tmp + 1; 
                            end 
                    end 
                    
                    wire[1:0] s;
                    
                    assign s = tmp[19:18];
                  
                  
                  always@(s)
                    begin 
                        case (s)
                            8'd0:  digit <= SW[3:0];
                            8'd1:  digit <= SW[7:4];
                            8'd2:  digit <= SW[11:8];
                            8'd3:  digit <= SW[15:12];
                           
                        endcase
                    end
                  reg [3:0] AN_tmp;
                  
                  always@(s)
                    begin 
                        case (s)
                            2'd0:  AN_tmp = 4'b1110;
                            2'd1:  AN_tmp = 4'b1101;
                            2'd2:  AN_tmp = 4'b1011;
                            2'd3:  AN_tmp = 4'b0111;
                         /* 8'd4:  AN = 8'b11101111;
                            8'd5:  AN = 8'b11011111;
                            8'd6:  AN = 8'b10111111;
                            8'd7:  AN = 8'b01111111;  */
                            default : AN_tmp = 4'bZZZZ;
                        endcase
                    end 
                    
                    assign AN = {4'b1111, AN_tmp};
   //assign AN = 8'b11111110;//selects the specific seven segment display to output

   
endmodule
