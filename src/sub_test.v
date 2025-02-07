`include "subtract.v"
module substracter;
    reg [63:0] A, B;
    wire [63:0] Y;
    wire borrow;

    // Instantiate the adder
    SUB uut (
        .A(A),
        .B(B),
        .Y(Y),
        .borrow(borrow)
    );

    initial begin
        // Test Case 1: 0 + 0 = 0
        A = 64'b0100000000000000000000000000000000000000000000000000000000000100;
        B = 64'b0000000000000000000000000000000000000000000000000000000000000001;
        #10;
        $display("Test 1 - A = %d, B = %d, Y = %d ,bo=%b", A, B, Y,borrow); // Expected: Y = 0000000000000000

        $finish;
    end
endmodule
