`include "slt.v"

module slt_test;

    reg [63:0] tb_A, tb_B;
    wire [63:0]tb_Y;

    // Instantiate the module
    SLT uut (
        .A(tb_A),  // Map testbench signals to module ports
        .B(tb_B),
        .Y(tb_Y)
    );

    initial begin
        // Test Case 1: A = 10, B = 5
        tb_A = 64'd10;
        tb_B = 64'd5;
        #10;
        $display("Test 1 - A = %d, B = %d, Y = %b", tb_A, tb_B, tb_Y); // Expected: Y = 0

        // Test Case 2: A = -5, B = 3
        tb_A = -64'd5;
        tb_B = 64'd3;
        #10;
        $display("Test 2 - A = %d, B = %d, Y = %b", tb_A, tb_B, tb_Y); // Expected: Y = 1

        // Test Case 3: A = -10, B = -20
        tb_A = -64'd10;
        tb_B = -64'd20;
        #10;
        $display("Test 3 - A = %d, B = %d, Y = %b", tb_A, tb_B, tb_Y); // Expected: Y = 0

        // Test Case 4: A = -10, B = -5
        tb_A = -64'd10;
        tb_B = -64'd5;
        #10;
        $display("Test 4 - A = %d, B = %d, Y = %b", tb_A, tb_B, tb_Y); // Expected: Y = 1

        $finish;
    end

endmodule
