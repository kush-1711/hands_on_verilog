module piso_tb;

reg clk;
reg load;
reg [3:0] din;
wire sout;

piso dut(
    .clk(clk),
    .load(load),
    .din(din),
    .sout(sout)
);

always #5 clk = ~clk;

    initial begin
        $dumpfile("piso.vcd");
        $dumpvars(0, piso_tb);


        clk = 0;
        load = 0;
        din = 4'b0000;
        #10;

        load = 1;
        din = 1011;
        #10;

        load = 0;
        #40;

        $finish;
    end
endmodule
