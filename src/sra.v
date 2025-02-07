`include "mux_64.v"   
`include "mux.v"

module SRA(
    input [63:0] A,   // 64-bit input A
    input [63:0] B,    // 5-bit shift amount (0-31 valid)
    output [63:0] Y   // 64-bit output Y
);
    wire [63:0] sh1_0, sh2_0, sh3_0, sh4_0, Y_0; // Wires for zero-extension case
    wire [63:0] sh1_1, sh2_1, sh3_1, sh4_1, Y_1; // Wires for sign-extension case

    // Zero-extend case (logical shift right)
    mux64 mux1 (.A({1'b0, A[63:1]}),  .B(A), .S(B[0]), .Y(sh1_0));
    mux64 mux2 (.A({2'b00, sh1_0[63:2]}), .B(sh1_0), .S(B[1]), .Y(sh2_0));
    mux64 mux3 (.A({4'b0000, sh2_0[63:4]}), .B(sh2_0), .S(B[2]), .Y(sh3_0));
    mux64 mux4 (.A({8'b00000000, sh3_0[63:8]}), .B(sh3_0), .S(B[3]), .Y(sh4_0));
    mux64 mux5 (.A({16'b0000000000000000, sh4_0[63:16]}), .B(sh4_0), .S(B[4]), .Y(Y_0));

    // Sign-extend case (arithmetic shift right)
    mux64 mux11 (.A({1'b1, A[63:1]}),  .B(A), .S(B[0]), .Y(sh1_1));
    mux64 mux12 (.A({2'b11, sh1_1[63:2]}), .B(sh1_1), .S(B[1]), .Y(sh2_1));
    mux64 mux13 (.A({4'b1111, sh2_1[63:4]}), .B(sh2_1), .S(B[2]), .Y(sh3_1));
    mux64 mux14 (.A({8'b11111111, sh3_1[63:8]}), .B(sh3_1), .S(B[3]), .Y(sh4_1));
    mux64 mux15 (.A({16'b1111111111111111, sh4_1[63:16]}), .B(sh4_1), .S(B[4]), .Y(Y_1));

    // Select between zero-extended and sign-extended shift based on A's MSB (sign bit)
    mux64 mux16 (.A(Y_1), .B(Y_0), .S(A[63]), .Y(Y));
endmodule
