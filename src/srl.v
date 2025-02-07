`include "mux_64.v"          // Assuming mux2to1 is defined here
module SRL(
    input [63:0] A,   // 64-bit input A
    input [63:0] B,    // 5-bit number of positions to shift (0-31 valid)
    output [63:0] Y   // 64-bit output Y
);
    wire [63:0] sh1,sh2,sh3,sh4;
    mux64 mux1(.A({1'b0,A[63:1]}),.B(A),.S(B[0]),.Y(sh1));
    mux64 mux2(.A({2'b00,sh1[63:2]}),.B(sh1),.S(B[1]),.Y(sh2));
    mux64 mux3(.A({4'b0000,sh2[63:4]}),.B(sh2),.S(B[2]),.Y(sh3));
    mux64 mux4(.A({8'b00000000,sh3[63:8]}),.B(sh3),.S(B[3]),.Y(sh4));
    mux64 mux5(.A({16'b0000000000000000,sh4[63:16]}),.B(sh4),.S(B[4]),.Y(Y));
endmodule