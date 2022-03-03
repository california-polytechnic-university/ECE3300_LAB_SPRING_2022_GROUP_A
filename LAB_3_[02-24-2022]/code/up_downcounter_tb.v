`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 02:53:13 PM
// Design Name: 
// Module Name: up_downcounter_tb
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


module up_downcounter_tb();

    reg clk_tb, rst_tb;
    reg En_tb;
    reg Ud_tb;
    wire [3:0] cnt_tb;
    
    
    up_downcounter TB(
        .clk(clk_tb), 
        .rst(rst_tb),
        .En(En_tb),
        .Ud(Ud_tb),
        .cnt(cnt_tb)
        
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
                        En_tb =0;
                        rst_tb = 0;
                        Ud_tb = 1;
                       #50
                        En_tb =1;
                        rst_tb =0;
                        //Ud_tb <= 1;
                       #50
                        rst_tb = 1;
                        Ud_tb = 1;
                        #50
                        rst_tb =0;
                        #100
                        Ud_tb=0;
                        
                        
                       #1000
                        $finish;
                        end    
endmodule
