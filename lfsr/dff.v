module dff(
    input      clk_1,
    input      reset,
    input      in,
    output reg o
);

    always @(posedge clk_1) begin
        if (reset)
            o <= 1'b0;
        else
            o <= in;
    end

endmodule

