`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2024 03:45:04 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem #(parameter width = 8, depth = 180)(

    input logic [31:0] data_m_addr, data_m_in,
    input logic data_m_R, data_m_W, data_m_clk,
    input logic [2:0] data_m_instr,
    output logic [31:0] data_m_out
    
    );
    
    logic [width-1:0] dataMEM [depth-1:0]; 

//initial begin    
//       dataMEM [0] = 32'h00000111;
//       dataMEM [1] = 32'h00000012;
//       dataMEM [2] = 32'h00000123;
//       dataMEM [3] = 32'h00008234;
//       dataMEM [4] = 32'h00012345;
//       dataMEM [5] = 32'h01234567;
//       dataMEM [6] = 32'h82345678;
//       dataMEM [7] = 32'h10000000;
//       dataMEM [8] = 32'h12000000;
//       dataMEM [9] = 32'h12300000;
//       dataMEM [10] = 32'h12340000;
//       dataMEM [11] = 32'h12345000;
//       Data_mem [12] = 32'h12345600;
//       Data_mem [13] = 32'h12345570;
//       Data_mem [14] = 32'h12345678;
//       Data_mem [15] = 32'h00000111;
//       Data_mem [16] = 32'h00000012;
//       Data_mem [17] = 32'h00000123;
//       Data_mem [18] = 32'h00001234;
//       Data_mem [19] = 32'h00012345;
//       Data_mem [20] = 32'h01234567;
//       Data_mem [21] = 32'h12345678;
//       Data_mem [22] = 32'h10000000;
//       Data_mem [23] = 32'h12000000;
//       Data_mem [24] = 32'h12300000;
//       Data_mem [25] = 32'h12340000;
//       Data_mem [26] = 32'h12345000;
//       Data_mem [27] = 32'h12345600;
//       Data_mem [28] = 32'h12345570;
//       Data_mem [29] = 32'h12345678;
//     end
     
    always_comb begin                   // Load
    if(data_m_R == 1'b1)
        case(data_m_instr)
            2: data_m_out = {dataMEM[data_m_addr+3],dataMEM[data_m_addr+2],dataMEM[data_m_addr+1],dataMEM[data_m_addr]}; // word
            0: data_m_out = { {24{dataMEM[data_m_addr][7]}},dataMEM[data_m_addr] };        // byte signed
            3: data_m_out = { {24{1'b0}},dataMEM[data_m_addr] };                           // byte unsigned
            1: data_m_out = { {16{dataMEM[data_m_addr+1][7]}},dataMEM[data_m_addr+1],dataMEM[data_m_addr] }; // half word signed
            4: data_m_out = { {16{1'b0}},dataMEM[data_m_addr+1],dataMEM[data_m_addr] };    // half word unsigned
        endcase
        
    end
   
    always_ff @(posedge data_m_clk) begin // Store
    if(data_m_W == 1'b1)
        case(data_m_instr)
            7: begin 
                dataMEM[data_m_addr+3] <= data_m_in [31:24];      // word
                dataMEM[data_m_addr+2] <= data_m_in [23:16];
                dataMEM[data_m_addr+1] <= data_m_in [15:8];
                dataMEM[data_m_addr]   <= data_m_in [7:0]; 
               end
            5: begin
                dataMEM[data_m_addr] <= data_m_in[7:0]; // byte 
               end        
            6: begin
                dataMEM[data_m_addr+1] <= data_m_in [15:8]; // half word 
                dataMEM[data_m_addr]   <= data_m_in [7:0];             
               end
//            4: data_m_in <= { {16{1'b0}},dataMEM[data_m_addr+1],dataMEM[data_m_addr] };      // half word unsigned
        endcase
    end
    
    
endmodule
