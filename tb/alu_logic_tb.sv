`timescale 1ns / 1ps


logic [31:0] data1, data2;
logic [3:0] ALUSel1;
logic [31:0] ALUop;
    
module alu_logic_tb();

alu_logic dut( .data1(data1), .data2(data2), .ALUSel(ALUSel1), .ALUop(ALUop));

//            4'b0000: ALUop = data1 +  data2;   //  Add
//            4'b0001: ALUop = data1 -  data2;   //  Sub
//            4'b0010: ALUop = data1 << data2;  //  SLL
//            4'b0100: ALUop = data1 <  data2;   //  SLT
//            4'b0110: ALUop = $unsigned(data1) <  data2;   //  SLTU ?
//            4'b1000: ALUop = data1 ^  data2;   //  XOR
//            4'b1010: ALUop = data1 >> data2;  //  SRL
//            4'b1011: ALUop = data1 >>> data2; //  SRA
//            4'b1100: ALUop = data1 |  data2;   //  OR
//            4'b1110: ALUop = data1 &  data2;   //  AND

initial begin

data1 = 32'hf0000000;
data2 = 32'd5;

#10; ALUSel1 = 4'b0000;
#10; ALUSel1 = 4'b0001;
#10; ALUSel1 = 4'b0010;
#10; ALUSel1 = 4'b0100;
#10; ALUSel1 = 4'b0110;
#10; ALUSel1 = 4'b1000;
#10; ALUSel1 = 4'b1010;
#10; ALUSel1 = 4'b1011;
#10; ALUSel1 = 4'b1100;
#10; ALUSel1 = 4'b1110;
#10; ALUSel1 = 4'b1111;
#10;
$finish;

end
endmodule
