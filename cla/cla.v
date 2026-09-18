module cla (
    input  [3:0] a,
    input  [3:0] b,
    input          cin,
    output [3:0] s,
    output         carry
);

    wire [3:0] p;
    wire [3:0] g;
    wire [4:0] c;

    assign c[0] = cin;

    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) begin
            assign p[i] = a[i] ^ b[i];
            assign g[i] = a[i] & b[i];
            assign s[i] = p[i] ^ c[i];
        end
    endgenerate
     assign c[1] = g[0] |
                  (p[0] & c[0]);

    assign c[2] = g[1] |
                  (p[1] & g[0]) |
                  (p[1] & p[0] & c[0]);

    assign c[3] = g[2] |
                  (p[2] & g[1]) |
                  (p[2] & p[1] & g[0]) |
                  (p[2] & p[1] & p[0] & c[0]);

    assign c[4] = g[3] |
                  (p[3] & g[2]) |
                  (p[3] & p[2] & g[1]) |
                  (p[3] & p[2] & p[1] & g[0]) |
                  (p[3] & p[2] & p[1] & p[0] & c[0]);

    assign carry = c[4];

endmodule

