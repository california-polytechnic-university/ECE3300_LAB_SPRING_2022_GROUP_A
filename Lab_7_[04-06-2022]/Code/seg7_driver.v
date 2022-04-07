`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 02:38:48 PM
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
                        4'd0:  Cnode <= 7'b0000001;
                        4'd1:  Cnode <= 7'b1001111;
                        4'd2:  Cnode <= 7'b0010010;
                        4'd3:  Cnode <= 7'b0000110;              
                        4'd4:  Cnode <= 7'b1001100;
                        4'd5:  Cnode <= 7'b0100100;
                        4'd6:  Cnode <= 7'b0100000;
                        4'd7:  Cnode <= 7'b0001111;
                        4'd8:  Cnode <= 7'b0000000;
                        4'd9:  Cnode <= 7'b0001100;
                        4'd10: Cnode <= 7'b1011000;//positive 
                        4'd11: Cnode <= 7'b0010100;//negative
                        4'd12: Cnode <= 7'b0110001;
                        4'd13: Cnode <= 7'b1000010;
                        4'd14: Cnode <= 7'b0110000;
                        4'd15: Cnode <= 7'b0111000;                       
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
                            8'd0:  digit <= SW[3:0];//inputa
                            8'd1:  digit <= SW[7:4];//sign of inputa
                            8'd2:  digit <= SW[11:8];//inputb 
                            8'd3:  digit <= SW[15:12];//sign of input b
                            8'd4:  digit <= SW[19:16];//digit
                            8'd5:  digit <= SW[23:20];//digit
                            8'd6:  digit <= SW[27:24];//signoutput
                            8'd7:  digit <= SW[31:28];//op
                           
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
