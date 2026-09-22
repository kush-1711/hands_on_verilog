module pipo (
    input wire clk,
    input wire [3:0] din,
    output reg [3:0] q
);

    always @(posedge clk) begin
        q <= din;
    end
endmodule