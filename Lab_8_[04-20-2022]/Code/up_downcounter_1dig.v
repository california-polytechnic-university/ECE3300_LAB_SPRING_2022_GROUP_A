`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2022 11:45:47 AM
// Design Name: 
// Module Name: up_downcounter_1dig
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


module up_downcounter_1dig
    (
    input clk, 
    input rst,
    //input En,
    input Ud,
    input load,
    input [3:0] inp,
    output [3:0] cnt
    );
    
    reg [3:0] upcnt_tmp;
    
    
    

    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
           upcnt_tmp <= 0;
        else 
        begin
                
                        if(load)
                            upcnt_tmp <= inp;
                        else
                        begin
                                if(Ud)//count down
                                    begin
                                        if(upcnt_tmp > 0)
                                            upcnt_tmp <= upcnt_tmp-1;
                                        else
                                            upcnt_tmp <= 9;
                                    end
                                else
                                        if(~Ud) 
                                        begin
                                            if(upcnt_tmp < 9)        
                                                upcnt_tmp <= upcnt_tmp + 1;
                                            else
                                                upcnt_tmp <= 0;
                                        end
                                    end
                            
                       end     
                    
             end 
      
     
   assign cnt = upcnt_tmp;
   
   
endmodule
