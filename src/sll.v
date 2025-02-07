`include "mux_64.v"          // Assuming mux2to1 is defined here

module SLL(
    input [63:0] A,   // 64-bit input A
    input [63:0] B,    // 5-bit number of positions to shift (0-31 valid)
    output [63:0] Y   // 64-bit output Y
);
    wire [63:0] sh1,sh2,sh3,sh4;
    mux64 mux1(.A({A[62:0],1'b0}),.B(A),.S(B[0]),.Y(sh1));
    mux64 mux2(.A({sh1[61:0],2'b00}),.B(sh1),.S(B[1]),.Y(sh2));
    mux64 mux3(.A({sh2[59:0],4'b0000}),.B(sh2),.S(B[2]),.Y(sh3));
    mux64 mux4(.A({sh3[55:0],8'b00000000}),.B(sh3),.S(B[3]),.Y(sh4));
    mux64 mux5(.A({sh4[47:0],16'b0000000000000000}),.B(sh4),.S(B[4]),.Y(Y));
endmodule
