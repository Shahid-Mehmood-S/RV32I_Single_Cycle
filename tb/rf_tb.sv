`timescale 1ns / 1ps

//    input logic [width-1:0] dataW, 
//    output logic [width-1:0] data1, data2,
//    input logic [dpath-1:0] rsW, rs1, rs2,
//    input logic RegWen, clk

module rf_tb();

logic [31:0] dataW;
logic [31:0] data1, data2;
logic [4:0] rsW, rs1, rs2;
logic RegWen, clk;

always #5 clk = ~clk;

rf dut(
     .dataW(dataW), 
     .data1(data1), .data2(data2),
     .rsW(rsW), .rs1(rs1), .rs2(rs2),
     .RegWen(RegWen), .clk(clk)
    );
    
initial begin

clk = 1'b0;

#5;
dataW = 32'h01010101;
//rs1 = 5'b00000;
//rs2 = 5'b00011;
rsW = 5'b00001;
RegWen = 1'b1;

#10;
RegWen = 1'b0;
#10;
rs1 = 5'b00000;
rs2 = 5'b00001;

#5;
$finish;



end
endmodule
