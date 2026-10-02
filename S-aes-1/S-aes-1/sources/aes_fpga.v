module aes_fpga (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start,
    input  wire [15:0] plaintext,
    output wire [15:0] ciphertext
);

    wire [15:0] k0;
    wire [15:0] k1;
    wire [15:0] k2;

    parameter [15:0] MASTERKEY = 16'h2D65;

    keyexpansion key_exp_inst (
        .clk       (clk),
        .Masterkey (MASTERKEY),
        .k0        (k0),
        .k1        (k1),
        .k2        (k2)
    );

    aes_datapath_controlpath aes_top (
        .clk        (clk),
        .rst_n      (rst_n),
        .start      (start),
        .plaintext  (plaintext),
        .key0       (k0),
        .key1       (k1),
        .key2       (k2),
        .ciphertext (ciphertext)
    );

endmodule