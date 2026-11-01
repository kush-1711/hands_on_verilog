module terminal_counter(
    input clk,
    input rst,
    input [3:0] terminal_count,
    output reg [3:0] count,
    output reg timer_done
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 4'b0000;
        timer_done <= 1'b0;
    end

    else if (count == terminal_count) begin
        count <= 4'b0000;
        timer_done <= 1'b1;
    end

    else begin
        count <= count + 1'b1;
        timer_done <= 1'b0;
    end
end

endmodule