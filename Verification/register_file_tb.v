module register_file (
    input  wire        CLK,
    input  wire        RST,

    input  wire        WE,
    input  wire [4:0]  RS1,
    input  wire [4:0]  RS2,
    input  wire [4:0]  RD,
    input  wire [31:0] WD,

    output wire [31:0] RD1,
    output wire [31:0] RD2
);

    reg [31:0] registers [0:31];

    integer i;

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'd0;
        end
        else begin
            if (WE && (RD != 5'd0))
                registers[RD] <= WD;
        end
    end

    assign RD1 = (RS1 == 5'd0) ? 32'd0 : registers[RS1];
    assign RD2 = (RS2 == 5'd0) ? 32'd0 : registers[RS2];

endmodule
