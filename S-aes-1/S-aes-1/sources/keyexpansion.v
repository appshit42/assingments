
module keyexpansion (
    input        clk,
    input  [15:0] Masterkey,
    output [15:0] k0,
    output [15:0] k1,
    output [15:0] k2
);

    wire [7:0] w0, w1;
    wire [7:0] w2, w3;
    wire [7:0] w4, w5;

    wire [7:0] s_box1;
    wire [7:0] s_box2;

    wire [7:0] m1;
    wire [7:0] m2;

    localparam [7:0] rcon1 = 8'h80;
    localparam [7:0] rcon2 = 8'h30;

    // --------------------------------
    // Initial key
    // --------------------------------
    assign k0 = Masterkey;

    assign w0 = Masterkey[15:8];
    assign w1 = Masterkey[7:0];

    // --------------------------------
    // First round
    // RotWord
    // --------------------------------
    assign m1 = {w1[3:0], w1[7:4]};

    S_box sbox_inst1 (
        .clk (clk),
        .a   (m1),
        .b   (s_box1)
    );

    assign w2 = w0 ^ rcon1 ^ s_box1;
    assign w3 = w2 ^ w1;

    assign k1 = {w2, w3};

    // --------------------------------
    // Second round
    // --------------------------------
    assign m2 = {w3[3:0], w3[7:4]};

    S_box sbox_inst2 (
        .clk (clk),
        .a   (m2),
        .b   (s_box2)
    );

    assign w4 = w2 ^ rcon2 ^ s_box2;
    assign w5 = w4 ^ w3;

    assign k2 = {w4, w5};

endmodule

