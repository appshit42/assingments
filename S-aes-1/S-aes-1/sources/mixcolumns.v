module mixcolumns(
    input  [15:0] in,
    output [15:0] out
);

    function [3:0] mul4;
        input [3:0] sel;
        begin
            case (sel)
                4'h0: mul4 = 4'h0;
                4'h1: mul4 = 4'h4;
                4'h2: mul4 = 4'h8;
                4'h3: mul4 = 4'hC;
                4'h4: mul4 = 4'h3;
                4'h5: mul4 = 4'h7;
                4'h6: mul4 = 4'hB;
                4'h7: mul4 = 4'hF;
                4'h8: mul4 = 4'h6;
                4'h9: mul4 = 4'h2;
                4'hA: mul4 = 4'hE;
                4'hB: mul4 = 4'hA;
                4'hC: mul4 = 4'h5;
                4'hD: mul4 = 4'h1;
                4'hE: mul4 = 4'h9;
                4'hF: mul4 = 4'hD;
                default: mul4 = 4'h0;
            endcase
        end
    endfunction

    assign out[3:0]   = in[3:0]   ^ mul4(in[11:8]);
    assign out[7:4]   = in[7:4]   ^ mul4(in[15:12]);
    assign out[11:8]  = in[11:8]  ^ mul4(in[3:0]);
    assign out[15:12] = in[15:12] ^ mul4(in[7:4]);

endmodule
