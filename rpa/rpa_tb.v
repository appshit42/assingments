module rpa_tb;

    reg [7:0] a, b;
    reg cin;

    wire [7:0] sum;
    wire cout;

    rpa uut(a, b, cin, sum, cout);

    initial begin

        $dumpfile("rpa.vcd");
        $dumpvars(0, rpa_tb);

        $monitor("Time=%0t A=%b B=%b Cin=%b | Sum=%b Carry=%b",
                 $time, a, b, cin, sum, cout);

        cin = 0;

        // Test 1
        a = 8'b01100110;
        b = 8'b11001100;
        #10;

        // Test 2
        a = 8'b11101110;
        b = 8'b10001000;
        #10;

        // Test 3
        a = 8'b01110111;
        b = 8'b11101110;
        #10;

        // Test 4
        a = 8'b00100010;
        b = 8'b10011001;
        #10;

        // Test 5
        a = 8'b11111111;
        b = 8'b00000001;
        #10;

        $finish;
    end

endmodule
