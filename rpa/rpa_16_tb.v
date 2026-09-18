module rpa_16_tb;

    reg  [15:0] a, b;
    reg         cin;

    wire [15:0] sum;
    wire        cout;

    rpa_16 uut(a, b, cin, sum, cout);

    initial begin

        $dumpfile("rpa_16.vcd");
        $dumpvars(0, rpa_16_tb);

        $monitor("Time=%0t A=%h B=%h Cin=%b | Sum=%h Carry=%b",
                 $time, a, b, cin, sum, cout);

        // Addition
        cin = 0;
        a = 16'h0066;
        b = 16'h00CC;
        #10;

        a = 16'h00EE;
        b = 16'h0088;
        #10;

        // Subtraction
        cin = 1;
        a = 16'h0077;
        b = 16'h0033;
        #10;

        a = 16'h0022;
        b = 16'h0011;
        #10;

        $finish;
    end

endmodule
