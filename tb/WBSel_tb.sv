`timescale 1ns / 1ps

logic [31:0] alu;
logic [31:0] data_mem;
logic [31:0] WBsel_op, PC;
logic [1:0] WBSel_pin;
    
module WBSel_tb();

WBSel dut( .alu(alu), .data_mem(data_mem), .WBsel_op(WBsel_op), .WBSel_pin(WBSel_pin), .PC(PC));

initial begin 
alu = 32'h00005555;
data_mem = 32'h00001111;
PC = 00006666;

#5;
WBSel_pin = 2'b00;
#5;
WBSel_pin = 2'b01;
#5;
WBSel_pin = 2'b10;
#5;

$finish;

end
endmodule