module clock_divider #(
    parameter integer DIV = 25_000_000
)(
    input  wire clk_100MHz,
    input  wire reset,
    output reg  clk_2Hz
);

    reg [24:0] counter;

    always @(posedge clk_100MHz or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_2Hz <= 1'b0;
        end
        else if (counter == DIV-1) begin
            counter <= 0;
            clk_2Hz <= ~clk_2Hz;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end

endmodule