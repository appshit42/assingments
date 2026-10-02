module aes_controller (
    input wire clk,
    input wire rst_n,
    input wire start,

    output reg top_mux_sel,
    output reg bottom_mux_sel,
    output reg datareg_en,
    output reg outreg_en,
    output reg [1:0] key_sel
   
);
    reg done;
    parameter
        IDLE       = 3'b000,
        INIT_ROUND = 3'b001,
        ROUND_1    = 3'b010,
        ROUND_2    = 3'b011,
        DONE       = 3'b100;

    reg [2:0] current_state;
    reg [2:0] next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            IDLE:
                next_state = start ? INIT_ROUND : IDLE;

            INIT_ROUND:
                next_state = ROUND_1;

            ROUND_1:
                next_state = ROUND_2;

            ROUND_2:
                next_state = DONE;

            DONE:
                next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end

    always @(*) begin
        top_mux_sel    = 1'b0;
        bottom_mux_sel = 1'b0;
        datareg_en     = 1'b0;
        outreg_en      = 1'b0;
        key_sel        = 2'b00;
        done           = 1'b0;

        case (current_state)

            IDLE: begin
            end

            INIT_ROUND: begin
                top_mux_sel = 1'b0;
                datareg_en  = 1'b1;
                key_sel     = 2'b00;
            end

            ROUND_1: begin
                top_mux_sel    = 1'b1;
                bottom_mux_sel = 1'b0;
                datareg_en     = 1'b1;
                key_sel        = 2'b01;
            end

            ROUND_2: begin
                top_mux_sel    = 1'b1;
                bottom_mux_sel = 1'b1;
                outreg_en      = 1'b1;
                key_sel        = 2'b10;
            end

            DONE: begin
                done = 1'b1;
            end

            default: begin
            end

        endcase
    end

endmodule
