module mux4to1_tb;

    reg a;
    reg b;
    reg c;
    reg d;

    reg s0;
    reg s1;

    wire y;

    integer i;

    // DUT
    mux4to1 dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s0(s0),
        .s1(s1),
        .y(y)
    );

    initial begin

        $dumpfile("4to1mux.vcd");
        $dumpvars(0, mux4to1_tb);

        a = 0;
        b = 1;
        c = 0;
        d = 1;

        for (i = 0; i < 4; i = i + 1) begin

            s1 = i / 2;
            s0 = i % 2;

            #10;

        end

        $finish;

    end

endmodule