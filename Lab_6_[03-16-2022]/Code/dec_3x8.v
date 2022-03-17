`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 03:32:45 PM
// Design Name: 
// Module Name: dec_3x8
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


module dec_3x8(
        input [2:0] select,
        
        output [7:0] out
    );
     
      //stores enable inputs
        wire [1:0] temp;
        
    //sets up enable signals for first and second decoder
    genvar i; 
    generate 
            for(i=0; i< 2; i=i+1)
            begin
                dec_2x4 UNITN
                (
                .s(select[1:0]),
                .dec(out[(4*i)+3:(4*i)]),
                .en(temp[i])    
                );
            end
    endgenerate
    assign temp[0] = ~select[2];
    assign temp[1] = select[2];
endmodule
