module round_key(input [15:0] state,input [15:0] roundkey,output [15:0] out);
    assign out = state ^ round_key;
endmodule