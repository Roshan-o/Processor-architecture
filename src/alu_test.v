`include "alu.v"

//0-AND
//1-OR
//2-ADD
//3-SLL
//4-SRL
//5-SRA
//6-SUB
//7-SLTU
//8-SLT
//9-XOR


module alu_tb;
    reg [63:0] a, b;
    reg [3:0] alu_control1;
    wire [63:0] out;
    alu uut(
        .a(a),
        .b(b),
        .alu_control(alu_control1),
        .out(out)
    );
    initial begin
        $monitor("a = %b, b = %b, alu_control = %b, out = %b", a, b, alu_control1, out); 
        // Test Case 1: AND
        a = 64'd2;
        b = 64'd1;
        alu_control1 = 4'b0000;
        #10;
        // Test Case 2: OR
        a = 64'b010;
        b = 64'b001;
        alu_control1 = 4'b0001;
        #10;
        // Test Case 3: ADD
        a = 64'd4;
        b = 64'd2;
        alu_control1 = 4'b0010;
        // Test Case 4: SLL
        a = 64'd2;
        b = 64'd1;
        alu_control1 = 4'd3;
        #10;
        // Test Case 5: SRL
        a = 64'd13;
        b = 64'd3;
        alu_control1 = 4'd4;
        #10;
        // Test Case 6: SRA
        a = -64'd13;
        b = 64'd3;
        alu_control1 = 4'd5;
        #10;
        // Test Case 7: SUB
        a = -64'd13;
        b = 64'd3;
        alu_control1 = 4'd6;
        #10;
        // Test Case 8: SLTU
        a = 64'd13;
        b = 64'd43;
        alu_control1 = 4'd7;
        #10;
        // Test Case 9: SLT
        a = -64'd13;
        b = 64'd3;
        alu_control1 = 4'd8;
        #10;
        // Test Case 10: XOR
        a = 64'd13;
        b = 64'd3;
        alu_control1 = 4'd9;
        #10;
        $finish;
    end
endmodule