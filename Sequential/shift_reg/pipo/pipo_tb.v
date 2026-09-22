module pipo_tb;

    reg clk;
    reg [3:0] din;
    wire [3:0] q;

    pipo dut (
        .clk(clk),
        .din(din),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("pipo.vcd");
        $dumpvars(0, pipo_tb);
        clk = 0;
        din = 4'b0000;

        #10
        din = 4'b1111;
        #10
        $finish;

    end
endmodule