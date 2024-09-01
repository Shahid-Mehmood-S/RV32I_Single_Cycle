`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2024 11:54:09 AM
// Design Name: 
// Module Name: ASel_mux
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


module ASel_mux#(parameter width = 32)(
    input logic [width-1:0] data1,
    input logic [width-1:0] pc_out,
    input logic ASel_pin,
    output logic [width-1:0] Asel_op
    
    );
    
    always_comb
        case(ASel_pin)
        1'b0: Asel_op = data1;
        1'b1: Asel_op = pc_out;
        endcase
        
endmodule

