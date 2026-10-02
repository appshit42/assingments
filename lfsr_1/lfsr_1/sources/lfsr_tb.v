module lfsr_tb;

    reg [3:0] seed;
    reg rst;
    reg sel;
    reg clk;
    wire [3:0] state;

    lfsr uut (
        .seed(seed),
        .rst(rst),
        .sel(sel),
        .clk(clk),
        .state(state)
    );

    // Clock: 10 time-unit period
    always #5 clk = ~clk;

    initial begin
        $dumpfile("lfsr.vcd");
        $dumpvars(0,lfsr_tb);
        // Initial values
        clk  = 1'b0;
        rst  = 1'b0;
        sel  = 1'b0;

       seed = 4'b0001;
        #1 $display("Time=%0t | seed=%b | state=%b", $time, seed, state);
        
        #10 seed = 4'b0010;
        #1  $display("Time=%0t | seed=%b | state=%b", $time, seed, state);
        
        #10 seed = 4'b0101;
        #1  $display("Time=%0t | seed=%b | state=%b", $time, seed, state);
        
        #10 seed = 4'b1010;
        #1  $display("Time=%0t | seed=%b | state=%b", $time, seed, state);

        end

endmodule
