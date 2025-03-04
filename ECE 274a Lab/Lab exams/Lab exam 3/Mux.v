`timescale 1ns / 1ps

module Mux2x1(i1, i0, addr, S);
    parameter N = 8; //number of bits for i1, i0, S

    input addr;
    input [N - 1: 0] i1, i0;
    output reg [N - 1: 0] S;
    
    always @(i1, i0, addr) begin
        if (addr == 0) begin
            S <= i0;
        end
        else begin
            S <= i1;
        end
    end
endmodule
