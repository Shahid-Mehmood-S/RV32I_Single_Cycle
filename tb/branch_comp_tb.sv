`timescale 1ns / 1ps


module branch_comp_tb();

    logic [31:0] data1, data2; 
    logic BrUn, Eq, Lt;
    
branch_comp dut(.data1(data1), .data2(data2), .BrUn(BrUn), .Eq(Eq), .Lt(Lt) );

initial begin

data1 = 32'd0;
data2 = 32'd0;
BrUn = 1'b0;

#10;
data1 = 32'd5;
data2 = 32'd5;
BrUn = 1'b1;

#10;
data1 = 32'd5;
data2 = 32'd10;
BrUn = 1'b1;

#10;
data1 = 32'd15;
data2 = 32'd8;
BrUn = 1'b1;

#10;
data1 = 32'hfffffff1;
data2 = 32'hfffffff1;
BrUn = 1'b0;


#10;
data1 = 32'hfffffff2;
data2 = 32'hfffffff1;
BrUn = 1'b0;

#10;
data1 = 32'hfffffff1;
data2 = 32'hfffffff2;
BrUn = 1'b0;

#10;
$finish;

end
endmodule
