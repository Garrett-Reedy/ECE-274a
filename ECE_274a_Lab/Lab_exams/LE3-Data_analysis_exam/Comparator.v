`timescale 1ns / 1ps

module Comparator(A, B, AltB, AeqB, AgtB, A_debug, B_debug);
    parameter N = 12;

    (* mark_debug = "true" *) input [N - 1:0] A, B;
    output reg AltB, AeqB, AgtB;
    output [N - 1: 0] A_debug, B_debug;
    
    assign A_debug = A;
    assign B_debug = B;
    
    always @(A, B) begin
        if (A < B) begin
            AltB <= 1;
            AeqB <= 0;
            AgtB <= 0;
        end //if AltB
        else if (A == B) begin
            AltB <= 0;
            AeqB <= 1;
            AgtB <= 0;
        end //if AeqB
        else if (A > B) begin
            AltB <= 0;
            AeqB <= 0;
            AgtB <= 1;
        end //if AgtB
    end //always @(A, B)
endmodule //module Comparator(...)
