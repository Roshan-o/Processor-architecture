module XOR (
    input  [63:0] A,  // 64-bit input A
    input  [63:0] B,  // 64-bit input B
    output [63:0] Y   // 64-bit output Y
);

    genvar i;
    generate
        for (i = 0; i < 64; i = i + 1) begin : and_gates
            xor(Y[i], A[i], B[i]);  // AND operation for each bit
        end
    endgenerate

endmodule