module univ(
    input clk,
    input [1:0] mode,
    input [3:0] pin,
    input sinleft,
    input sinright,
    input rst,
    output  reg [3:0] sout
);

always@(posedge clk) begin
    if(rst)
        sout <= 4'b0000;
    else
        case(mode)
            2'b00:  sout <= sout;
            2'b01:  sout <= {sinright, sout[3:1]};
            2'b10:  sout <= {sout[2:0], sinleft};
            2'b11:  sout <= pin;
            default: sout <= sout;
        endcase
    end
endmodule
            

