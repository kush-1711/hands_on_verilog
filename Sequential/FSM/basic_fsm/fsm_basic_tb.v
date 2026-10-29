`timescale 1ns/1ps

module fsm_basic_tb;

    reg clk;
    reg rst;
    wire [1:0] state;

    // Instantiate the DUT
    fsm_basic dut (
        .clk(clk),
        .rst(rst),
        .state(state)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Generate waveform
        $dumpfile("basic_fsm.vcd");
        $dumpvars(0, fsm_basic_tb);

        // Initialize signals
        clk = 0;
        rst = 1;

        // Hold reset for 10 ns
        #10;
        rst = 0;

        // Allow FSM to run for 40 ns
        #40;

        // End simulation
        $finish;
    end

endmodule