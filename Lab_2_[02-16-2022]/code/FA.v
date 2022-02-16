`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 02/13/2022 09:58:10 AM
// Design Name: 
// Module Name: FA
// Project Name: Lab2
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: A 1 bit Full Adder using a majority3 encoder to generate carry out
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA(
            input fa_cin,
            input fa_port_a,
            input fa_port_b,
            output fa_port_sumout,
            output fa_port_cout
    );
    
    
    wire fa_xor_int;
    
    wire fa_and_int1, fa_and_int2, fa_and_int3;
    
    wire fa_or_int;
    assign fa_xor_int = fa_port_a ^ fa_port_b;
    /*xor(
        fa_xor_int,
        fa_port_a,
        fa_port_b);*/
    assign fa_port_sumout = fa_xor_int ^ fa_cin;
    /*xor(
        fa_port_sumout,
        fa_xor_int,
        fa_cin
        );*/
    assign fa_and_int1 = fa_port_a & fa_port_b;
    
    assign fa_and_int2 = fa_port_a & fa_port_b;
    
    assign fa_and_int3 = fa_cin & fa_port_b;
    
    assign fa_or_int = fa_and_int1 | fa_and_int2;
     
    //assign fa_port_cout = fa_or_int | fa_and_int3;
    
    MAJORITY3 Cout_Block(
                        .Maj_Cin(fa_cin),
                        .Maj_A(fa_port_a),
                        .Maj_B(fa_port_b),
                        .Maj_Cout(fa_port_cout)
                        );
                               
endmodule
