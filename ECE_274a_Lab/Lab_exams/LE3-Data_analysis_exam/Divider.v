`timescale 1ns / 1ps

module Divider(A, B, S, rem);
    parameter N = 12;

    input [N - 1: 0] A, B;    //inputs
    output reg [N - 1: 0] S;    //result
    output reg rem;    //remainder
    
    always @(A, B) begin
        S = A / B;
        rem = A - (S * B);
    end
endmodule
