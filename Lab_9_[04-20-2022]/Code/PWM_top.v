`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2022 10:14:31 AM
// Design Name: 
// Module Name: PWM_top
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


module PWM_top
#(parameter SIZE = 12) 
                    (
                     input clk,
                     input rst,
                     input switch,
                     //input load_r, 
                     //input load_g, 
                     //input load_b, 
                     input [SIZE-1:0] Duty,
                     output wire [2:0] RGB_LEDa,RGB_LEDb
                     );
wire clk_slow;
wire lock; 
wire clk_locked; 
wire PWM_r;
wire PWM_g;
wire PWM_b;
clk_wiz_0 CLK_GEN_SLOW
                         (
                          // Clock out ports
                          .clk_out1(clk_slow),
                          // Status and control signals
                          .reset(rst),
                            //.locked(lock),
                         // Clock in ports
                          .clk_in1(clk)
                         );

//assign clk_locked = clk_slow & lock; 

wire [2:0] PWM_RGB;
 PWM pwm_r(
                                .clk(clk_slow),
                                .rst(rst),
                                //.load(load_r),
                                .duty(Duty[3:0]),
                                .PWM(PWM_r)
                             );

 PWM pwm_g(
                                .clk(clk_slow),
                                .rst(rst),
                                //.load(load_g),
                                .duty(Duty[7:4]),
                                .PWM(PWM_g)
                             );

 PWM pwm_b(
                                .clk(clk_slow),
                                .rst(rst),
                                //.load(load_b),
                                .duty(Duty[11:8]),
                                .PWM(PWM_b)
                             );
assign PWM_RGB = {PWM_r,PWM_b,PWM_g};
Choose(
    .sel(PWM_RGB),
    .change_in(switch),//button
    .rst(rst),
    .clk(clk_slow),
    .LED1(RGB_LEDa),
    .LED2(RGB_LEDb)
    );
    
endmodule
