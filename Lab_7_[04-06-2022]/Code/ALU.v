`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2022 02:40:45 PM
// Design Name: 
// Module Name: ALU
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


module ALU(

    input signed [4:0] OPa,OPb,//OPa[4] and OPb[4] represent the sign
    input [1:0] operation,
    output reg signed [31:0] OPc
    );
    wire [31:0] OPc_tmp;
    reg [3:0] OPa_tmp;
    reg [3:0] OPb_tmp;
    

    
    
    
    always@(OPa or OPb or operation)
    begin
        case(OPa[3:0])
            4'd0: OPa_tmp <= OPa;
            4'd1: OPa_tmp <= OPa;
            4'd2: OPa_tmp <= OPa;
            4'd3: OPa_tmp <= OPa;
            4'd4: OPa_tmp <= OPa;
            4'd5: OPa_tmp <= OPa;
            4'd6: OPa_tmp <= OPa;
            4'd7: OPa_tmp <= OPa;
            4'd8: OPa_tmp <= OPa;
            4'd9: OPa_tmp <= OPa;
        endcase
        case(OPb[3:0])
            4'd0: OPb_tmp <= OPb;
            4'd1: OPb_tmp <= OPb;
            4'd2: OPb_tmp <= OPb;
            4'd3: OPb_tmp <= OPb;
            4'd4: OPb_tmp <= OPb;
            4'd5: OPb_tmp <= OPb;
            4'd6: OPb_tmp <= OPb;
            4'd7: OPb_tmp <= OPb;
            4'd8: OPb_tmp <= OPb;
            4'd9: OPb_tmp <= OPb;
        endcase
        OPc[3:0] <= OPa;
        
            if(OPa[4]==0)
                OPc[7:4] <= 4'd10;
            else
                OPc[7:4] <= OPa[4] + 4'd10;    
        
        OPc[11:8] <= OPb;
            
            if(OPb[4]==0)
                OPc[15:12] <= 4'd10;
            else
                OPc[15:12] <= OPb[4] + 4'd10;
    end        
    
    always@(OPa or OPb or operation) 
    begin
        case(operation) 
        2'd0:
            begin
                OPc[31:28] <= operation;
                OPc[27:24] <= 4'd10;
                OPc[23:16] <= 8'd0;
            end
        // a+b
        2'd1://Add
        begin
        OPc[31:28] <= operation;
            if(OPa[4] == OPb[4])//same sign
                begin
                
                    OPc[19:16] <= (OPa_tmp[3:0] + OPb_tmp[3:0]) % 10; //gives the ones value
                    OPc[23:20] <= (OPa_tmp[3:0] + OPb_tmp[3:0]) / 10; //gives the tens value
                end
                else
                begin        
                    if(OPb[4]==0)
                        OPc[27:24] <= 4'd10;
                        
                    else
                        OPc[27:24] <= OPa[4] + 4'd10;
                end
            //if(OPa[4] != OPb[4])
                
        end
        
        2'd2://Subtract
            begin
            
            OPc[31:28] <= operation;
                
                
                    if(OPb[4] == 1 && OPa[4]==1) //both negative
                        OPc[27:24] <= 4'd11;
                    else if(OPb[4] == 0 && OPa[4]==0) //both positive
                        OPc[27:24] <= 4'd10;
                    else        
                        begin
                        
                        if(OPb[3:0] > OPa[3:0] && OPb[4] ==1)
                            begin
                            OPc[27:24] <= 4'd11;
                            OPc[19:16] <= (OPb_tmp[3:0] - OPa_tmp[3:0])%10;
                            OPc[23:20] <= (OPb_tmp[3:0] - OPa_tmp[3:0])/10;
                            end
                        else if(OPa[3:0] > OPb[3:0] && OPa[4] ==1)
                            begin
                            OPc[27:24] <= 4'd11;
                            OPc[19:16] <= (OPa_tmp[3:0] - OPb_tmp[3:0])%10;
                            OPc[23:20] <= (OPa_tmp[3:0] - OPb_tmp[3:0])/10;
                            end
                    end
                
                    
                    
                
                    
            end
        
        2'd3://multiply
            begin
                if(OPb[4] == OPa[4])//ends in positive output
                    begin
                        //OPc[8]=1'b0;
                        OPc[31:28] <= operation;
                        OPc[27:24] <= 4'd10;
                        OPc[19:16] <= (OPb_tmp[3:0] * OPa_tmp[3:0])%10;
                        OPc[23:20] <= (OPb_tmp[3:0] * OPa_tmp[3:0])/10;
                    end
                 else
                    //ends in negative output
                    begin
                        OPc[31:28] <= operation;
                        OPc[27:24] <= 4'd11;
                        OPc[19:16] <= (OPb_tmp[3:0]*OPa_tmp[3:0])%10;
                        OPc[23:20] <= (OPb_tmp[3:0]*OPa_tmp[3:0])/10;
                    end
                            
            end
        
        
endcase

end 

endmodule