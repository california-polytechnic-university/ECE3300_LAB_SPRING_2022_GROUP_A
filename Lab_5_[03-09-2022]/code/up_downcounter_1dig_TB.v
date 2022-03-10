`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2022 12:36:31 PM
// Design Name: 
// Module Name: up_downcounter_1dig_TB
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


module up_downcounter_1dig_TB
//#(parameter Digits_TB =8)
();



    reg clk_tb, rst_tb;
    reg En_tb;
    reg Ud_tb;
    wire [3:0] cnt_tb;
    
    
    /*up_downcounter
    #(
        .Digits(Digits_TB)
      )*/
        up_downcounter_1dig TB
        (
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
                        En_tb =1;
                        rst_tb = 1;
                        Ud_tb = 1;
                       #10
                        En_tb =1;
                        rst_tb =0;
                        //Ud_tb <= 1;
                       #50
                        En_tb=1;
                        rst_tb = 0;
                        Ud_tb = 0;
                        #10
                        rst_tb =0;
                        #10
                        //Ud_tb=0;
                        
                        
                       #1000
                        $finish;
                        end    
endmodule

