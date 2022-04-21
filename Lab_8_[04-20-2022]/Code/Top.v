`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Joseph Popoviciu
// 
// Create Date: 04/09/2022 11:46:42 AM
// Design Name: 
// Module Name: Top
// Project Name: Lab8
// Target Devices: Artix-7 100T csg324
// Tool Versions: 
// Description: 
// 
// Dependencies: Artix-7 100T csg324
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top
            (
            input CLK,           
            input rst,
            input load1,
            input load2,
            input UdA,
            input UdB,
            input [3:0] SW_SPEED,
            input [1:0] operation_top,
            input [3:0] inp_top_a,
            input [3:0] inp_top_b,
            input [1:0] sel_shift1, //operation and BS
            input button,
            
            output dp,
            output [15:0] LED,
            output [6:0] Cnode_top,
            output [7:0] AN_top
            );
            
            wire [3:0] UP_SEGa;
            wire [3:0] UP_SEGb;
            
            
            
            wire sys_clk2,sys_clk3;
            
            wire [1:0] sel_tmp;
            wire [1:0] alu_op;
            
            Choose_OP CP(
                .sel(sel_shift1),
                .change_in(button),
                .rst(rst),
                .clk(CLK),
                .aluOut(alu_op),
                .bsOut(sel_tmp),
                .state_to_led(LED[15])//high is alu, low is barrelshifter
                 );
            
            wire [4:0] SW_SPEED_TMP;
            assign SW_SPEED_TMP[4:0] = {1'b1 , SW_SPEED[3:0]};
            
            clk_divider CLK_MANAGER     (
                                        .clk(CLK),
                                        .rst(rst),
                                        .s(SW_SPEED_TMP),
                                        .sys_clk(sys_clk3) //output to Counters 1 and 2
                                        );         
                    
           
                                        
           up_downcounter_1dig UD_A    (
                                       .clk(sys_clk3), 
                                       .rst(rst),
                                       //.En(1),
                                       .Ud(UdA),
                                       .load(load1),
                                       .inp(inp_top_a),
                                       .cnt(UP_SEGa)
                                       );
            
           up_downcounter_1dig UD_B    (
                                       .clk(sys_clk3), 
                                       .rst(rst),
                                       //.En(1),
                                       .Ud(UdB),
                                       .load(load2),
                                       .inp(inp_top_b),
                                       .cnt(UP_SEGb)
                                       );
                            

                     
           
           
           wire [3:0] UP_counter_output;
           wire [1:0] Sela;
           wire [1:0] Selb;

           up_counter UP_COUNT(
                                 .clk(sys_clk3), 
                                 .rst(rst),
                                 .En(1),
                                 .cnt(UP_counter_output)
                                 );             
                         
                         
          assign Sela[1:0] = {UP_counter_output[2], UP_counter_output[0]};
          assign Selb[1:0] = {UP_counter_output[3], UP_counter_output[1]};
          assign LED[14:13] = Selb[1:0];
          assign LED[11:10] = Sela[1:0];
          wire [3:0] BS_OPA;
           
            Barrel_Shifter BS_1  ( 
                                 .Sel_shift(sel_tmp[0]),
                                 .Sel(Sela),
                                 .b(UP_SEGa), //COMES FROM MYSTERIOUS BOX
                                 .P(BS_OPA)//output
                                 );
           wire [3:0] BS_OPB;                  
           Barrel_Shifter BS_2   (
                                 .Sel_shift(sel_tmp[1]),
                                 .Sel(Selb),
                                 .b(UP_SEGb), //COMES FROM MYSTERIOUS BOX
                                 .P(BS_OPB)//output
                                 );
                             
                             
        wire [7:0] ALU_tmp;
        
                    ALU CALC(
                                .OPa(BS_OPA),
                                .OPb(BS_OPB),//OPa[4] and OPb[4] represent the sign
                                .operation(alu_op),
                                .OPc(ALU_tmp)
                                );
        
        wire [3:0] UP_SEGa_td = UP_SEGa;
        wire [3:0] BS_OPA_td = BS_OPA; 
        wire [3:0] UP_SEGb_td = UP_SEGb;
        wire [3:0] BS_OPB_td = BS_OPB;
        wire [7:0] ALU_tmp_td = ALU_tmp;
        
                                
        wire [7:0] ALU_OPC;                    
        wire [31:0] Output_to_disp;
        
        wire [3:0] inp_tmp_top_a=inp_top_a;
        wire [3:0] inp_tmp_top_b=inp_top_b;
        
        
        
        assign ALU_OPC[7:0] = { inp_tmp_top_b[3:0] , inp_tmp_top_a[3:0] };
        
        assign Output_to_disp[7:0]   = ALU_OPC[7:0];
        assign Output_to_disp[11:8]  = UP_SEGa_td[3:0];
        assign Output_to_disp[15:12] = BS_OPA_td[3:0];
        assign Output_to_disp[19:16] = UP_SEGb_td[3:0];
        assign Output_to_disp[23:20] = BS_OPB_td[3:0];
        assign Output_to_disp[31:24] = ALU_tmp_td[7:0];
        assign LED[7:0] = {inp_tmp_top_b , inp_tmp_top_a};
        
        
        seg7_wrapper DISPLAY(
                           .clk(CLK),
                           .rst(rst),
                           .Cnode(Cnode_top),
                           .SW(Output_to_disp),
                           .dp(dp), 
                           .AN(AN_top) 
                           );
endmodule
