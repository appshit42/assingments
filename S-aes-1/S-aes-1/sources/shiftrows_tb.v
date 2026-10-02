module shiftrows_tb();

    reg  [15:0] in;
    wire [15:0] out;

    // Instantiate DUT
    shiftrows uut (
        .in  (in),
        .out (out)
    );

    initial begin
        $dumpfile("shiftrows.vcd");
        $dumpvars(0, shiftrows_tb);

        // Test input
        in = 16'h1234;

        #10;

        $display("Time=%0t", $time);
        $display("Input  = %h", in);
        $display("Output = %h", out);

        #10;
        $finish;
    end

endmodule