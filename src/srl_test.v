`include "srl.v"

module shift_right_logical_tb;
    reg [63:0] A;  // 64-bit input A
    reg [63:0] B;   // Shift amount
    wire [63:0] Y; // 64-bit output Y

    // Instantiate the module   
    SRL uut (
        .A(A),
        .B(B),
        .Y(Y)
    );
    initial begin
        // Test Case 1: Shift by 4 positions
        A = 64'b1000000000000000000000000000000000000000000000000000000000001010;
        B = 64'd1;  // Shift right by 4
        #10;
        $display("A = %b, B = %d, Y = %b", A, B, Y); // Expected: Y =

        $finish;
    end
endmodule