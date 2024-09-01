`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2024 02:20:48 PM
// Design Name: 
// Module Name: control_unit
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



module control_unit#(parameter width = 32)(

    input logic [width-1:0] inst, 
    input logic BrEq, BrLt,
    output logic PCSel, BrUn, BSel, ASel, data_m_R, data_m_W, RegWen,
    output logic [2:0] ImmSel, // ImmSel = 000 I-type, 001 S-Type
    output logic [1:0] WBSel,
    output logic [3:0] ALUSel,
    output logic [2:0] data_m_instr
    
    );
    
    logic [6:0] op_code;
    logic [2:0] funct3;
    logic funct7; // only require 30th bit for RV32I
    
    
    always_comb begin
        op_code <=  inst [7:0];
        funct3 <= inst [14:12];
        funct7 <= inst [30];
        
        case(op_code)
            3: begin // load type
               case(funct3)
                    0: begin // load byte
                        PCSel <= 1'b0; ImmSel <= 3'd0; // ImmSel
                        RegWen<=1'b1; BrUn<=1'b0;
                        BSel<=1'b1; ASel<=1'b0; ALUSel<=4'd1; data_m_R<=1'b1;
                        data_m_W<=1'b0; WBSel<=2'd0; data_m_instr<=3'd0;
                    end
                    1: begin // load half word
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b1;
                        data_m_W = 1'b0; WBSel = 2'd0; data_m_instr = 3'd1;                    
                    end
                    2: begin // load word
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b1;
                        data_m_W = 1'b0; WBSel = 2'd0; data_m_instr = 3'd2;                    
                    end
                    4: begin // load byte unsigned
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b1;
                        data_m_W = 1'b0; WBSel = 2'd0; data_m_instr = 3'd3;                    
                    end
                    5: begin // load half word unsigned
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b1;
                        data_m_W = 1'b0; WBSel = 2'd0; data_m_instr = 3'd4;                    
                    end   
                    endcase                 
                                        
            end
            19: begin// I-type
                case(funct3)
                    0: begin // addi
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                      
                    end
                    1: begin // slli
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd3; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                    
                    end           
                    2: begin // slti
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd4; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                    
                    end            
                    3: begin //  sltiu
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd5; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                    
                    end         
                    4: begin // xori
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd6; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                    
                    end             
                    5: begin // srli & srai
                        case(funct7)
                        
                            0: begin // srli
                                PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                                RegWen = 1'b1; BrUn = 1'b0;
                                BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd7; data_m_R = 1'b0;
                                data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                            
                            end
                            
                            1: begin // srai
                                PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                                RegWen = 1'b1; BrUn = 1'b0;
                                BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd8; data_m_R = 1'b0;
                                data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                            
                            end
                            
                            endcase
                            
                    end       
                    6: begin // ori
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd9; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                    
                    end            
                    7: begin // andi
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd10; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0;                    
                    end             
                                                                                   
                    endcase
            end
            
            23: begin// U-Type (auipc)
                PCSel = 1'b0; ImmSel = 3'd3; // ImmSel
                RegWen = 1'b1; BrUn = 1'b0;
                BSel = 1'b1; ASel = 1'b1; ALUSel = 4'd1; data_m_R = 1'b0;
                data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0; 
            
            end
            
            35: begin// S-Type
                case(funct3)
                    0: begin //sb
                        PCSel = 1'b0; ImmSel = 3'd1; // ImmSel
                        RegWen = 1'b0; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b0;
                        data_m_W = 1'b1; WBSel = 2'd0; data_m_instr = 3'd5;                      
                    end
                    1: begin // sh
                        PCSel = 1'b0; ImmSel = 3'd1; // ImmSel
                        RegWen = 1'b0; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b0;
                        data_m_W = 1'b1; WBSel = 2'd0; data_m_instr = 3'd6;                      
                    end
                    2: begin // sw
                        PCSel = 1'b0; ImmSel = 3'd1; // ImmSel
                        RegWen = 1'b0; BrUn = 1'b0;
                        BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b0;
                        data_m_W = 1'b1; WBSel = 2'd0; data_m_instr = 3'd7;                      
                    end
                    
                    endcase
                    
            end
            
            51: begin// R-Type
                case(funct3)
                    0: begin // add & sub
                        case(funct7)
                            0: begin // add
                                 PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                                 RegWen = 1'b1; BrUn = 1'b0;
                                 BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd1; data_m_R = 1'b0;
                                 data_m_W = 1'b0; WBSel = 2'd1;                                
                            end
                            1: begin // sub
                                 PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                                 RegWen = 1'b1; BrUn = 1'b0;
                                 BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd2; data_m_R = 1'b0;
                                 data_m_W = 1'b0; WBSel = 2'd1;                             
                            end                            
                            endcase
                    end
                    1: begin // sll
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd3; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1;                      
                    end  
                    2: begin // slt
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd4; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1;                     
                    end 
                    3: begin // sltu
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd5; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1;                     
                    end             
                    4: begin // xor
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd6; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1;                     
                    end   
                    5: begin // srl & sra
                        case(funct7)
                            0:begin // srl
                                PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                                RegWen = 1'b1; BrUn = 1'b0;
                                BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd7; data_m_R = 1'b0;
                                data_m_W = 1'b0; WBSel = 2'd1;                             
                            end
                            1: begin // sra
                                PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                                RegWen = 1'b1; BrUn = 1'b0;
                                BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd8; data_m_R = 1'b0;
                                data_m_W = 1'b0; WBSel = 2'd1;                             
                            end
                        endcase
                    end                  
                    6: begin // or
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd9; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1;                     
                    end           
                    7: begin // and
                        PCSel = 1'b0; ImmSel = 3'd0; // ImmSel
                        RegWen = 1'b1; BrUn = 1'b0;
                        BSel = 1'b0; ASel = 1'b0; ALUSel = 4'd10; data_m_R = 1'b0;
                        data_m_W = 1'b0; WBSel = 2'd1;                     
                    end                                                           
                    endcase
            end
            
            55: begin// U-Type (lui)
                PCSel = 1'b0; ImmSel = 3'd3; // ImmSel
                RegWen = 1'b1; BrUn = 1'b0;
                BSel = 1'b1; ASel = 1'b0; ALUSel = 4'd11; data_m_R = 1'b0;
                data_m_W = 1'b0; WBSel = 2'd1; data_m_instr = 3'd0; 
                    
            end
            
            99: begin// B-Type
                ImmSel <= 3'd2; // ImmSel                        
                RegWen <= 1'b0; BrUn <= inst [13];
                BSel <= 1'b1; ASel <= 1'b1; ALUSel <= 4'd1; data_m_R <= 1'b0;
                data_m_W <= 1'b0; WBSel <= 2'd2; data_m_instr <= 3'd0;
                case(funct3)
                    0: begin // beq
                        
                        if(BrEq == 1) begin
                            PCSel <= 1'b1;
                            
                        end
                        else begin
                            PCSel <= 1'b0;
                        end
                    end
                    1: begin // bne
                                              
                        if(BrEq == 1) begin
                        PCSel <= 1'b0;
                        
                        end
                        else begin
                            PCSel <= 1'b1;
                        end                  
                    end
                    4: begin // blt
                        if(BrLt == 1) begin
                            PCSel <= 1'b1;
                    
                            end
                        else begin
                            PCSel <= 1'b0;
                        end  
                        
                    end
                    5: begin // bge
                        if(!(BrLt)==1) begin
                            PCSel <= 1'b1;
                
                        end
                        else begin
                            PCSel <= 1'b0;
                        end                    
                    end
                    6: begin // bltu
                        if(BrLt==1) begin
                            PCSel <= 1'b1;
            
                        end
                        else begin
                            PCSel <= 1'b0;
                        end                         
                    end
                    7: begin // bgeu
                        if(!(BrLt)==1) begin
                            PCSel <= 1'b1;
            
                        end
                        else begin
                            PCSel <= 1'b0;
                        end                    
                    end
                 endcase
            end
            
            103: begin// I-Type Jump (jalr)
                PCSel <= 1'b1; ImmSel <= 3'd0; // ImmSel
                RegWen <= 1'b1; BrUn <= 1'b0;
                BSel <= 1'b1; ASel <= 1'b0; ALUSel <= 4'd1; data_m_R <= 1'b0;
                data_m_W <= 1'b0; WBSel <= 2'd2; data_m_instr <= 3'd0; 
                        
            end
            
            111: begin// J-Type (jal)
                PCSel <= 1'b1; ImmSel <= 3'd4; // ImmSel
                RegWen <= 1'b1; BrUn <= 1'b0;
                BSel <= 1'b1; ASel <= 1'b1; ALUSel <= 4'd1; data_m_R <= 1'b0;
                data_m_W <= 1'b0; WBSel <= 2'd2; data_m_instr <= 3'd0;             
            end
            
               
default: begin
                        PCSel <= 1'b0; ImmSel <= 3'd0; // ImmSel
                        RegWen<=1'b0; BrUn<=1'b0;
                        BSel<=1'b0; ASel<=1'b0; ALUSel<=4'd0; data_m_R<=1'b0;
                        data_m_W<=1'b0; WBSel<=2'd0; data_m_instr<=3'd0;
end

endcase
       
    end
endmodule
