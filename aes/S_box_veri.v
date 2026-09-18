`timescale 1ns / 1ps

module S_box_veri (
    input wire clk,
    input wire [15:0] in,
    output wire [15:0] out
);

    // Nibble 0 (Bits 3:0)
    blk_mem_gen_0 nibble_0 (
        .clka (clk),
        .addra (in[3:0]),
        .douta (out[3:0])
    );

    // Nibble 1 (Bits 7:4)
    blk_mem_gen_0 nibble_1 (
        .clka (clk),
        .addra (in[7:4]),
        .douta (out[7:4])
    );

    // Nibble 2 (Bits 11:8)
    blk_mem_gen_0 nibble_2 (
        .clka (clk),
        .addra (out[11:8])
    );

    // Nibble 3 (Bits 15:12)
    blk_mem_gen_0 nibble_3 (
        .clka (clk),
        .addra (in[15:12]),
        .douta (out[15:12])
    );

endmodule
