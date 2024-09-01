`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2024 11:56:14 AM
// Design Name: 
// Module Name: ASel_mux_tb
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

    logic [31:0] data1A;
    logic [31:0] pc_out;
    logic ASel_pin;
    logic [31:0] Asel_op;
    

    
module ASel_mux_tb();

ASel_mux dut( .data1(data1A), .pc_out(pc_out), .ASel_pin(ASel_pin), .Asel_op(Asel_op));

initial begin 
data1A = 32'h00005555;
pc_out = 32'h00001111;

#5;
ASel_pin = 1'b0;
#5;
ASel_pin = 1'b1;
#5;

$finish;



end
endmodule
