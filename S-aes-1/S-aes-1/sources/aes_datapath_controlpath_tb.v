
module aes_datapath_controlpath_tb();

    reg         clk;
    reg         rst_n;
    reg         start;
    reg [15:0]  plaintext;

    wire [15:0] ciphertext;
    wire        done;

    aes_datapath_controlpath uut (
        .clk       (clk),
        .rst_n     (rst_n),
        .start     (start),
        .plaintext (plaintext),
        .ciphertext(ciphertext)
    );

    // 10 ns clock period
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("aes_datapath_controlpath.vcd");
        $dumpvars(0, aes_datapath_controlpath_tb);

        // Initial values
        clk       = 1'b0;
        rst_n     = 1'b0;
        start     = 1'b0;
        plaintext = 16'h1234;

        // Apply reset
        #10;
        rst_n = 1'b1;

        // Start AES operation
        #10;
        start = 1'b1;

        #10;
        start = 1'b0;

        // Display values while the operation is running
        $display("Time=%0t pt=%h ct=%h ",
                 $time, plaintext, ciphertext);

        // Wait until AES operation is complete
        wait(done);

        // Display final result
        $display("Time=%0t pt=%h ct=%h ",
                 $time, plaintext, ciphertext);

        #10;
        $finish;
    end

endmodule

