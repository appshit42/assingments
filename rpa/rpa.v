module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout 
);

    wire c1, c2, c3;

    xor(c1, a, b);
    xor(sum, c1, cin);

    and(c2, a, b);
    and(c3, cin, c1);
    or(carry, c2, c3);

endmodule

module rpa(
    input  [7:0] a,
    input  [7:0] b,
    input        cin,
    output [7:0]sum,
    output       carry
);

    wire [7:0] c;
    

    

    full_adder ad0(a[0],~b[0]+1, cin ,  sum[0], c[0]);
    full_adder ad1(a[1], ~b[1]+1, c[0], sum[1], c[1]);
    full_adder ad2(a[2], ~b[2]+1, c[1],sum[2], c[2]);
    full_adder ad3(a[3], ~b[3]+1, c[2], sum[3], c[3]);
    full_adder ad4(a[4], ~b[4]+1, c[3], sum[4], c[4]);
    full_adder ad5(a[5], ~b[5]+1, c[4], sum[5], c[5]);
    full_adder ad6(a[6], ~b[6]+1, c[5],sum[6], c[6]);
    full_adder ad7(a[7], ~b[7]+1, c[6], sum[7], carry);


endmodule
