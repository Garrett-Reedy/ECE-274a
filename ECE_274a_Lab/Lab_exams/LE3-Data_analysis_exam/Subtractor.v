`timescale 1ns / 1ps

module Subtractor(A, B, S);
    parameter N = 12; //12 bits by default
    
    input [N - 1:0] A, B;
    output reg [N - 1:0] S;
    
    always @(A, B) begin
        //Always subtracts from the larger number in case of inputting mistakes
        if (B > A) begin
            S <= B - A;
        end //if A < B
        else begin
            S <= A - B;
        end //if A >= B
    end //always @(A, B)
endmodule //module Subtractor(...)
