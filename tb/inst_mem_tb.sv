`timescale 1ns / 1ps

//    IMEM[32'd0] = 32'd5;
//    IMEM[32'd2] = 32'd10;
//    IMEM[32'd5] = 32'd15;
//    IMEM[32'd10] = 32'd20;
//    IMEM[32'd31] = 32'd25;
    logic [31:0] IMEMaddr;
    logic [31:0] data;

module inst_mem_tb();

inst_mem dut( .IMEMaddr(IMEMaddr), .data(data));

initial begin
#5;
IMEMaddr = 32'd0;
#5;
IMEMaddr = 32'd1;
#5;
IMEMaddr = 32'd2;
#5;
IMEMaddr = 32'd3;
#5;
IMEMaddr = 32'd4;
#5;

$finish;

end
endmodule
