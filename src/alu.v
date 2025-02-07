`include "adder.v"
`include "subtract.v"
`include "or.v"
`include "and.v"
`include "xor.v"
`include "sll.v"
`include "srl.v"
`include "sra.v"
`include "sltu.v"
`include "slt.v"

module alu(
    input [63:0] a,
    input [63:0] b,
    input [3:0] alu_control,
    output reg [63:0] out  // 'reg' needed to assign inside always block
);

    wire [63:0] and_out, or_out, add_out, sub_out, xor_out;
    wire [63:0] sll_out, srl_out, sra_out, sltu_out, slt_out;

    // Instantiate all modules outside the case statement
    AND and1  (.A(a), .B(b), .Y(and_out));
    OR or1    (.A(a), .B(b), .Y(or_out));
    ADD add1  (.A(a), .B(b), .Y(add_out));
    SUB sub1  (.A(a), .B(b), .Y(sub_out));
    XOR xor1  (.A(a), .B(b), .Y(xor_out));
    SLL sll1  (.A(a), .B(b), .Y(sll_out));
    SRL srl1  (.A(a), .B(b), .Y(srl_out));
    SRA sra1  (.A(a), .B(b), .Y(sra_out));
    SLTU sltu1(.A(a), .B(b), .Y(sltu_out));
    SLT slt1  (.A(a), .B(b), .Y(slt_out));

    // Multiplexer logic using always block
    always @(*) begin
        case (alu_control)
            4'b0000: out = and_out;
            4'b0001: out = or_out;
            4'b0010: out = add_out;
            4'b0011: out = sll_out;
            4'b0100: out = srl_out;
            4'b0101: out = sra_out;
            4'b0110: out = sub_out;
            4'b0111: out = sltu_out;
            4'b1000: out = slt_out;
            4'b1001: out = xor_out;
            default: out = 64'b0;  // Default to zero to avoid undefined behavior
        endcase
    end

endmodule
