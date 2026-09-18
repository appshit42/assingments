module subtractor4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] diff
);
    wire cout;
    wire [3:0] b_inv;
    assign b_inv = ~b;
    adder4 ADD_SUB (.a(a), .b(b_inv), .cin(1'b1), .sum(diff), .cout(cout));
endmodule