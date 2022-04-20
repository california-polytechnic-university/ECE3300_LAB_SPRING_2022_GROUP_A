`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2022 11:38:41 AM
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
// Additional Comments:MODIFIED FOR UNSIGNED
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(

    input [3:0] OPa,
    input [3:0] OPb,//OPa[4] and OPb[4] represent the sign
    input [1:0] operation,
    output [7:0] OPc
    );
    
    reg [3:0] OPa_tmp;
    reg [3:0] OPb_tmp;
    reg [7:0] OPc_tmp;

    
    
    
    always@(OPa or OPb)
    begin
        case(OPa)
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
            default: OPa_tmp <= 4'd9;
        endcase
        case(OPb)
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
            default: OPb_tmp <= 4'd9;
        endcase

    end        
    
    always@(OPa_tmp or OPb_tmp or operation) 
    begin
        case(operation) 
        2'd0://Nothing
            begin
                
                OPc_tmp[7:4] <= 4'd0;
                OPc_tmp[3:0] <= 4'd0;
            end
        // a+b
        2'd1://Add
        begin
        
            //if(OPa[4] == OPb[4])//same sign
                //begin
                
                    OPc_tmp[3:0] <= (OPa_tmp + OPb_tmp) % 10; //gives the ones value
                    OPc_tmp[7:4] <= (OPa_tmp + OPb_tmp) / 10; //gives the tens value
                //end
                /*else
                begin        
                    if(OPb[4]==0)
                        OPc[27:24] <= 4'd10;
                        
                    else
                        OPc[27:24] <= OPa[4] + 4'd10;
                end*/
            //if(OPa[4] != OPb[4])
                
        end
        
        2'd2://Subtract
            begin
            
            /*OPc[31:28] <= operation;
                
                
                    if(OPb[4] == 1 && OPa[4]==1) //both negative
                        OPc[27:24] <= 4'd11;
                    else if(OPb[4] == 0 && OPa[4]==0) //both positive
                        OPc[27:24] <= 4'd10;
                    else        
                        begin*/
                        
                        if(OPb_tmp > OPa_tmp)
                            begin
                            //OPc[27:24] <= 4'd11;
                            OPc_tmp[3:0] <= (OPb_tmp - OPa_tmp)%10;
                            OPc_tmp[7:4] <= (OPb_tmp - OPa_tmp)/10;
                            end
                        else
                            begin
                            //OPc[27:24] <= 4'd11;
                            OPc_tmp[3:0] <= (OPa_tmp - OPb_tmp)%10;
                            OPc_tmp[7:4] <= (OPa_tmp - OPb_tmp)/10;
                            end
                    end
                
                    
                    
                
                    
            //end
        
        2'd3://multiply
            begin
                OPc_tmp[3:0] <= (OPb_tmp * OPa_tmp)%10;
                OPc_tmp[7:4] <= (OPb_tmp * OPa_tmp)/10;
            end
        
        
endcase

end 
assign OPc = OPc_tmp;
endmodule
