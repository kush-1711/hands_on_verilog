module pipo (
    input wire clk,
    input wire [3:0] din,
    output reg [3:0] q
);

    always @(posedge clk) begin
        q <= din;       // This is not a comparison operator, it is non blocking assignment. 
    end
endmodule