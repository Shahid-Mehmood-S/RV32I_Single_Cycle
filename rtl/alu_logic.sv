`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2024 03:02:44 PM
// Design Name: 
// Module Name: alu_logic
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


module alu_logic#(parameter width = 32)(

    input logic [width-1:0] data1, data2,
    input logic [3:0] ALUSel,
    output logic [width-1:0] ALUop
    );
    
//    logic [4:0] rd;        // to get rd address from instruction
//    logic [2:0] funct3;
//    logic funct7;
//    logic [3:0] funct;
//    logic [6:0] Instr_type;
    
    always_comb begin
//        rd <= Instr [11:7];
//        funct7 <= Instr [30];
//        funct <= {funct3,funct7};
//        Instr_type <= Instr [6:0];
        
        case(ALUSel)
            // R- type, I-Type
            4'd1: ALUop <= data1 +  data2;   //  Add
            4'd2: ALUop <= data1 -  data2;   //  Sub
            4'd3: ALUop <= data1 << data2[4:0];  //  SLL
            4'd4: ALUop <= $signed(data1) <  $signed(data2);   //  SLT
            4'd5: ALUop <= $unsigned(data1) <  $unsigned(data2);   //  SLTU ?
            4'd6: ALUop <= data1 ^  data2;   //  XOR
            4'd7: ALUop <= data1 >>  data2[4:0];  //  SRL
            4'd8: ALUop <= $signed(data1) >>> data2[4:0]; //  SRA  sign extension of MSB to lower bits
            4'd9: ALUop <= data1 |  data2;   //  OR
            4'd10: ALUop <= data1 &  data2;   //  AND
            4'd11: ALUop <= data2;          // for LUI 
            
            
            
         endcase  
         end
         
endmodule
