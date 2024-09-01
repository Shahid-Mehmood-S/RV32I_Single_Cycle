`timescale 1ns / 1ps

//module top(
//    input logic clk, BSel_pin, RegWen,rst, 
//    input logic [3:0] ALUSel,
//    input logic [2:0] instSel
    
//    );



module top_tb();
logic clk, rst;
top dut(.clk(clk), .rst(rst) );


always #10 clk = ~clk;

initial begin
clk = 1'b1;
rst = 1'b1;
#20;
rst= 1'b0;
clk = 1'b0;





#1000000 $finish;


//            4'b0000: ALUop <= data1 +  data2;   //  Add
//            4'b0001: ALUop <= data1 -  data2;   //  Sub
//            4'b0010: ALUop <= data1 << data2[4:0];  //  SLL
//            4'b0100: ALUop <= data1 <  data2;   //  SLT
//            4'b0110: ALUop <= $unsigned(data1) <  $unsigned(data2);   //  SLTU ?
//            4'b1000: ALUop <= data1 ^  data2;   //  XOR
//            4'b1010: ALUop <= data1 >>  data2;  //  SRL
//            4'b1011: ALUop <= data1 >>> data2; //  SRA  sign extension of MSB to lower bits
//            4'b1100: ALUop <= data1 |  data2;   //  OR
//            4'b1110: ALUop <= data1 &  data2;   //  AND



//#10; ALUSel = 4'b0010;


end




endmodule
