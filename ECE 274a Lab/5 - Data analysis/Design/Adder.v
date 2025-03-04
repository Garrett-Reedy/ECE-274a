`timescale 1ns / 1ps

//A + B + Cin gives S and Co where Co is Carry-out
module Adder(A, B, Cin, S);
    parameter N = 12; //N is the total number of bits it can add
    
    input [N - 1:0] A, B;
    input Cin;
    output reg [N - 1:0] S;
    reg Co;
    reg [3:0] i; //supports up to 16 bits
    
    always @(A, B, Cin) begin
        //For loop adding each bit
        for (i = 0; i < N; i = i + 1) begin
            if (i == 0) begin
                S[i] = A[i] ^ B[i] ^ Cin;
            end
            else begin //if (i != 0)
                S[i] = A[i] ^ B[i] ^ ((A[i - 1] & B[i - 1]) | ((A[i - 1] | B[i - 1]) & ~S[i - 1]));
            end
        end
        
        Co = (A[i - 1] & B[i - 1]) | ((A[i - 1] | B[i - 1]) & ~S[i - 1]); //Found from k-map
    end
endmodule