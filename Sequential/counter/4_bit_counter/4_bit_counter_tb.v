`timescale 1ns/1ps

module counter_tb;

reg clk;
reg rst;
wire [3:0] count;

counter dut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset
initial begin
    rst = 1;
    #12;
    rst = 0;
end

// Waveform
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, counter_tb);
end

// Monitor
initial begin
    $monitor("Time=%0t | Reset=%b | Count=%d | Binary=%b",
              $time, rst, count, count);
end

// Simulation termination
initial begin
    #180;
    $finish;
end

endmodule