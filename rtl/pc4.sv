`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2024 06:06:08 PM
// Design Name: 
// Module Name: pc4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pc4 #(parameter width = 32)(
    
    input logic [width-1:0] addr,
    input logic [width-1:0] constant,
    output logic  [width-1:0] Naddr

    );
    
 always_comb begin
       
        Naddr <= addr + constant;
         
         end   
  
    
endmodule
