module jk_ff_tb;

    reg J;
    reg K;
    reg clk;
    wire Q;

    jk_ff dut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q)
    );

    initial begin
        $dumpfile("jk_ff.vcd");
        $dumpvars(0, jk_ff_tb);

        clk = 0;
        J = 0;
        K = 0;

        #10;

        J = 0;
        K = 1;

        #10;

        J = 1;
        K = 0;

        #10;

        J = 1;
        K = 1;

        #20;

        $finish;
    end

    always #5 clk = ~clk;

endmodule