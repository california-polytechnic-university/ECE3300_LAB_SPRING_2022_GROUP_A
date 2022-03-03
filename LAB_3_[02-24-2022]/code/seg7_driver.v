`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2022 02:08:29 PM
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


module seg7_driver(
                    input clk,
                    input rst,
                    input [3:0] SW,
                    output reg [6:0]  Cnode, 
                    output dp, 
                    output wire [7:0] AN
                    );
               // wire [7:0] aen; 
                
               // assign aen = 8'b11111111;
                    
             //   reg [31:0] tmp; 
                
             //   reg [3:0] tmp_SW;
                    
                assign dp = 1'b1; 
                
               always@(SW)
                    begin      
                        case(SW)
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
            
                  
                 /* always@(posedge clk or posedge rst)
                    begin 
                        if(rst)
                            begin 
                                tmp <= 32'd0;
                            end 
                        else 
                            begin 
                                tmp <= tmp + 1; 
                            end 
                    end 
                  
                  always@(tmp[31:29])
                    begin 
                        case (tmp[31:29])
                            8'd0:  tmp_SW <= SW[3:0];
                            8'd1:  tmp_SW <= SW[7:4];
                            8'd2:  tmp_SW <= SW[11:8];
                            8'd3:  tmp_SW <= SW[15:12];
                            8'd4:  tmp_SW <= SW[19:16];
                            8'd5:  tmp_SW <= SW[23:20];
                            8'd6:  tmp_SW <= SW[27:24];
                            8'd7:  tmp_SW <= SW[31:28];
                        endcase
                    end 
                  
                  always@(tmp[31:29])
                    begin 
                        case (tmp[31:29])
                            8'd0:  AN = 8'b11111110;
                            8'd1:  AN = 8'b11111101;
                            8'd2:  AN = 8'b11111011;
                            8'd3:  AN = 8'b11110111;
                            8'd4:  AN = 8'b11101111;
                            8'd5:  AN = 8'b11011111;
                            8'd6:  AN = 8'b10111111;
                            8'd7:  AN = 8'b01111111;
                        endcase
                    end */
   assign AN = 8'b11111110;//selects the specific seven segment display to output
endmodule
