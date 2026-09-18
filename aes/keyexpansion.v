module keyexpansion(input clk,input [15:0] MASTERKEY , output [15:0] k0,k1,k2);

    wire [15:0] k0, k1, k2;
    wire [15:0] MASTERKEY = 16'h2D65; 

    wire [7:0] w0, w1, w2, w3, w4, w5;
    wire [15:0] s_box1, s_box2;

    localparam [7:0] rcon1 = 8'h80;
    localparam [7:0] rcon2 = 8'h30;

    // Initial key
    assign k0 = MASTERKEY;

    // Split master key into two 8-bit words
    assign w0 = MASTERKEY[15:8];
    assign w1 = MASTERKEY[7:0];

    // First round
    sbox sbox_inst1 (
        .clk(clk),
        .in({w1[3:0], w1[7:4]}),
        .out(s_box1)
    );

    assign w2 = w0 ^ rcon1 ^ s_box1[15:8];
    assign w3 = w2 ^ w1;

    assign k1 = {w2, w3};

    // Second round
    sbox sbox_inst2 (
        .clk(clk),
        .in({w3[3:0], w3[7:4]}),
        .out(s_box2)
    );

    assign w4 = w2 ^ rcon2 ^ s_box2[15:8];
    assign w5 = w4 ^ w3;

    assign k2 = {w4, w5};

endmodule
