module alu_src_mux (
    input  wire [31:0] RD2,
    input  wire [31:0] IMM,

    input  wire        ALUSrc,

    output wire [31:0] ALU_B
);

    assign ALU_B = ALUSrc ? IMM : RD2;

endmodule
