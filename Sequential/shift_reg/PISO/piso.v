module piso(
    input clk,
    input load,
    input [3:0] din,
    output wire sout
);

    reg [3:0] q;

    always @(posedge clk) begin
        if (load)
            q <= din;
        else
            q <= {q[2:0], 1'b0};        // This means the following: If we are getting the serial output, we select the first 3 indices of the input, and oncatenate it with a '0' using the {} braces.
    end
        assign sout = q[3];             //Now, we assign the MSB as the continuous output.  
endmodule