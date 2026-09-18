// Top-level 4-bit up/down counter: takes clk_100MHz as input and generates ~2 Hz internally.
// - direction = 1 -> increment
// - direction = 0 -> decrement
module counter #(
    parameter integer DIV = 25_000_000    // toggle every DIV cycles => output freq = clk_in / (2*DIV)
)(
    input  wire        clk_100MHz,
    input  wire        reset,
    input  wire        direction,
    output reg  [3:0]  count_out,
    output wire        mode_led
);

    wire clk_2Hz;
    assign mode_led = direction;

    // instantiate clock divider
    clock_divider #(.DIV(DIV)) clkdiv (
        .clk_100MHz(clk_100MHz),
        .reset     (reset),
        .clk_2Hz   (clk_2Hz)
    );

    wire [3:0] add_result;
    wire [3:0] sub_result;
    wire [3:0] next_count;

    // Add 1
    adder4 ADD (
        .a   (count_out),
        .b   (4'b0001),
        .cin (1'b0),
        .sum (add_result),
        .cout ()
    );

    // Subtract 1 (a - 1)
    subtractor4 SUB (
        .a    (count_out),
        .b    (4'b0001),
        .diff (sub_result)
    );

    assign next_count = direction ? add_result : sub_result;

    // Register the count (asynchronous reset on reset signal)
    always @(posedge clk_2Hz or posedge reset) begin
        if (reset)
            count_out <= 4'b0000;
        else 
            count_out <= next_count;
    end

endmodule


// Parameterizable clock divider: toggle output every (DIV) cycles.
// Output frequency = clk_in / (2*DIV)

