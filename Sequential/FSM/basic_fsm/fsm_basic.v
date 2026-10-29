module fsm_basic(
    input clk,
    input rst,
    output reg [1:0] state
);

localparam s0 = 2'b00,
            s1 = 2'b01,
            s2 = 2'b10;
    always@(posedge clk) begin
            if(rst)
                state <= s0;
            else
                case(state)
                    s0: state <= s1;
                    s1: state <= s2;
                    s2: state <= s0;
                    default: state <= s0;
                endcase
            end
endmodule

