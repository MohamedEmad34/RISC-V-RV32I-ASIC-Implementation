`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/23/2026 05:14:22 PM
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder (
    input  wire [31:0] INSTRUCTION,

    output wire [6:0] OPCODE,
    output wire [4:0] RD,
    output wire [4:0] RS1,
    output wire [4:0] RS2,
    output wire [2:0] FUNCT3,
    output wire [6:0] FUNCT7
);

    assign OPCODE = INSTRUCTION[6:0];
    assign RD     = INSTRUCTION[11:7];
    assign FUNCT3 = INSTRUCTION[14:12];
    assign RS1    = INSTRUCTION[19:15];
    assign RS2    = INSTRUCTION[24:20];
    assign FUNCT7 = INSTRUCTION[31:25];

endmodule
