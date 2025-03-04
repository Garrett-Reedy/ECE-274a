`timescale 1ns / 1ps

module Register_Nbit(clk, ld, clr, in, out);
    parameter N = 12;

    input clk, ld, clr;
    input [N - 1: 0] in;
    output reg [N - 1: 0] out;
    
    always @(posedge clk) begin
        if (clr == 1) begin
            out <= 0;
        end
        else if (ld == 1) begin
            out <= in;
        end
        else begin
            out <= out;
        end
    end
endmodule
