`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: alu_control
// Description: Translates the Control Unit's coarse ALUOp, together with
//              funct3 and funct7[5], into the 3-bit alu_control code that
//              the ALU understands.
//
// ALUOp encoding (driven by control_unit.v):
//   2'b00 -> ADD   (LW / SW address calculation)
//   2'b01 -> SUB   (BEQ / BNE comparison)
//   2'b10 -> R-type -> decode further using funct3 + funct7[5]
//   2'b11 -> I-type (ADDI/ANDI/ORI) -> decode using funct3 only
//            (funct7 is not reliable for I-type: those bits are part
//             of the immediate field, not a real funct7)
//////////////////////////////////////////////////////////////////////////////////
module alu_control (
    input  wire [1:0] alu_op,
    input  wire [2:0] funct3,
    input  wire       funct7_b5,   // funct7[5]: distinguishes ADD vs SUB
    output reg  [2:0] alu_control
);

    // Must match the encoding in alu.v
    localparam ALU_AND = 3'b000;
    localparam ALU_OR  = 3'b001;
    localparam ALU_ADD = 3'b010;
    localparam ALU_XOR = 3'b011;
    localparam ALU_SLT = 3'b100;
    localparam ALU_SUB = 3'b110;

    always @(*) begin
        case (alu_op)

            2'b00: alu_control = ALU_ADD;  // LW / SW
            2'b01: alu_control = ALU_SUB;  // BEQ / BNE

            2'b10: begin // R-type: ADD, SUB, AND, OR, XOR, SLT
                case (funct3)
                    3'b000: alu_control = funct7_b5 ? ALU_SUB : ALU_ADD; // ADD / SUB
                    3'b111: alu_control = ALU_AND;                       // AND
                    3'b110: alu_control = ALU_OR;                        // OR
                    3'b100: alu_control = ALU_XOR;                       // XOR
                    3'b010: alu_control = ALU_SLT;                       // SLT
                    default: alu_control = ALU_ADD;
                endcase
            end

            2'b11: begin // I-type: ADDI, ANDI, ORI
                case (funct3)
                    3'b000:  alu_control = ALU_ADD; // ADDI
                    3'b111:  alu_control = ALU_AND;  // ANDI
                    3'b110:  alu_control = ALU_OR;   // ORI
                    default: alu_control = ALU_ADD;
                endcase
            end

            default: alu_control = ALU_ADD;
        endcase
    end

endmodule
