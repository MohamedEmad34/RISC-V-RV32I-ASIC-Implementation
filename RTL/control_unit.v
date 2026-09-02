`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 05:33:44 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit (
    input  wire [6:0] opcode,
    input  wire [2:0] funct3,
    input  wire [6:0] funct7,

    output reg        RegWrite,
    output reg        ALUSrc,
    output reg        MemRead,
    output reg        MemWrite,
    output reg        MemToReg,
    output reg        Branch,
    output reg        Jump,
    output reg [3:0]  ALUControl
);

    // Opcodes
    localparam OP_RTYPE  = 7'b0110011;
    localparam OP_ITYPE  = 7'b0010011;
    localparam OP_LOAD   = 7'b0000011;
    localparam OP_STORE  = 7'b0100011;
    localparam OP_BRANCH = 7'b1100011;
    localparam OP_LUI    = 7'b0110111;
    localparam OP_AUIPC  = 7'b0010111;
    localparam OP_JAL    = 7'b1101111;

    // ALU Control
    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b0001;
    localparam ALU_AND = 4'b0010;
    localparam ALU_OR  = 4'b0011;
    localparam ALU_XOR = 4'b0100;
    localparam ALU_SLT = 4'b0101;

    always @(*) begin

        // Default values
        RegWrite  = 1'b0;
        ALUSrc    = 1'b0;
        MemRead   = 1'b0;
        MemWrite  = 1'b0;
        MemToReg  = 1'b0;
        Branch    = 1'b0;
        Jump      = 1'b0;
        ALUControl = ALU_ADD;

        case (opcode)

            // =====================================
            // R-Type
            // =====================================
            OP_RTYPE: begin

                RegWrite = 1'b1;
                ALUSrc   = 1'b0;

                case (funct3)

                    3'b000: begin
                        // ADD / SUB
                        if (funct7 == 7'b0100000)
                            ALUControl = ALU_SUB;
                        else
                            ALUControl = ALU_ADD;
                    end

                    3'b111:
                        ALUControl = ALU_AND;

                    3'b110:
                        ALUControl = ALU_OR;

                    3'b100:
                        ALUControl = ALU_XOR;

                    3'b010:
                        ALUControl = ALU_SLT;

                    default:
                        ALUControl = ALU_ADD;

                endcase

            end


            // =====================================
            // I-Type ALU
            // =====================================
            OP_ITYPE: begin

                RegWrite = 1'b1;
                ALUSrc   = 1'b1;

                case (funct3)

                    3'b000:
                        ALUControl = ALU_ADD; // ADDI

                    3'b111:
                        ALUControl = ALU_AND; // ANDI

                    3'b110:
                        ALUControl = ALU_OR;  // ORI

                    3'b100:
                        ALUControl = ALU_XOR; // XORI

                    3'b010:
                        ALUControl = ALU_SLT; // SLTI

                    default:
                        ALUControl = ALU_ADD;

                endcase

            end


            // =====================================
            // LOAD
            // =====================================
            OP_LOAD: begin

                RegWrite = 1'b1;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemToReg = 1'b1;

                ALUControl = ALU_ADD;

            end


            // =====================================
            // STORE
            // =====================================
            OP_STORE: begin

                RegWrite = 1'b0;
                ALUSrc   = 1'b1;
                MemWrite = 1'b1;

                ALUControl = ALU_ADD;

            end


            // =====================================
            // BRANCH
            // =====================================
            OP_BRANCH: begin

                Branch = 1'b1;
                ALUSrc = 1'b0;

                // BEQ / BNE use subtraction
                ALUControl = ALU_SUB;

            end


            // =====================================
            // LUI
            // =====================================
            OP_LUI: begin

                RegWrite = 1'b1;
                ALUSrc   = 1'b1;

                ALUControl = ALU_ADD;

            end


            // =====================================
            // AUIPC
            // =====================================
            OP_AUIPC: begin

                RegWrite = 1'b1;
                ALUSrc   = 1'b1;

                ALUControl = ALU_ADD;

            end


            // =====================================
            // JAL
            // =====================================
            OP_JAL: begin

                RegWrite = 1'b1;
                Jump     = 1'b1;

                ALUSrc = 1'b1;

            end


            default: begin

                RegWrite   = 1'b0;
                ALUSrc     = 1'b0;
                MemRead    = 1'b0;
                MemWrite   = 1'b0;
                MemToReg   = 1'b0;
                Branch     = 1'b0;
                Jump       = 1'b0;
                ALUControl = ALU_ADD;

            end

        endcase

    end

endmodule
