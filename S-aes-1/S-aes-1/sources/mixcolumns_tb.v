module mixcolumns_tb;

    reg  [15:0] in;
    wire [15:0] out;

    mixcolumns dut (
        .in  (in),
        .out (out)
    );

    initial begin
        $dumpfile("mixcolumns.vcd");
        $dumpvars(0, mixcolumns_tb);

        in = 16'h0000;
        #10;
        $display("in=%h out=%h", in, out);

        in = 16'h1234;
        #10;
        $display("in=%h out=%h", in, out);

        in = 16'hffff;
        #10;
        $display("in=%h out=%h", in, out);

        in = 16'haabb;
        #10;
        $display("in=%h out=%h", in, out);

        $finish;
    end

endmodule
