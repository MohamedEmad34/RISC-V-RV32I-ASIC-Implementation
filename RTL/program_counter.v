`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 05:55:50 PM
// Design Name: 
// Module Name: PC
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
module PC (
    input          clk,
    input          rst,
    input   [31:0] pc_next,
    output reg [31:0] pc
);

always @(posedge clk or posedge rst) begin
    if (rst)
        pc <= 32'h0000_0000;
    else
        pc <= pc_next;
end

endmodule


