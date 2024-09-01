`timescale 1ns / 1ps

//module BSel_mux #(parameter width = 32)(
//    input logic [width-1:0] rF,
//    input logic [width-1:0] imm,
//    input logic BSel_pin,
//    output logic [width-1:0] Bsel_op
    
//    );

logic [31:0] rF_ip1;
logic [31:0] imm1;
logic [31:0] Bsel_op1;
logic BSel_pin1;
    
module BSel_mux_tb();

BSel_mux dut( .rF_ip(rF_ip1), .imm(imm1), .Bsel_op(Bsel_op1), .BSel_pin(BSel_pin1));

initial begin 
rF_ip1 = 32'h00005555;
imm1 = 32'h00001111;

#5;
BSel_pin1 = 1'b0;
#5;
BSel_pin1 = 1'b1;
#5;

$finish;



end
endmodule
