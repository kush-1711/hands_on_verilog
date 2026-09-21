module full_adder_tb;

reg A;
reg B;
reg Cin;

wire Sum;
wire Cout;

full_adder dut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

integer a;
integer b;
integer cin;

initial begin

    $dumpfile("full_adder.vcd");
    $dumpvars(0, full_adder_tb);

    for (a = 0; a <= 1; a = a + 1) begin
        for (b = 0; b <= 1; b = b + 1) begin
            for (cin = 0; cin <= 1; cin = cin + 1) begin

                A = a;
                B = b;
                Cin = cin;

                #10;

                $display(
                    "A = %b B = %b Cin = %b | Sum = %b Cout = %b",
                    A, B, Cin, Sum, Cout
                );

            end
        end
    end

    $finish;

end

endmodule