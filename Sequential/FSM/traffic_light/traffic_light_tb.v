`timescale 1ns/1ps

module traffic_light_tb;

    // 1. Declare testbench signals
    reg clk;
    reg rst;

    wire A_R, A_Y, A_G;
    wire B_R, B_Y, B_G;

    // 2. Instantiate the DUT
    traffic_light dut (
        .clk(clk),
        .rst(rst),
        .A_R(A_R),
        .A_Y(A_Y),
        .A_G(A_G),
        .B_R(B_R),
        .B_Y(B_Y),
        .B_G(B_G)
    );

    // 3. Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 4. Reset generation
    initial begin
        rst = 1;
        #12;
        rst = 0;
    end

    // 5. Waveform generation
    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_tb);
    end

    // 6. Console logging
    initial begin
        $monitor(
            "Time=%0t | Reset=%b | State=%b | Next_State=%b | A(RYG)=%b%b%b | B(RYG)=%b%b%b",
            $time,
            rst,
            dut.state,
            dut.next_state,
            A_R, A_Y, A_G,
            B_R, B_Y, B_G
        );
    end

    // 7. Simulation termination
    initial begin
        #100;
        $display("Simulation completed.");
        $finish;
    end

endmodule