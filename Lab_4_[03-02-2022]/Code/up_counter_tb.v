`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/01/2022 11:09:25 AM
// Design Name: 
// Module Name: up_counter_tb
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


module up_counter_tb();

    reg clk_tb, rst_tb;
    reg En_tb;
    
    
    wire [7:0] cnt1_tb;
    
    
         
    up_counter UP(
        .clk(clk_tb), 
        .rst(rst_tb),
        .En(En_tb),
        .cnt1(cnt1_tb)
        //.cnt2(cnt2_tb)
        );
        initial
                    begin
                        clk_tb <=1;
                    end
                always
                    begin
                    #5    clk_tb  = ~clk_tb;//100MHz
                    end
        initial
                    begin
                        En_tb =1;
                        rst_tb = 0;
                        
                       #5
                        En_tb =1;
                        rst_tb =0;
                        
                       #50
                        rst_tb = 1;
                        #5
                        rst_tb = 0;
                        
                        
                        
                        
                        
                       #1000
                        $finish;
                        end    
endmodule
