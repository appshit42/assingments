module aes_datapath_controlpath (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        start,
    input  wire [15:0] plaintext,

    input  wire [15:0] key0,
    input  wire [15:0] key1,
    input  wire [15:0] key2,

    output wire [15:0] ciphertext
    
);
    wire done;
    wire        top_mux_sel;
    wire        bottom_mux_sel;
    wire        datareg_en;
    wire        outreg_en;
    wire [1:0]  key_sel;

    // ------------------------------------------------------------
    // Controller
    // ------------------------------------------------------------

    aes_controller control_inst1 (
        .clk            (clk),
        .rst_n          (rst_n),
        .start          (start),

        .top_mux_sel    (top_mux_sel),
        .bottom_mux_sel (bottom_mux_sel),
        .datareg_en     (datareg_en),
        .outreg_en      (outreg_en),
        .key_sel        (key_sel)
    );

    // ------------------------------------------------------------
    // Datapath
    // ------------------------------------------------------------

    aes_datapath datapath_inst1 (
        .clk            (clk),
        .rst_n          (rst_n),
        .plaintext      (plaintext),

        .key0           (key0),
        .key1           (key1),
        .key2           (key2),

        .top_mux_sel    (top_mux_sel),
        .bottom_mux_sel (bottom_mux_sel),
        .datareg_en     (datareg_en),
        .outreg_en      (outreg_en),
        .key_sel        (key_sel),

        .ciphertext     (ciphertext)
    );

endmodule
