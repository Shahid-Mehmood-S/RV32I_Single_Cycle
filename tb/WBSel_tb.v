`timescale 1ns / 1ps


logic [31:0] alu;
logic [31:0] data_mem;
logic [31:0] WBsel_op;
logic WBSel_pin;
    
module WBSel_tb();

BSel_mux dut( .alu(alu), .data_mem(data_mem), .WBsel_op(WBsel_op), .WBSel_pin(WBSel_pin));

initial begin 
alu = 32'h00005555;
data_mem = 32'h00001111;

#5;
WBSel_pin = 1'b0;
#5;
WBSel_pin = 1'b1;
#5;

$finish;



end
endmodule