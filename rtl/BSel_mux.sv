`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2024 12:22:07 PM
// Design Name: 
// Module Name: BSel_mux
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


module BSel_mux #(parameter width = 32)(
    input logic [width-1:0] rF_ip,
    input logic [width-1:0] imm,
    input logic BSel_pin,
    output logic [width-1:0] Bsel_op
    
    );
    
    always_comb
        case(BSel_pin)
        1'b0: Bsel_op = rF_ip;
        1'b1: Bsel_op = imm;
        endcase
        
endmodule
