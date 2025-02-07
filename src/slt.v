`include "mux.v"
`include "subtract.v"
`include "and.v"

module SLT(
    input  [63:0] A,  // 64-bit input A
    input  [63:0] B,  // 64-bit input B
    output [63:0]Y       // 1-bit output Y
);

    wire [63:0] diff;
    wire borrow;
    SUB sub (
        .A(B),
        .B(A),
        .Y(diff)
    );
    wire [63:0] postive_check;
    assign postive_check[0]=1'b0;
    generate
        genvar i;
        for (i = 0; i < 63; i = i + 1) begin
            or(postive_check[i+1], diff[i], postive_check[i]);
        end
    endgenerate
    wire msbnot,check,Y_11;
    // and(, postive_check[63],1'b1);
    not(msbnot, diff[63]);
    // AND(.A({63'd0,postive_check[63]}), .B({63'd0,msbnot}),.Y(Y));
    and(Y_11, postive_check[63],msbnot);
    assign Y={63'd0,Y_11};

endmodule