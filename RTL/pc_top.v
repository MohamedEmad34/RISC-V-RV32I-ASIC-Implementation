`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 06:11:22 PM
// Design Name: 
// Module Name: pc_top
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


module pc_top (
    input          clk,
    input          rst,
    output  [31:0] pc
);

wire [31:0] pc_plus_4;

    PC u_pc (
        .clk     (clk),
        .rst     (rst),
        .pc_next (pc_plus_4),
        .pc      (pc)
    );

    PC_Adder u_pc_adder (
        .pc       (pc),
        .pc_plus_4(pc_plus_4)
    );

endmodule
