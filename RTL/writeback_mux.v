`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2026 10:42:07 AM
// Design Name: 
// Module Name: writeback_mux
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


module writeback_mux (
    input  wire [31:0] ALU_RESULT,
    input  wire [31:0] MEM_DATA,
    input  wire        MemToReg,

    output wire [31:0] WD
);

    assign WD = MemToReg ? MEM_DATA : ALU_RESULT;

endmodule
