`include "sltu.v"

module unsigned_less_than_tb;
    // Testbench signals
    reg [63:0] A2;
    reg [63:0] B2;
    wire [63:0]Y2;

    // Instantiate the module under test
    SLTU uut (
        .A(A2),
        .B(B2),
        .Y(Y2)
    );

    initial begin
        // Monitor the signals
        $monitor("Time = %0t | A = %h | B = %h | Y = %b", $time, A2, B2, Y2);

        // Test cases
        A2 = 64'd23; B2 = 64'd23; #10; // A < B, Y should be 1
        // A2 = 64'hFFFFFFFFFFFFFFFF; B2 = 64'h0000000000000000; #10; // A > B, Y should be 0
        // A2 = 64'h123456789ABCDEF0; B2 = 64'h123456789ABCDEF0; #10; // A == B, Y should be 0
        // A2 = 64'h00000000FFFFFFFF; B2 = 64'h0000000100000000; #10; // A < B, Y should be 1
        // A2 = 64'h8000000000000000; B2 = 64'h7FFFFFFFFFFFFFFF; #10; // A > B, Y should be 0

        $finish;
    end
endmodule