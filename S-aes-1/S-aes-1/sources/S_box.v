`timescale 1ns / 1ps

module S_box (
    input wire clk,
    input wire [15:0] a,
    output wire [15:0] b
);

    // Nibble 0 (Bits 3:0)
    blk_mem_gen_0 nibble_0 (
        .clka (clk),
        .addra (a[3:0]),
        .douta (b[3:0])
    );

    // Nibble 1 (Bits 7:4)
    blk_mem_gen_0 nibble_1 (
        .clka (clk),
        .addra (a[7:4]),
        .douta (b[7:4])
    );

    // Nibble 2 (Bits 11:8)
    blk_mem_gen_0 nibble_2 (
        .clka (clk),
        .addra (a[11:8]),
        .douta (b[11:8])
    );

    // Nibble 3 (Bits 15:12)
    blk_mem_gen_0 nibble_3 (
        .clka (clk),
        .addra (a[15:12]),
        .douta (b[15:12])
    );

endmodule
