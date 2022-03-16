`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 03/16/2022 08:51:52 AM
// Design Name: 
// Module Name: seg7_driver
// Project Name: Lab 6
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: Top file for lab6
// 
// Dependencies: Driver to select and display our count on any of the 8 7-segment displays
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seg7_driver(
             input clk,
             input rst,
             input [31:0] SW,
             output reg [6:0]  Cnode, 
             output dp, 
             output  [7:0] AN
             );
             
          
                    
           reg [19:0] tmp; 
                
           reg [7:0] digit;
                    
           assign dp = 1'b1; 
                
               always@(digit)
                    begin      
                        case(digit)
                        8'd0:  Cnode <= 7'b0000001;
                        8'd1:  Cnode <= 7'b1001111;
                        8'd2:  Cnode <= 7'b0010010;
                        8'd3:  Cnode <= 7'b0000110;              
                        8'd4:  Cnode <= 7'b1001100;
                        8'd5:  Cnode <= 7'b0100100;
                        8'd6:  Cnode <= 7'b0100000;
                        8'd7:  Cnode <= 7'b0001111;
                        8'd8:  Cnode <= 7'b0000000;
                        8'd9:  Cnode <= 7'b0001100;
                        8'd10: Cnode <= 7'b0001000;
                        8'd11: Cnode <= 7'b1100000;
                        8'd12: Cnode <= 7'b0110001;
                        8'd13: Cnode <= 7'b1000010;
                        8'd14: Cnode <= 7'b0110000;
                        8'd15: Cnode <= 7'b0111000;                       
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
                    
                    wire[2:0] s;
                    
                    assign s = tmp[19:17];//HOW DID HE CHOOSE 18 AND 19
                  
                  
                  always@(s, SW)
                    begin 
                        case (s)
                            8'd0:  digit <= SW[3:0];
                            8'd1:  digit <= SW[7:4];
                            8'd2:  digit <= SW[11:8];
                            8'd3:  digit <= SW[15:12];
                            8'd4:  digit <= SW[19:16];
                            8'd5:  digit <= SW[23:20];
                            8'd6:  digit <= SW[27:24];
                            8'd7:  digit <= SW[31:28];
                           
                        endcase
                    end
                   reg [7:0] AN_tmp;                                                             
                    always@(s)                                                                    
                      begin                                                                       
                          case (s)// s helps it keep going                                        
                              8'd0:  AN_tmp = 8'b11111110;                                        
                              8'd1:  AN_tmp = 8'b11111101;                                        
                              8'd2:  AN_tmp = 8'b11111011;                                        
                              8'd3:  AN_tmp = 8'b11110111;                                        
                              8'd4:  AN_tmp = 8'b11101111;                                        
                              8'd5:  AN_tmp = 8'b11011111;                                        
                              8'd6:  AN_tmp = 8'b10111111;//not efficient but gets the job done   
                              8'd7:  AN_tmp = 8'b01111111;                                        
                              default : AN_tmp = 8'bZZZZZZZZ;                                     
                          endcase                                                                 
                      end                                                                         
                                                                                                  
                      assign AN = AN_tmp;                                                         


   

endmodule
