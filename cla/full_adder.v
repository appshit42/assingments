module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output carry
);

    wire c1, c2, c3;

    xor(c1, a, b);
    xor(sum, c1, cin);

    and(c2, a, b);
    and(c3, cin, c1);
    or(carry, c2, c3);

endmodule
