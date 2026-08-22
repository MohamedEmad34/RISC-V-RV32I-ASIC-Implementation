`timescale 1ns/1ps

module alu_tb;

    reg  [31:0] A;
    reg  [31:0] B;
    reg  [2:0]  ALU_CTRL;

    wire [31:0] RESULT;
    wire        ZERO;

    alu DUT (
        .A(A),
        .B(B),
        .ALU_CTRL(ALU_CTRL),
        .RESULT(RESULT),
        .ZERO(ZERO)
    );

    initial begin

        // -------------------------
        // ADD
        // -------------------------
        A = 32'd10;
        B = 32'd5;
        ALU_CTRL = 3'b000;
        #10;

        if (RESULT != 32'd15)
            $display("ERROR: ADD");

        // -------------------------
        // SUB
        // -------------------------
        A = 32'd10;
        B = 32'd5;
        ALU_CTRL = 3'b001;
        #10;

        if (RESULT != 32'd5)
            $display("ERROR: SUB");

        // -------------------------
        // AND
        // -------------------------
        A = 32'hF0F0_F0F0;
        B = 32'h0F0F_0F0F;
        ALU_CTRL = 3'b010;
        #10;

        if (RESULT != 32'h0000_0000)
            $display("ERROR: AND");

        // -------------------------
        // OR
        // -------------------------
        A = 32'hF000_0000;
        B = 32'h0000_000F;
        ALU_CTRL = 3'b011;
        #10;

        if (RESULT != 32'hF000_000F)
            $display("ERROR: OR");

        // -------------------------
        // XOR
        // -------------------------
        A = 32'hFFFF_0000;
        B = 32'h0000_FFFF;
        ALU_CTRL = 3'b100;
        #10;

        if (RESULT != 32'hFFFF_FFFF)
            $display("ERROR: XOR");

        // -------------------------
        // SLT
        // 5 < 10
        // -------------------------
        A = 32'd5;
        B = 32'd10;
        ALU_CTRL = 3'b101;
        #10;

        if (RESULT != 32'd1)
            $display("ERROR: SLT positive");

        // -------------------------
        // SLT signed
        // -5 < 10
        // -------------------------
        A = -32'sd5;
        B = 32'd10;
        ALU_CTRL = 3'b101;
        #10;

        if (RESULT != 32'd1)
            $display("ERROR: SLT signed");

        // -------------------------
        // ZERO flag
        // -------------------------
        A = 32'd20;
        B = 32'd20;
        ALU_CTRL = 3'b001;
        #10;

        if (RESULT != 32'd0 || ZERO != 1'b1)
            $display("ERROR: ZERO flag");

        // -------------------------
        // Finish
        // -------------------------
        $display("=================================");
        $display("       ALU TEST PASSED");
        $display("=================================");

        $finish;

    end

endmodule
