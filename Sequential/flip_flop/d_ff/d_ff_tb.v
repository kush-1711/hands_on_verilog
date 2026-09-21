module d_ff_tb;

reg clk;
reg d;
wire q;

d_ff dut (
    .clk(clk),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    d = 0;

    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;

    #10 $finish;
end

initial begin
    $dumpfile("d_ff.vcd");
    $dumpvars(0, d_ff_tb);
end
endmodule