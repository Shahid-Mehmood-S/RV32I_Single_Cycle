`timescale 1ns / 1ps


logic [31:0] addr1, Naddr1, constant;

module pc4_tb();

pc4 dut(.addr(addr1), .Naddr(Naddr1), .constant(constant));

initial begin

#5;

addr1 = 32'd1;
constant = 32'd4;
#5;
addr1 = 32'd5;
constant = 32'd4;
#5;

$finish;

end

endmodule
