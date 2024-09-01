`timescale 1ns / 1ps



module program_counter_tb();

logic [31:0] ip1, op1;
logic rst1, clk1;

program_counter dut( .ip(ip1), .pc_op(op1), .rst(rst1), .clk(clk1));

always #5 clk1 = ~clk1;

initial begin
clk1 = 1'b0;

#10;
ip1 = 32'h00000001;
#10;
ip1 = 32'h00000002;
#10;

$finish;
end

endmodule
