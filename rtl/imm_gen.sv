`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2024 11:44:40 AM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen #(parameter width = 32)( 
    input logic [31:0] inp,
    input logic [2:0] instSel,
    output logic [31:0] op
    );
    
always_ff @(inp,instSel) begin
   case(instSel)
        3'd0: op <= { {20{inp[31]}},inp[31:20] };                   // I Type
        3'd1: op <= { {20{inp[31]}},inp[31:25],inp[11:7] };         // S Typy
        //                 12       11        10 - 5      4 - 1        
        3'd2: op <= { {20{inp[31]}} , inp[7], inp[30:25], inp[11:8], 1'b0};     // B Type  
              
        3'd3: op <= {inp[31:12],{12{1'b0}}};                    // U Type
        //                     20       19 - 12      11        10 - 1
//        3'd4: op <= {  {12{inp[31]}} , inp[19:12], inp[20], inp[30:21] };   // J Type

//        4:  op <= { {12{inp[31]}},{inp[31]},{inp[19:12]},{inp[20]},{inp[30:21]} };
        3'd4: op <={ {12{inp[31]}}, inp[19:12], inp[20], inp[30:25], inp[24:21], {1{1'b0}}};
//        4:  op <= 32'd1234;
        
        
        default: op = 0;
    endcase

  end
endmodule



