`timescale 1ns / 1ps

module LE1(A1, A0, B1, B0, F, G);
    input A1, A0, B1, B0;
    output reg F, G;
    
    always @(A1, A0, B1, B0)
    begin
        F <= (~A1 & B1) | (~A1 & ~A0 & B0) | (~A0 & B1 & B0); // A < B
        G <= (~A1 & ~A0) | (~B1 & ~B0) | (~A1 & ~B1) | (~A1 & B1 & ~B0) | (A1 & ~A0 & ~B1); // A + B < 4
    end
endmodule
