
module mux(
    input      clk_1,
    input      sel,
    input      in,
    input      w,
    output reg q
);

    always @(posedge clk_1) begin
        case (sel)
            1'b0: q <= in;
            1'b1: q <= w;
        endcase
    end

endmodule
