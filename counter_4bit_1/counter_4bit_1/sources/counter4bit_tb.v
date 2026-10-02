module counter4bit_tb;

    reg clk_100MHz;
    reg reset;
    reg direction;

    wire [3:0] count_out;
    wire mode_led;

    // Use small DIV for simulation
    counter4bit #(.DIV(5)) DUT (
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .direction(direction),
        .count_out(count_out),
        .mode_led(mode_led)
    );

    // 100 MHz clock
    // Period = 10 ns
    initial begin
        clk_100MHz = 1'b0;

        forever #5 clk_100MHz = ~clk_100MHz;
    end

    initial begin

        // Start with reset
        reset = 1'b1;
        direction = 1'b1;

        #20;

        // Release reset
        reset = 1'b0;

        // Count UP
        direction = 1'b1;

        #600;

        // Count DOWN
        direction = 1'b0;

       #600;

        $finish;
    end

    // Display values whenever count changes
    always @(count_out) begin
        $display("Time=%0t ns | direction=%b | count=%d",
                 $time, direction, count_out);
    end

endmodule
