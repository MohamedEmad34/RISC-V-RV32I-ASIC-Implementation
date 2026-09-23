`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 04:27:46 PM
// Design Name: 
// Module Name: fetch_decode
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


module fetch_decode (
    input  wire        clk,
    input  wire        reset,

    output wire [31:0] pc,
    output wire [31:0] instruction,

    output wire [6:0]  opcode,
    output wire [4:0]  rd,
    output wire [4:0]  rs1,
    output wire [4:0]  rs2,
    output wire [2:0]  funct3,
    output wire [6:0]  funct7
);

    wire [31:0] pc_next;

    // Temporary: sequential execution only
    assign pc_next = pc + 32'd4;

    // Program Counter
    PC u_pc (
        .clk     (clk),
        .rst   (reset),
        .pc_next (pc_next),
        .pc       (pc)
    );

    // Instruction Memory
    instruction_memory u_imem (
        .address    (pc),
        .instruction(instruction)
    );

    // Instruction Decoder
    instruction_decoder u_decoder (
        .INSTRUCTION(instruction),
        .OPCODE     (opcode),
        .RD         (rd),
        .RS1        (rs1),
        .RS2        (rs2),
        .FUNCT3     (funct3),
        .FUNCT7     (funct7)
    );

endmodule
