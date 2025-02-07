
`include "sll.v"

module shift_left_logical_tb;
    reg [63:0] A;  // 64-bit input A
    reg [4:0] B;   // Shift amount
    wire [63:0] Y; // 64-bit output Y

    // Instantiate the module
    SLL uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Test Case 1: Shift by 4 positions
        A = 64'd1;
        B = 5'd1;  // Shift left by 4
        #10;
        $display("A = %b, B = %d, Y = %b", A, B, Y); // Expected: Y = 0000000000000000000000000000000000000000000000000000000000111100

        // // Test Case 2: Shift by 1 position
        // A = 64'b0000000000000000000000000000000000000000000000000000000000001010;
        // B = 5'd1;  // Shift left by 1
        // #10;
        // $display("A = %b, B = %d, Y = %b", A, B, Y); // Expected: Y = 0000000000000000000000000000000000000000000000000000000000010100

        // // Test Case 3: Shift by 0 positions (no change)
        // A = 64'b0000000000000000000000000000000000000000000000000000000000001010;
        // B = 5'd0;  // No shift
        // #10;
        // $display("A = %b, B = %d, Y = %b", A, B, Y); // Expected: Y = 0000000000000000000000000000000000000000000000000000000000001010

        // // Test Case 4: Shift by 63 positions (Max shift)
        // A = 64'b1000000000000000000000000000000000000000000000000000000000000000; // Only MSB is 1
        // B = 5'd7;  // Shift left by 63
        // #10;
        // $display("A = %b, B = %d, Y = %b", A, B, Y); // Expected: Y = 1000000000000000000000000000000000000000000000000000000000000000

        // // Test Case 5: Shift by more than 63 (Expected Y = all zeros)
        // A = 64'b1111000000000000000000000000000000000000000000000000000000000000;
        // B = 5'd8;  // Shift more than 63 positions (overflow)
        // #10;
        // $display("A = %b, B = %d, Y = %b", A, B, Y); // Expected: Y = 0000000000000000000000000000000000000000000000000000000000000000

        $finish;
    end
endmodule
