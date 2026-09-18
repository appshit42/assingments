module top_module(
    input  [3:0] seed,
    input        rst,
    input        sel,
    input        clk,
    output [3:0] state
);

    wire w1int, w2int, w3int, w4int;
    wire clk_slow;
    wire w1, w2, w3, w4, w5;

    CLKdiv clkdiv(
        .clk(clk),
        .clk_1(clk_slow)
    );

    assign w1 = w4 ^ w5;

    mux muxp0(
        .clk_1(clk_slow),
        .sel(sel),
        .in(seed[3]),
        .w(w1),
        .q(w1int)
    );

    mux muxp1(
        .clk_1(clk_slow),
        .sel(sel),
        .in(seed[2]),
        .w(w2),
        .q(w2int)
    );

    mux muxp2(
        .clk_1(clk_slow),
        .sel(sel),
        .in(seed[1]),
        .w(w3),
        .q(w3int)
    );

    mux muxp3(
        .clk_1(clk_slow),
        .sel(sel),
        .in(seed[0]),
        .w(w4),
        .q(w4int)
    );

    dff d3(
        .clk_1(clk_slow),
        .reset(rst),
        .in(w1int),
        .o(w2)
    );

    dff d2(
        .clk_1(clk_slow),
        .reset(rst),
        .in(w2int),
        .o(w3)
    );

    dff d1(
        .clk_1(clk_slow),
        .reset(rst),
        .in(w3int),
        .o(w4)
    );

    dff d0(
        .clk_1(clk_slow),
        .reset(rst),
        .in(w4int),
        .o(w5)
    );

    assign state = {w2, w3, w4, w5};

endmodule




