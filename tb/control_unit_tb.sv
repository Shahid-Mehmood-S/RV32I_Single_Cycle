`timescale 1ns / 1ps

logic [31:0] inst;
logic BrEq, BrLT;

module control_unit_tb();

control_unit ctrl_dut(.inst(inst),.BrEq(BrEq), .BrLT(BrLT));


initial begin 

inst = 32'd0;
BrEq = 1'b0;
BrLT = 1'b0;
#10
inst = 32'h00A00083;
BrEq = 1'b0;
BrLT = 1'b0;
#10


$finish;
end
endmodule
