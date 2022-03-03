`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2022 12:40:13 PM
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


module up_counter
//#(parameter Digits =2 , Bits = Digits**2)
//(parameter Digits = 2)
    (
    input clk, rst,
    input En,
    output wire [7:0] cnt1,cnt2
    
    );
    reg [7:0] tmp1=0;
    //reg [7:0] tmp2=0;
    wire [13:0] cnt;
    
    
    
    genvar i;
    generate
    for(i=1 ;i <2 ; i=i+1)
    begin
            always@(posedge clk or posedge rst)
            begin
                
                    if(rst)
                        begin
                            tmp1[7*i:0] = 8'b00000000;
                        end
                    else if(En)
                        begin
                            if(tmp1[3*i:0] < 4'd9)
                                tmp1[3*i:0] = tmp1[3*i:0]+1;
                            else
                                tmp1[3*i:0] = 4'd0;
                                
                            
                            if(tmp1[7*i:0] == 8'b1001_0000)
                                begin
                                
                                    tmp1[7*i:0] = 8'b0000_0000;
                                end
                            else if(tmp1[3*i:0] == 4'd0 && tmp1[7*i:4*i] < 4'd9)
                                begin
                                   tmp1[7*i:4*i] = tmp1[7*i:4*i]+1;
                                end
                        end
                        
                    else
                        begin
                            tmp1[7*i:0] = tmp1[7*i:0];
                            
                        end
             end
        end     
  endgenerate
           assign cnt1[3:0] = tmp1[3:0];
           assign cnt1[7:4] = tmp1[7:4];
          
endmodule
 //begin
               /*if(Ud==4'd0)
                    tmp <=4'd9;//
               
               else
                    tmp <= 4'd0;
               
           end
        else
           begin
               if(Ud)*/
                   /*begin
                       if(tmp > 4'd0 && En==1)
                           tmp <= tmp-1;
                       else 
                           tmp <= 4'd9;
                   end  */