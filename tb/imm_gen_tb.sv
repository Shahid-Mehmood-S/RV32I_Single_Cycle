`timescale 1ns / 1ps

//module imm_gen #(parameter width = 32)( 
//    input logic [31:0] ip,
//    input logic [2:0] instSel,
//    output logic [31:0] op

logic [31:0] inp1;
logic [31:0] op1;
logic [2:0] instSel1;

module imm_gen_tb();

imm_gen dut(.inp(inp1), .op(op1), .instSel(instSel1));

initial begin

#5;
instSel1 = 3'd0;
inp1 = 32'h00A00083;

#5;
instSel1 = 3'd1;
inp1 = 32'h00100523;

#5;
instSel1 = 3'd2;
inp1 = 32'h00208863;

#5;
instSel1 = 3'd3;
inp1 = 32'h1869F0B7;

#5;
instSel1 = 3'd4;
inp1 = 32'h008000EF;

//#5;
//instSel1 = 3'b000;
//ip1 = 32'h00000000;

//#5;
//0x00A00083
//0x00100523



//instSel1 = 3'b000;
//ip1 = 32'hF0000000;

#5

$finish;


end

endmodule
