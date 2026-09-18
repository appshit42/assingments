`timescale 1ns/1ps

module cla_16_tb;

    reg  [7:0] a;
    reg  [7:0] b;
    reg        cin;

    wire [7:0] sum;
    wire       carry;

    // Instantiate CLA
    cla uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .carry(carry)
    );

    initial begin

        // Waveform
        $dumpfile("cla.vcd");
        $dumpvars(0, cla_tb);

        $monitor("Time=%0t | A=%b | B=%b | Cin=%b | Sum=%b | Carry=%b",
                 $time, a, b, cin, sum, carry);

        // Test 1
        a = 8'b00000000;
        b = 8'b00000000;
        cin = 0;
        #10;

        // Test 2
        a = 8'b01100110;
        b = 8'b11001100;
        cin = 0;
        #10;

        // Test 3
        a = 8'b11101110;
        b = 8'b10001000;
        cin = 0;
        #10;

        // Test 4
        a = 8'b01110111;
        b = 8'b11101110;
        cin = 0;
        #10;

        // Test 5
        a = 8'b00100010;
        b = 8'b10011001;
        cin = 0;
        #10;

        // Test 6
        a = 8'b11111111;
        b = 8'b00000001;
        cin = 0;
        #10;

        // Test 7 - Carry input
        a = 8'b00001111;
        b = 8'b00000001;
        cin = 1;
        #10;

        // Test 8
        a = 8'b11111111;
        b = 8'b00000000;
        cin = 1;
        #10;

        // Test 9
        a = 8'b11111111;
        b = 8'b11111111;
        cin = 1;
        #10;

        $finish;
    end

endmodule

