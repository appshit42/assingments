
module aes_datapath_tb;

    reg         clk;
    reg         rst_n;
    reg [15:0]  plaintext;

    reg         top_mux_sel;
    reg         bottom_mux_sel;
    reg         datareg_en;
    reg         outreg_en;
    reg [1:0]   key_sel;

    wire [15:0] ciphertext;

    // Instantiate DUT
    aes_datapath uut (
        .clk            (clk),
        .rst_n          (rst_n),
        .plaintext      (plaintext),
        .top_mux_sel    (top_mux_sel),
        .bottom_mux_sel (bottom_mux_sel),
        .datareg_en     (datareg_en),
        .outreg_en      (outreg_en),
        .key_sel        (key_sel),
        .ciphertext     (ciphertext)
    );

    // 10 ns clock period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        // VCD waveform
        $dumpfile("aes_datapath.vcd");
        $dumpvars(0, aes_datapath_tb);

        // Initial values
        rst_n          = 1'b0;
        plaintext      = 16'h0011;

        top_mux_sel    = 1'b0;
        bottom_mux_sel = 1'b0;
        datareg_en     = 1'b0;
        outreg_en      = 1'b0;
        key_sel        = 2'b00;

        // -------------------------
        // Reset
        // -------------------------
        #10;
        rst_n = 1'b1;

        $display("Time=%0t | Reset released | PT=%h | CT=%h",
                 $time, plaintext, ciphertext);

        // -------------------------
        // Load plaintext into datapath
        // -------------------------
        #10;
        top_mux_sel    = 1'b1;
        bottom_mux_sel = 1'b1;
        datareg_en    = 1'b1;

        $display("Time=%0t | Loading plaintext | PT=%h | CT=%h",
                 $time, plaintext, ciphertext);

        // -------------------------
        // Disable data register
        // Enable output register
        // -------------------------
        #10;
        datareg_en    = 1'b0;
        outreg_en     = 1'b1;

        $display("Time=%0t | Output register enabled | PT=%h | CT=%h",
                 $time, plaintext, ciphertext);

        // -------------------------
        // Disable output register
        // -------------------------
        #10;
        outreg_en = 1'b0;

        // -------------------------
        // Final result
        // -------------------------
        #10;
        $display("Time=%0t | FINAL RESULT | PT=%h | CT=%h",
                 $time, plaintext, ciphertext);

        $finish;
    end

endmodule
