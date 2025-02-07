`include "sra.v"
module shift_right_arthmatic_tb;
    reg[63:0] A2;
    reg[63:0] B2;
    wire[63:0] Y2;

    SRA uut(
        .A(A2),
        .B(B2),
        .Y(Y2)
    );
    initial begin
        $monitor("A = %b,Y = %b", A2, Y2);
        A2 = -64'd13;
        B2 = 64'd3;
        #10;
        $finish;
    end
endmodule