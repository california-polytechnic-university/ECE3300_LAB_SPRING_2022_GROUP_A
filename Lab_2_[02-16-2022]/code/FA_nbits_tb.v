`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 02/13/2022 10:01:03 AM
// Design Name: 
// Module Name: FA_nbits_tb
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: Testbench for an Nbit full adder using a majority3 encoder to generate carry out
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA_nbits_tb
    #(parameter DATA_WIDTH_TB=8) 
    (

    );
    
    reg [DATA_WIDTH_TB-1:0] fa_nbits_port_a_tb, fa_nbits_port_b_tb; 
    reg fa_nbits_cin_tb; 
    
    wire [DATA_WIDTH_TB-1:0] fa_nbits_port_sum_tb; 
    wire fa_nbits_port_cout_tb; 
    
    FA_nbits
    #(
        .DATA_WIDTH(DATA_WIDTH_TB)
     )   
        FA_TB_NBITS
       (
        .fa_nbits_cin(fa_nbits_cin_tb),
        .fa_nbits_port_a(fa_nbits_port_a_tb),
        .fa_nbits_port_b(fa_nbits_port_b_tb),
        .fa_nbits_port_sum(fa_nbits_port_sum_tb),
        .fa_nbits_port_cout(fa_nbits_port_cout_tb)
        );
                  
      initial 
        begin:TSTB 
        fa_nbits_cin_tb = 0;
        fa_nbits_port_a_tb = 4'b0101;
        fa_nbits_port_b_tb = 4'b1110;
        #10
        #100
        $finish;
        end 
endmodule
