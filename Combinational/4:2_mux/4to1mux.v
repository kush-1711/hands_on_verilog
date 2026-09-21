module mux4to1 (

    input a,
    input b,
    input c,
    input d,
    input s0,
    input s1,
    output y
);

assign y =  (s0 == 0 && s1 == 0) ? a :
            (s0 == 0 && s1 == 1) ? b :
            (s0 == 1 && s0 == 0) ? c :
                                   d;
endmodule