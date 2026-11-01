`timescale 1ns/1ps

module terminal_counter_tb;

reg clk;
reg rst;
reg [3:0] terminal_count;

wire [3:0] count;
wire timer_done;

terminal_counter dut (
    .clk(clk),
    .rst(rst),
    .terminal_count(terminal_count),
    .count(count),
    .timer_done(timer_done)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Reset
initial begin
    rst = 1;
    terminal_count = 4'd5;

    #12;
    rst = 0;

    // First test: terminal count = 5
    #70;

    // Second test: terminal count = 9
    terminal_count = 4'd9;

    #120;
    $finish;
end

// Waveform generation
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, terminal_counter_tb);
end

// Monitor
initial begin
    $monitor("Time=%0t | Reset=%b | Terminal=%d | Count=%d | Done=%b",
             $time, rst, terminal_count, count, timer_done);
end

endmodule