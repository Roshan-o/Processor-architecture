`include "adder.v"
module tb_adder_1;
    reg [63:0] A, B;
    wire [63:0] Y;
    wire cout;

    // Instantiate the adder
    ADD uut (
        .A(A),
        .B(B),
        .Y(Y),
        .cout(cout)
    );

    initial begin
        // Test Case 1: 0 + 0 = 0
        A = 64'b1100000000000000000000000000000000000000000000000000000000000011;
        B = 64'b1000000000000000000000000000000000000000000000000000000000000001;
        #10;
        $display("Test 1 - A = %b, B = %b, Y = %b c=%b", A, B, Y,cout); // Expected: Y = 0000000000000000

        $finish;
    end
endmodule
