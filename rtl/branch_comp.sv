`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2024 12:31:27 PM
// Design Name: 
// Module Name: branch_comp
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


module branch_comp #(parameter width = 32)(
    input logic [width-1:0] data1, data2, 
    input logic BrUn, 
    output logic Eq, Lt
    );
    
    logic signed [width-1:0] s_d1,s_d2;
    logic unsigned [width-1:0] uns_d1, uns_d2;
    
    always_comb begin
    
        if(BrUn == 1'b1)
        begin
            uns_d1 <= data1;
            uns_d2 <= data2;
            
            if(uns_d1 == uns_d2)
                Eq = 1'b1;
                
            else
                Eq = 1'b0;
            
            if(uns_d1 < uns_d2)
                Lt = 1'b1;
                
            else
                Lt = 1'b0;
        
        
        end
        else
        begin
            s_d1 <= data1;
            s_d2 <= data2; 
            
            if(s_d1 == s_d2)
                Eq = 1'b1;
                
            else
                Eq = 1'b0;
            
            if(s_d1 < s_d2)
                Lt = 1'b1;
                
            else
                Lt = 1'b0;             
            
        end          
    end
endmodule
