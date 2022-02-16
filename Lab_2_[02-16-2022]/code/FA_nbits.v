`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: California Polytechnic University, Pomona
// Engineer: Joseph Popoviciu/Sami Elias
// 
// Create Date: 02/13/2022 09:58:10 AM
// Design Name: 
// Module Name: FA_nbits
// Project Name: Lab2
// Target Devices: NEXYS A7 100T
// Tool Versions: 
// Description: An Nbit full adder using a majority3 encoder to generate carry out
// 
// Dependencies: NEXYS A7 100T
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FA_nbits
    #(parameter DATA_WIDTH=8)
   (
    input  fa_nbits_cin,
    input  [DATA_WIDTH-1:0] fa_nbits_port_a,
    input  [DATA_WIDTH-1:0] fa_nbits_port_b,
    output [DATA_WIDTH-1:0] fa_nbits_port_sum,
    output fa_nbits_port_cout
    );
    
    wire [DATA_WIDTH-1:0] bridge; 
    
     FA  UNIT0 (
               .fa_cin(fa_nbits_cin),
               .fa_port_a(fa_nbits_port_a[0]),
               .fa_port_b(fa_nbits_port_b[0]),
               .fa_port_sumout(fa_nbits_port_sum[0]),
               .fa_port_cout(bridge[0])
              );
              
 genvar i; // integer format for this process         
 generate 
    for (i=1; i <DATA_WIDTH; i = i+1)
        begin              
    
     FA  UNIT (
                .fa_cin(bridge[i-1]),
                .fa_port_a(fa_nbits_port_a[i]),
                .fa_port_b(fa_nbits_port_b[i]),
                .fa_port_sumout(fa_nbits_port_sum[i]),
                .fa_port_cout(bridge[i])
               );
end 
endgenerate 

    assign fa_nbits_port_cout = bridge[DATA_WIDTH-1];
    
endmodule
