
`timescale 1ns / 1ps

module aes_controller_tb;

    reg clk;
    reg rst_n;
    reg start;

    wire       top_mux_sel;
    wire       bottom_mux_sel;
    wire       datareg_en;
    wire       outreg_en;
    wire [1:0] key_sel;
    wire       done;

    // =========================================================
    // DUT - AES Controller
    // =========================================================

    aes_controller uut (
        .clk            (clk),
        .rst_n          (rst_n),
        .start          (start),

        .top_mux_sel    (top_mux_sel),
        .bottom_mux_sel (bottom_mux_sel),
        .datareg_en     (datareg_en),
        .outreg_en      (outreg_en),
        .key_sel        (key_sel)

        
    );


    // =========================================================
    // 100 MHz CLOCK
    // 10 ns period
    // =========================================================

    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end


    // =========================================================
    // TEST SEQUENCE
    // =========================================================

    initial begin

        // VCD waveform
        $dumpfile("aes_controller.vcd");
        $dumpvars(0, aes_controller_tb);

        // Initial values
        rst_n = 1'b0;
        start = 1'b0;

        // -----------------------------------------------------
        // RESET
        // -----------------------------------------------------

        #20;

        rst_n = 1'b1;

        $display("");
        $display("==============================================");
        $display("RESET RELEASED");
        $display("Time = %0t", $time);
        $display("==============================================");


        // -----------------------------------------------------
        // START AES
        // -----------------------------------------------------

        #10;

        // Start asserted for exactly one clock
        start = 1'b1;

        $display("");
        $display("Time=%0t | START asserted", $time);

        #10;

        start = 1'b0;

        $display("Time=%0t | START deasserted", $time);


        // -----------------------------------------------------
        // WAIT FOR DONE
        // -----------------------------------------------------

        wait(done == 1'b1);


        // -----------------------------------------------------
        // OPERATION COMPLETE
        // -----------------------------------------------------

        $display("");
        $display("==============================================");
        $display("           AES OPERATION COMPLETE");
        $display("==============================================");

        $display("Time           = %0t", $time);
        $display("top_mux_sel    = %b", top_mux_sel);
        $display("bottom_mux_sel = %b", bottom_mux_sel);
        $display("datareg_en     = %b", datareg_en);
        $display("outreg_en      = %b", outreg_en);
        $display("key_sel        = %b", key_sel);

        $display("==============================================");


        // Allow a few more clocks
        #20;

        $finish;

    end


    // =========================================================
    // CONTROLLER SIGNAL MONITOR
    // =========================================================

    always @(posedge clk) begin

        $display(
            "Time=%0t | START=%b | TOP=%b | BOTTOM=%b | DATA_EN=%b | OUT_EN=%b | KEY_SEL=%b ",
            $time,
            start,
            top_mux_sel,
            bottom_mux_sel,
            datareg_en,
            outreg_en,
            key_sel
            
        );

    end


    // =========================================================
    // SAFETY TIMEOUT
    // =========================================================

    initial begin

        #5000;

        $display("");
        $display("==============================================");
        $display("ERROR: TIMEOUT");
        $display("DONE DID NOT ASSERT");
        $display("==============================================");

        $finish;

    end

endmodule

