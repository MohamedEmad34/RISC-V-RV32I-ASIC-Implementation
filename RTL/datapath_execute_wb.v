`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 05:45:59 PM
// Design Name: 
// Module Name: riscv_rtype_datapath
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


module datapath_execute_wb (
    input  wire        clk,
    input  wire        reset,
//Register addresses
    input  wire [4:0]  rs1,
    input  wire [4:0]  rs2,
    input  wire [4:0]  rd,
//ALU control
    input  wire [3:0]  alu_control,
//Write enable
    input  wire        reg_write,
// write back control
input wire MemToReg,
// Data coming from Data memory
    input  wire [31:0] MEM_DATA,
// outputs for observation 
    output wire [31:0] RD1,
   output wire [31:0] RD2,
   output wire [31:0] ALU_RESULT,
   output wire        ZERO,
   output wire [31:0] WD
);

   

    // Register File
    register_file u_regfile (
        .CLK        (clk),
        .RST      (reset),

        .WE   (reg_write),

        .RS1        (rs1),
        .RS2        (rs2),
        .RD         (rd),

        .WD  (WD),

        .RD1  (RD1),
        .RD2  (RD2)
    );
     writeback_mux u_writeback_mux  (
  .ALU_RESULT(ALU_RESULT),
 .MEM_DATA(MEM_DATA),
.MemToReg(MemToReg),
 .WD(WD)
    );

    // ALU
    alu u_alu (
        .A          (RD1),
        .B          (RD2),
        .ALU_CTRL (alu_control),
        .RESULT     (ALU_RESULT),
        .ZERO(ZERO)
    );

endmodule
