module round_key_tb;

    reg  [15:0] in;
    wire [15:0] out;

    round_key dut (
        .in  (in),
        .out (out)
    );

    initial begin
        $dumpfile("round_key.vcd");
        $dumpvars(0, round_key_tb);

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
