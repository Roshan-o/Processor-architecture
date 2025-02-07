`ifndef MUX_64_V
`define MUX_64_V
`include "and.v"
`include "or.v"
module mux64 (
    input[63:0] A,
    input[63:0] B,
    input S,
    output [63:0] Y
);
    wire [63:0] andA;
    wire [63:0] andB;
    wire notS;
    
    not(notS, S);
    AND and1(.A(A), .B({64{S}}), .Y(andA));
    AND and2(.A(B), .B({64{notS}}), .Y(andB));
    OR or1(.A(andA), .B(andB), .Y(Y));
endmodule


`endif  