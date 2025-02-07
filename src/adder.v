

`ifndef ADDER_V
`define ADDER_V
module ADD (
    input  [63:0] A,  // 64-bit input A
    input  [63:0] B,  // 64-bit input B
    output [63:0] Y // 64-bit output Y
);

    wire [63:0] sum;          // Intermediate sum bits
    wire [63:0] dot;          // AND results for carry generation
    wire [64:0] carry_in;     // Carry from previous bit
    wire [63:0] carry_out;    // Carry to next bit (final carry-out in last bit)
    
    assign carry_in[0] = 1'b0;  // First bit has no incoming carry

    genvar i;
    generate
        for (i = 0; i < 64; i = i + 1) begin : adder_bit
            // XOR for sum bit
            xor(sum[i], A[i], B[i]);
            
            // AND for carry generation
            and(dot[i], A[i], B[i]);
            
            // XOR for output sum, including carry-in
            xor(Y[i], sum[i], carry_in[i]);

            // Calculate carry to next bit
            and(carry_out[i], sum[i], carry_in[i]);
            or(carry_in[i+1], carry_out[i], dot[i]);  // Carry out for next bit
        end
    endgenerate

endmodule

`endif  // ADDER_V



// module adder (
//     input  [63:0] A,  // 64-bit input A
//     input  [63:0] B,  // 64-bit input B
//     output [63:0] Y   // 64-bit output Y
// );

//     wire [63:0] dot;
//     wire [63:0] sum;
//     wire carry_in;
//     and(carry_in,1'b0,1'b0);
//     wire carry_dup;
//     genvar i;
//     generate
//         for (i = 0; i < 64; i = i + 1) begin : adder_bit
//             xor(sum[i],A[i], B[i]);  // XOR for sum
//             and(dot[i],A[i],B[i]); // AND for carry
//             xor(Y[i],sum[i],carry_in);
//             and(carry_dup,sum[i],carry_in);
//             or(carry_in,dot[i],carry_dup);
//         end

//     endgenerate


// endmodule
