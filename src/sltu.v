`include "mux.v"
`include "or.v"
module SLTU(
    input  [63:0] A,  // 64-bit input A
    input  [63:0] B,  // 64-bit input B
    output [63:0] Y       // 1-bit output Y
);
    wire [64:0] dup;
    assign dup[0] = 1'b0;

    wire [63:0] check, dup1, dup2, Nab, Na;
    wire [64:0] mux_out;
    assign mux_out[0] = 1'b0;
    generate
        genvar i;
        for (i = 0; i<64; i = i + 1) begin : compare
            xor(check[i], A[63-i], B[63-i]);
            or(dup[i+1], check[i], dup[i]);
            not(dup1[i], dup[i]);
            and(dup2[i], dup1[i], check[i]);
            not(Na[i], A[63-i]);
            and(Nab[i], Na[i], B[63-i]);

            mux2to1 m0 (
                .A(Nab[i]),
                .B(mux_out[i]),
                .S(dup2[i]),
                .Y(mux_out[i+1])
            );
            // or(mux_out[i+1], mux_out[i], dup2[i])
        end
    endgenerate
    OR o1(.A(64'd0),.B({63'd0,mux_out[64]}),.Y(Y));
endmodule
