module aes_datapath (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [15:0] plaintext,

    input  wire [15:0] key0,
    input  wire [15:0] key1,
    input  wire [15:0] key2,

    input  wire        top_mux_sel,
    input  wire        bottom_mux_sel,
    input  wire        datareg_en,
    input  wire        outreg_en,
    input  wire [1:0]  key_sel,

    output wire [15:0] ciphertext
);

    wire [15:0] initial_xor;
    wire [15:0] top_mux_out;

    wire [15:0] subbytes_out;
    wire [15:0] shiftrows_out;
    wire [15:0] mixcolumns_out;

    wire [15:0] bottom_mux_out;
    wire [15:0] final_xor;
    wire [15:0] selected_key;

    reg [15:0] data_reg;
    reg [15:0] out_reg;

    // ------------------------------------------------------------
    // Initial AddRoundKey
    // ------------------------------------------------------------

    assign initial_xor = plaintext ^ key0;

    // ------------------------------------------------------------
    // Key Selection
    // ------------------------------------------------------------

    assign selected_key =
        (key_sel == 2'b00) ? key0 :
        (key_sel == 2'b01) ? key1 :
        (key_sel == 2'b10) ? key2 :
                             16'h0000;

    // ------------------------------------------------------------
    // Top MUX
    // ------------------------------------------------------------

    assign top_mux_out =
        (top_mux_sel == 1'b0) ? initial_xor :
                                final_xor;

    // ------------------------------------------------------------
    // Data Register
    // ------------------------------------------------------------

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_reg <= 16'h0000;
        else if (datareg_en)
            data_reg <= top_mux_out;
    end

    // ------------------------------------------------------------
    // SubBytes
    // ------------------------------------------------------------

    S_box sbox_inst (
        .a  (data_reg),
        .b (subbytes_out)
    );

    // ------------------------------------------------------------
    // ShiftRows
    // ------------------------------------------------------------

    shiftrows shiftrows_inst (
        .in  (subbytes_out),
        .out (shiftrows_out)
    );

    // ------------------------------------------------------------
    // MixColumns
    // ------------------------------------------------------------

    mixcolumns mixcolumns_inst (
        .in  (shiftrows_out),
        .out (mixcolumns_out)
    );

    // ------------------------------------------------------------
    // Bottom MUX
    // ------------------------------------------------------------

    assign bottom_mux_out =
        (bottom_mux_sel == 1'b0) ? mixcolumns_out :
                                   shiftrows_out;

    // ------------------------------------------------------------
    // AddRoundKey
    // ------------------------------------------------------------

    assign final_xor = bottom_mux_out ^ selected_key;

    // ------------------------------------------------------------
    // Output Register
    // ------------------------------------------------------------

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            out_reg <= 16'h0000;
        else if (outreg_en)
            out_reg <= final_xor;
    end

    assign ciphertext = out_reg;

endmodule
