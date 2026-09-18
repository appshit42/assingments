module rpa_16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);

    wire [16:0] carry;

    assign carry[0] = cin;
    
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : rca
            full_adder fa (
                .a    (a[i]),
                .b    (~b[i]+1),
                .cin  (carry[i]),
                .sum  (sum[i]),
                .cout (carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[16];

endmodule


module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
