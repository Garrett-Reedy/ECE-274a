`timescale 1ns / 1ps

module Adder(A, B, S);
    parameter N = 12; //12 bits by default
    
    input [N - 1:0] A, B;
    output reg [N - 1:0] S;
    
    always @(A, B) begin
        S <= A + B;
    end
endmodule