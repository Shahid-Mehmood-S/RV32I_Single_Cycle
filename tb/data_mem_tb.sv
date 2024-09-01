`timescale 1ns / 1ps

module data_mem_tb();

    logic [31:0] data_m_addr, data_m_in;
    logic data_m_R, data_m_W, data_m_clk;
    logic [2:0] data_m_instr;
    logic [31:0] data_m_out;
    
    logic [31:0] test_W;
    logic [15:0] test_HW;
    logic [7:0] test_B;
    
    // Instantiate the DUT (Design Under Test)
    data_mem dut(
        .data_m_addr(data_m_addr), 
        .data_m_in(data_m_in), 
        .data_m_R(data_m_R), 
        .data_m_W(data_m_W), 
        .data_m_clk(data_m_clk), 
        .data_m_instr(data_m_instr), 
        .data_m_out(data_m_out)
    );

    // Generate clock
    always #5 data_m_clk = ~data_m_clk;

    initial begin
        // Initialize signals
        data_m_clk = 0;
        data_m_R = 0;
        data_m_W = 0;
        data_m_in = 0;
        data_m_addr = 0;
        data_m_instr = 0;

#10;
        // Store operations
        // Store Word
        data_m_instr = 3'b101; // W
        data_m_in = 32'h12345678;
        data_m_addr = 32'd0;
        data_m_R = 1'b0;
        data_m_W = 1'b1;
        #10;
        data_m_W = 1'b0; // Disable write
        #10;
//        test_W = dut.dataMEM[0][31:0];
        test_W = {data_m_addr[3],data_m_addr[2],data_m_addr[1],data_m_addr[0]};
//        $display("test_W = %h", test_W);
        if ( test_W !== 32'h12345678) $display("Store: Word failed.");

        // Store Byte
        data_m_instr = 3'b110; // Byte
        data_m_in = 32'd128;   // 1000 0000
        data_m_addr = 32'd4;
        data_m_R = 1'b0;
        data_m_W = 1'b1;
        #10;
        data_m_W = 1'b0; // Disable write
        #10;
        test_B = dut.dataMEM[4][7:0];
//        test_HW = dut.dataMEM[8][15:0];
        if ( test_B !== 8'd128) $display("Store: Byte failed.");

        // Store Half Word
        data_m_instr = 3'b111; // HW
        data_m_in = 32'd32768; // 1000 0000 0000 0000
        data_m_addr = 32'd8;
        data_m_R = 1'b0;
        data_m_W = 1'b1;
        #10;
        data_m_W = 1'b0; // Disable write
        #10;
        test_HW = dut.dataMEM[8][15:0];
//        $display("dut.dataMEM[8][15:0] = %d",dut.dataMEM[8][15:0]);
        
        if ( dut.dataMEM[8][15:0] !== 8'd32768) $display("Store: Half Word failed.");

        // Load operations
        data_m_in = 32'd0; 
        // Load Word
        data_m_instr = 3'b000;   // L W
        data_m_addr = 32'd0;
        data_m_R = 1'b1;
        data_m_W = 1'b0;
        #10;
        if ( data_m_out !== 32'h12345678) $display("Load: Word failed.");

        // Load Signed Byte
        data_m_instr = 3'b001;   // L SB
        data_m_addr = 32'd4;
        data_m_R = 1'b1;
        data_m_W = 1'b0;
        #10;
        if ( data_m_out !== 32'b11111111111111111111111110000000) $display("Load: SB failed.");

        // Load Unsigned Byte
        data_m_instr = 3'b010;   // L UB
        data_m_addr = 32'd4;
        data_m_R = 1'b1;
        data_m_W = 1'b0;
        #10;
        if ( data_m_out !== 32'b00000000000000000000000010000000) $display("Load: UB failed.");

        // Load Signed Half Word
        data_m_instr = 3'b011;   // L SHW
        data_m_addr = 32'd8;
        data_m_R = 1'b1;
        data_m_W = 1'b0;
        #10;
        if ( data_m_out !== 32'b11111111111111111000000000000000) $display("Load: SHW failed.");

        // Load Unsigned Half Word
        data_m_instr = 3'b100;   // L UHW
        data_m_addr = 32'd8;
        data_m_R = 1'b1;
        data_m_W = 1'b0;
        #10;
        if ( data_m_out !== 32'b00000000000000001000000000000000) $display("Load: UHW failed.");

        $finish;
    end

endmodule