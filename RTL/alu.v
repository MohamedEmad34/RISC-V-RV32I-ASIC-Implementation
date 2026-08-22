`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/22/2026 01:54:25 PM
// Design Name: 
// Module Name: alu
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

module alu (
    input  wire [31:0] A,
    input  wire [31:0] B,
    input  wire [2:0]  ALU_CTRL,

    output reg [31:0] RESULT,
    output         ZERO
);
// ALU control encoding
      localparam ALU_ADD = 3'b000;
  localparam ALU_SUB = 3'b001;
  localparam ALU_AND = 3'b010;
  localparam ALU_OR  = 3'b011;
  localparam ALU_XOR = 3'b100;
  localparam ALU_SLT = 3'b101;

       always @(*) begin
         case (ALU_CTRL)
             ALU_AND: RESULT = A & B;
             ALU_OR : RESULT = A | B;
             ALU_ADD: RESULT = A + B;
             ALU_XOR: RESULT = A ^ B;
             ALU_SUB: RESULT = A - B;
             ALU_SLT: RESULT = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
             default: RESULT = 32'd0;
         endcase
     end
         assign ZERO = (RESULT == 32'd0);

    endmodule

