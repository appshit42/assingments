
module round_key_tb;

    reg  [127:0] in;
    wire [127:0] out;

    mixcolumns dut (
        .in(in),
        .out(out)
    );

    initial begin
        $dumpfile("mixcolumns.vcd");
        $dumpvars(0, mixcolumns_tb);

        // Test input
        in = 128'h00112233445566778899aabbccddeeff;

        #10;
        $display("Time=%0t in=%h out=%h", $time, in, out);

        #10;
        $finish;
    end

endmodule
