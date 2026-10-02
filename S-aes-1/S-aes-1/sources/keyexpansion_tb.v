module keyexpansion_tb();

    reg        clk;
    reg [15:0] MASTERKEY;

    wire [15:0] k0;
    wire [15:0] k1;
    wire [15:0] k2;

    // Instantiate DUT
    keyexpansion uut (
        .clk       (clk),
        .MASTERKEY (MASTERKEY),
        .k0        (k0),
        .k1        (k1),
        .k2        (k2)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("keyexpansion.vcd");
        $dumpvars(0, keyexpansion_tb);

        // Initialize clock
        clk = 1'b0;

        // 16-bit master key
        MASTERKEY = 16'h0010;

        // Wait for key expansion
        #10;

        $display("Time=%0t", $time);
        $display("MASTERKEY = %h", MASTERKEY);
        $display("k0        = %h", k0);
        $display("k1        = %h", k1);
        $display("k2        = %h", k2);

        #20;

        $finish;
    end

endmodule
