`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2022 04:03:57 PM
// Design Name: 
// Module Name: up_counter
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


module up_counter (
    input clk, 
    input rst,
    input En,
    //output En_nxt,
    output [3:0] cnt
    );
    reg [3:0] tmp=0;
    //reg done;
    
    
    
    always@(posedge clk or posedge rst)
            begin
                if(rst)
                        tmp <= 0;
                else 
                   begin
                       if(En)
                           begin
                                if(tmp < 4'd9)
                                    begin
                                        tmp <= tmp + 1;
                                    //done <= 0;
                                    end
                               else if(tmp == 4'd9)
                                        tmp <= 0;
                           end
                   end
                        
                    
             end

  
       assign cnt = tmp;
      // assign En_nxt = done & En;
           
          
endmodule
