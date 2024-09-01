`timescale 1ns / 1ps

module program_counter #(parameter width = 32)(

    input logic [width-1:0] ip,
    input logic clk, rst,
    output logic [width-1:0] pc_op 
    
    );
    
  
    always_ff @(posedge clk)
    if(rst == 1'b1)
       pc_op <= 32'h80000000;
            
    else
       pc_op <= ip;
    
    
    
endmodule
