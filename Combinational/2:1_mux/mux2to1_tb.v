module mux2to1_tb;

    reg a;
    reg b;
    reg s;

    wire y;

    mux_2to1 dut (
        .a(a),
        .b(b),
        .s(s),
        .y(y)
    );

        initial begin
        $dumpfile("mux2to1.vcd");
        $dumpvars(0, mux2to1_tb);
        a = 0;
        b = 0;
        s = 0;
        #10;

        a = 1;
        b = 0;
        s = 0;
        #10;

        a = 0;
        b = 0;
        s = 1;
        #10;

        a = 0;
        b = 1;
        s = 1;
        #10;

        a = 1;
        b = 1;
        s = 1;
        #10;
        
        $finish;

    end
endmodule
