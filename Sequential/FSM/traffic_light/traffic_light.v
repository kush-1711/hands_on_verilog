module traffic_light(
    input clk,
    input rst,
    output reg A_R, A_Y, A_G,
    output reg B_R, B_Y, B_G   // <-- Removed trailing comma here
);

localparam s0 = 2'b00,
           s1 = 2'b01,
           s2 = 2'b10,
           s3 = 2'b11;
reg [1:0] state;
reg [1:0] next_state;


always @ (posedge clk or posedge rst) begin
    if(rst)
        state <= s0;
    else 
        state <= next_state;
end

always @(*) begin
    case(state)
        s0: next_state = s1;
        s1: next_state = s2;
        s2: next_state = s3;
        s3: next_state = s0;
        default: next_state = s0;
    endcase
end

always @(*) begin
    case(state)
        s0: begin
            A_R = 0;
            A_Y = 0;
            A_G = 1;
            B_R = 1;
            B_Y = 0;
            B_G = 0;
        end

        s1: begin
            A_R = 0;
            A_Y = 1;
            A_G = 0;
            B_R = 1;
            B_Y = 0;
            B_G = 0;
        end

        s2: begin
            A_R = 1;
            A_Y = 0;
            A_G = 0;
            B_R = 0;
            B_Y = 0;
            B_G = 1;
        end

        s3: begin
            A_R = 1;
            A_Y = 0;
            A_G = 0;
            B_R = 0;
            B_Y = 1;
            B_G = 0;
        end

        default: begin
            A_R = 0;
            A_Y = 0;
            A_G = 1;
            B_R = 1;
            B_Y = 0;
            B_G = 0;
        end
    endcase
end  // <-- Added missing 'end' to close the always block

endmodule