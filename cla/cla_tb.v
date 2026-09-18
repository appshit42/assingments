`timescale 1ns/1ps

module cla_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg        cin;

    wire [3:0] s;
    wire       carry;

    // Instantiate CLA
    cla uut (
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .carry(carry)
    );

    initial begin

        // Waveform
        $dumpfile("cla.vcd");
        $dumpvars(0, cla_tb);

        // Monitor outputs
        $monitor("Time=%0t | A=%b | B=%b | Cin=%b | Sum=%b | Carry=%b",
                 $time, a, b, cin, sum, carry);

        // Test 1
        a = 4'b0000;
        b = 4'b0000;
        cin = 0;
        #10;

        // Test 2
        a = 4'b0110;
        b = 4'b1100;
        cin = 0;
        #10;

        // Test 3
        a = 4'b1110;
        b = 4'b1000;
        cin = 0;
        #10;

        // Test 4
        a = 4'b0111;
        b = 4'b1110;
        cin = 0;
        #10;

        // Test 5
        a = 4'b0010;
        b = 4'b1001;
        cin = 0;
        #10;

        // Test 6
        a = 4'b1111;
        b = 4'b0001;
        cin = 0;
        #10;

        // Test 7 - Carry input
        a = 4'b1111;
        b = 4'b0001;
        cin = 1;
        #10;

        // Test 8
        a = 4'b1111;
        b = 4'b0000;
        cin = 1;
        #10;

        // Test 9
        a = 4'b1111;
        b = 4'b1111;
        cin = 1;
        #10;

        $finish;
    end

endmodule