`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2024 03:43:59 PM
// Design Name: 
// Module Name: PCSel
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


module PCSel_mux #(parameter width = 32)(
    input logic [width-1:0] pc_four,
    input logic [width-1:0] alu_op,
    input logic PCSel_pin,
    output logic [width-1:0] PCSel_op
    
    );
    
    always_comb
        case(PCSel_pin)
            
            1'b0: PCSel_op <= pc_four;
            
            1'b1: PCSel_op <= alu_op;
            
        endcase
        
endmodule
