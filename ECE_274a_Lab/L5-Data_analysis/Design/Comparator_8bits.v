`timescale 1ns / 1ps

//if A > B, AgtB = 1, AltB = 0, AeqB = 0
//if A < B, AgtB = 0, AltB = 1, AeqB = 0
//if A == B, AgtB = 0, AltB = 0, AeqB = 1

module Comparator_8bits(A, B, AltB, AeqB, AgtB);
    input [7:0] A, B;
    output reg AltB, AeqB, AgtB;
    
    always @(A, B) begin
        AltB <= 1'b0;
        AeqB <= 1'b0;
        AgtB <= 1'b0;
        
        if (A[7] != B[7]) begin
            AltB <= ~A[7] & B[7];
            AgtB <= A[7] & ~B[7];
        end
        else if (A[6] != B[6]) begin
            AltB <= ~A[6] & B[6];
            AgtB <= A[6] & ~B[6];
        end
        else if (A[5] != B[5]) begin
            AltB <= ~A[5] & B[5];
            AgtB <= A[5] & ~B[5];
        end
        else if (A[4] != B[4]) begin
            AltB <= ~A[4] & B[4];
            AgtB <= A[4] & ~B[4];
        end
        else if (A[3] != B[3]) begin
            AltB <= ~A[3] & B[3];
            AgtB <= A[3] & ~B[3];
        end
        else if (A[2] != B[2]) begin
            AltB <= ~A[2] & B[2];
            AgtB <= A[2] & ~B[2];
        end
        else if (A[1] != B[1]) begin
            AltB <= ~A[1] & B[1];
            AgtB <= A[1] & ~B[1];
        end
        else if (A[0] != B[0]) begin
            AltB <= ~A[0] & B[0];
            AgtB <= A[0] & ~B[0];
        end
        else begin
            AeqB <= 1'b1;
        end
    end
endmodule
