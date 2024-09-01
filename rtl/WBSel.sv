`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2024 10:33:19 AM
// Design Name: 
// Module Name: WBSel
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


module WBSel#(parameter width = 32)(
    input logic [width-1:0] alu,
    input logic [width-1:0] data_mem,
    input logic [width-1:0] PC,
    input logic [1:0] WBSel_pin,
    output logic [width-1:0] WBsel_op
    
    );
    
    always_comb
        case(WBSel_pin)
        2'b01: WBsel_op = alu;
        2'b00: WBsel_op = data_mem;
        2'b10: WBsel_op = PC;
        endcase
        
endmodule
