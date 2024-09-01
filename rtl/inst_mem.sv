`timescale 1ns / 1ps


module inst_mem #(parameter width = 32, depth = 131072)(
    input logic [width-1:0] IMEMaddr,
    output logic [width-1:0] data
    );
    
    
    logic [width-1:0] IMEM [depth-1:0];

    initial begin
        $readmemh("../sim/seed/test.hex", IMEM);
    end

    assign data = IMEM[IMEMaddr[31:2]];
    
    // TEST Data
//    002083B3
//    402083B3
//    002093B3
//    0020A3B3
//    0020B3B3
//    0020C3B3
//    0020D3B3 ..
//    4020D3B3
//    0020E3B3
//    0020F3B3

//    assign IMEM[0] = 32'h002083B3;  // add 01498933
//    assign IMEM[1] = 32'h402083B3;
//    assign IMEM[2] = 32'h002093B3;
//    assign IMEM[3] = 32'h0020A3B3;
//    assign IMEM[4] = 32'h0020B3B3;
//    assign IMEM[5] = 32'h0020C3B3;
//    assign IMEM[6] = 32'h0020D3B3;
//    assign IMEM[7] = 32'h4020D3B3;
//    assign IMEM[8] = 32'h0020E3B3;
//    assign IMEM[9] = 32'h0020F3B3;
    
    
    
//    IMEM[4] = 32'd25;

endmodule
