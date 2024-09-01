`timescale 1ns / 1ps

module top(
    input logic clk, rst
    
//    output logic [31:0] data

    );
    

logic [31:0]  ALUop, data1, data2,inp, ip, pc_op, op, data, 
              Bsel_op,dataW, WBsel_op, data_m_out, PC, Asel_op, Naddr,ip_out;
logic [1:0] WBSel_pin;              
logic [3:0] ALUSel;
logic [2:0] ImmSel, data_m_instr;

logic BrEq, BrLt, PCSel_pin, BSel_pin, ASel_pin, BrUn, RegWen, data_m_R, data_m_W;              
              
//logic [31:0]  four = 32'd4;

  alu_logic alu( 
        .data1(Asel_op), 
        .data2(Bsel_op), 
        .ALUSel(ALUSel), 
        .ALUop(ALUop)
        );
  
  BSel_mux data2_mux( 
        .rF_ip(data2), 
        .imm(op), 
        .Bsel_op(Bsel_op), 
        .BSel_pin(BSel_pin)
        );
  
  imm_gen im_gen(
        .inp(data), 
        .op(op), 
        .instSel(ImmSel)
        );
  
  inst_mem instruct_mem( 
        .IMEMaddr(pc_op - 32'h80000000), 
        .data(data)
        );
  
  pc4 pc_4(
        .addr(pc_op), 
        .Naddr(Naddr), 
        .constant(32'd4) 
        );
  PCSel_mux pcsel(
            .pc_four(Naddr),
            .alu_op(ALUop),
            .PCSel_pin(PCSel_pin),
            .PCSel_op(ip_out)
            );
  
  program_counter prog_count( 
        .ip(ip_out), 
        .pc_op(pc_op), 
        .rst(rst), 
        .clk(clk)
        );
  
  rf reg_File(
        .dataW(WBsel_op), 
        .data1(data1), 
        .data2(data2),
        .rsW( data [11:7]), 
        .rs1( data [19:15]), 
        .rs2( data [24:20]), 
        .RegWen(RegWen), 
        .clk(clk)
  );
    
  WBSel WBSel_mux( 
       .alu(ALUop), 
       .data_mem(data_m_out),
       .PC(Naddr), 
       .WBsel_op(WBsel_op), 
       .WBSel_pin(WBSel_pin)
  );
  
  ASel_mux dut( 
       .data1(data1), 
       .pc_out(pc_op), 
       .ASel_pin(ASel_pin), 
       .Asel_op(Asel_op)
  );
  
  data_mem dmm(
      .data_m_addr(ALUop), 
      .data_m_in(data2),
      .data_m_R(data_m_R),
      .data_m_W(data_m_W),
      .data_m_clk(clk),
      .data_m_instr(data_m_instr),
      .data_m_out(data_m_out)
  );
  

  
branch_comp branch(
       .data1(data1), 
       .data2(data2), 
       .BrUn(BrUn), 
       .Eq(BrEq), 
       .Lt(BrLt) 
       );

control_unit ctrl(

    .inst(data), 
    .BrEq(BrEq), .BrLt(BrLt),
    .PCSel(PCSel_pin), .BrUn(BrUn), .BSel(BSel_pin), .ASel(ASel_pin), .data_m_R(data_m_R), .data_m_W(data_m_W), .RegWen(RegWen),
    .ImmSel(ImmSel), .data_m_instr(data_m_instr), // ImmSel = 000 I-type, 001 S-Type
    .WBSel(WBSel_pin),
    .ALUSel(ALUSel)
    
    );

tracer tracer_ip (
                    .clk_i(clk),
                    .rst_ni(~rst),
                    .hart_id_i(32'b0),

                    .rvfi_valid(1'b1),
                    .rvfi_insn_t(data),
                    .rvfi_rs1_addr_t(data[19:15]),
                    .rvfi_rs2_addr_t(data[24:20]),

                    .rvfi_rs1_rdata_t(data1),
                    .rvfi_rs2_rdata_t(data2),

                    .rvfi_rd_addr_t(data[11:7]) ,
                    .rvfi_rd_wdata_t(WBsel_op),
                    .rvfi_pc_rdata_t(pc_op),               
                    .rvfi_pc_wdata_t(ip_out),     
                    .rvfi_mem_addr(0),
                    .rvfi_mem_rmask(0),
                    .rvfi_mem_wmask(0),
                    .rvfi_mem_rdata(0),
                    .rvfi_mem_wdata(0)
                );

    
endmodule
