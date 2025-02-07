`include "adder.v"
`ifndef SUBTRACT_V
`define SUBTRACT_V
module SUB (
    input  [63:0] A,  // 64-bit input A
    input  [63:0] B,  // 64-bit input B
    output [63:0] Y  // 64-bit output Y
);

    wire [63:0] B_complement;
    wire [63:0] B_two_complement;

    generate
        genvar i;
        for (i = 0; i < 64; i = i + 1) begin : twos_complement
            xor(B_complement[i], B[i], 1'b1);
        end
    endgenerate

    ADD uut (
        .A(64'd1),
        .B(B_complement),
        .Y(B_two_complement)
    );

    ADD uut2 (
        .A(A),
        .B(B_two_complement),
        .Y(Y)
    );
endmodule

`endif  // SUBSTRACT_V