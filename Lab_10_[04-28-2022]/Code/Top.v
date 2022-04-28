`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2022 03:29:15 PM
// Design Name: 
// Module Name: Top
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


module Top
        #(parameter WIDTH_top           = 12,
          parameter DEPTH_top           = 16    ) 
                    (
                     input [3:0] SW_SPEED,
                     input [WIDTH_top-1:0] FIFO_input,
                     input clk,
                     input rst,
                     input switch,
                     //input [SIZE-1:0] Duty,
                     input pull,push,

                     output wire [2:0] RGB_LEDa,RGB_LEDb,
                     output wire [1:0] LED,
                     output [6:0] Cnode_top,
                     output [7:0] AN_top,
                     output dp
                     );
                     wire clk_slow;
                     wire clk_locked; 
                     wire PWM_r;
                     wire PWM_g;
                     wire PWM_b;             
                     
                     
                     
                     wire [4:0] SW_SPEED_TMP;
                     assign SW_SPEED_TMP[4:0] = {1'b1 , SW_SPEED[3:0]};
                     
                    clk_manager CLK_SLOW(
                             .clk(clk),
                             .rst(rst),
                             .s(SW_SPEED_TMP),
                             .sys_clk(clk_slow) //output
                             );
                     
                     wire flag_Full;
                     
                     wire flag_Empty;
                     wire [WIDTH_top-1:0] FIFO_output;
                     wire [3:0] FIFO_tmp_r,FIFO_tmp_b,FIFO_tmp_g;
                     
                     wire pull_signal;
                     fifo_v2 #(
                                .DATA_W(WIDTH_top),        // Data width
                                .DEPTH(DEPTH_top))        // Depth of FIFO                   
                                //.UPP_TH(UPP_TH_top),        // Upper threshold to generate Almost-full
                                //.LOW_TH(LOW_TH_top)         // Lower threshold to generate Almost-empty
                              
                         FIFO(
                              .clk         (clk),                // Clock
                              .rstn        (rst),                // Active-low Synchronous Reset
                                           
                              .i_wren      (push),               // Write Enable
                              .i_wrdata    (FIFO_input),         // Write-data
                              //.o_alm_full  (flag_AF),            // Almost-full signal
                              .o_full      (flag_Full),          // Full signal
                              
                              .i_rden      (pull_signal),        // Read Enable
                              .o_rddata    (FIFO_output),        // Read-data
                              //.o_alm_empty (flag_AE),            // Almost-empty signal
                              .o_empty     (flag_Empty)          // Empty signal
                              );
                              
                              
                     Serializer #(.width(WIDTH_top))
                     SERIALIZER (
                                 .clk(clk_slow),
                                 .rst(rst),
                                 .pull(pull),
                                 .Fifo_output(FIFO_output),       //input from the FIFO
                                 .RGB_A(FIFO_tmp_r),
                                 .RGB_B(FIFO_tmp_g),
                                 .RGB_C(FIFO_tmp_b),
                                 .pull_signal(pull_signal)
                                 );         
                              
                     
                     assign LED[0] = flag_Full;
                     
                     assign LED[1] = flag_Empty;
                     
                     
                                          
                     wire [31:0] to_disp;
                     assign to_disp[31:28] = clk_slow;
                     assign to_disp[27:16] = SW_SPEED_TMP;
                     assign to_disp[3:0]  = FIFO_tmp_r;
                     assign to_disp[7:4]  = FIFO_tmp_g;
                     assign to_disp[11:8] = FIFO_tmp_b;
                     
                     
                     wire [2:0] PWM_RGB;
                     
                      PWM pwm_r(
                                .clk(clk_slow),
                                .rst(rst),
                                .duty(FIFO_tmp_r),
                                .PWM(PWM_r)
                                );
                     
                      PWM pwm_g(
                               .clk(clk_slow),
                               .rst(rst),
                               .duty(FIFO_tmp_g),
                               .PWM(PWM_g)
                               );
                     
                      PWM pwm_b(
                               .clk(clk_slow),
                               .rst(rst),
                               .duty(FIFO_tmp_b),
                               .PWM(PWM_b)
                               );
                               
                     assign PWM_RGB = {PWM_r,PWM_g,PWM_b};
                     
                     Choose Switch_RGB(
                                 .sel(PWM_RGB),   
                                 .change_in(switch),//button
                                 .rst(rst),       
                                 .clk(clk_slow),  
                                 .LED1(RGB_LEDa), 
                                 .LED2(RGB_LEDb)  
                                  );        
                         
                         
                    seg7_wrapper DISP(
                                  .clk(clk),
                                  .rst(rst),
                                  .Cnode(Cnode_top),
                                  .SW(to_disp),
                                  .dp(dp), 
                                  .AN(AN_top) 
                                  );      
                                                        
endmodule
