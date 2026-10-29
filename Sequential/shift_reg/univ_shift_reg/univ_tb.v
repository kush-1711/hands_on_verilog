`timescale 1ns/1ps

module univ_tb;

    reg clk;
    reg [1:0] mode;
    reg [3:0] pin;
    reg sinright;
    reg sinleft;
    reg rst;

    wire [3:0] sout;

    // Instantiate the DUT
    univ dut (
        .clk(clk),
        .mode(mode),
        .pin(pin),
        .sinright(sinright),
        .sinleft(sinleft),
        .rst(rst),
        .sout(sout)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("univ.vcd");
        $dumpvars(0, univ_tb);
        // Initialize inputs
        clk = 0;
        rst = 1;
        mode = 2'b00;
        pin = 4'b0000;
        sinright = 0;
        sinleft = 0;

        // Reset
        #10;
        rst = 0;

        // Parallel load: load 1011
        mode = 2'b11;
        pin = 4'b1011;
        #10;

        // Shift right
        mode = 2'b01;
        sinright = 1;
        #10;

        // Shift right again
        sinright = 0;
        #10;

        // Parallel load: load 1100
        mode = 2'b11;
        pin = 4'b1100;
        #10;

        // Shift left
        mode = 2'b10;
        sinleft = 1;
        #10;

        // Shift left again
        sinleft = 0;
        #10;

        // Hold
        mode = 2'b00;
        #20;

        $finish;
    end

endmodule