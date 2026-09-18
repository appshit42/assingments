module CLKdiv (
    input  clk,
    output reg clk_1
);

    reg [26:0] count;

    initial begin
        count = 27'd0;
        clk_1 = 1'b0;
    end

    always @(posedge clk) begin
        if (count == 27'd1) begin
            clk_1 <= ~clk_1;
            count <= 27'd0;
        end
        else begin
            count <= count + 1'b1;
        end
    end

endmodule
