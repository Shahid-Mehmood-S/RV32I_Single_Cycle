`timescale 1ns / 1ps

module rf #(parameter width = 32, dpath = 5)(

    input logic [width-1:0] dataW, 
    output logic [width-1:0] data1, data2,
    input logic [dpath-1:0] rsW, rs1, rs2,
    input logic RegWen, clk
   
    );
    
    logic [width-1:0] RegFile [31:0];
    
    assign RegFile [1]  = 0;
    assign RegFile [2]  = 0;
    assign RegFile [3]  = 0;
    assign RegFile [4] = 50;
    assign RegFile [5] = 0; 
    assign RegFile [7] = 0; 
    
    
    assign RegFile[0] = 32'd0;
    assign data1 = RegFile[rs1];
    assign data2 = RegFile[rs2];
    
    always_ff @(posedge clk)
    if(RegWen == 1'b1 && rsW != 5'd0)
        RegFile[rsW] <= dataW;
    
    
endmodule
        
        
    
    
    
    

