module 4bitcounter_tb;

    reg        clk_100MHz;
    reg        reset;
    reg        direction;

    wire [3:0] count_out;
    wire       mode_led;

    //========================================
    // DUT
    //========================================
    counter uut (
        .clk_100MHz (clk_100MHz),
        .reset      (reset),
        .direction  (direction),
        .count_out  (count_out),
        .mode_led   (mode_led)
    );

    //========================================
    // 100 MHz CLOCK
    // Period = 10 ns
    //========================================
    initial begin
        clk_100MHz = 1'b0;

        forever #5 clk_100MHz = ~clk_100MHz;
    end

    //========================================
    // TEST
    //========================================
    initial begin

        // Waveform
        $dumpfile("4bitcounter.vcd");
        $dumpvars(0, 4bitcounter_tb);

        $monitor(
            "Time=%0t | clk=%b | reset=%b | direction=%b | count_out=%b | mode_led=%b",
            $time,
            clk_100MHz,
            reset,
            direction,
            count_out,
            mode_led
        );

        //====================================
        // RESET
        //====================================
        reset = 1'b1;
        direction = 1'b1;

        #100;

        reset = 1'b0;

        //====================================
        // COUNT UP
        //====================================
        direction = 1'b1;

        // Wait for several 2 Hz clock cycles
        #300000000;

        //====================================
        // COUNT DOWN
        //====================================
        direction = 1'b0;

        #300000000;

        //====================================
        // FINISH
        //====================================
        $finish;

    end

endmodule