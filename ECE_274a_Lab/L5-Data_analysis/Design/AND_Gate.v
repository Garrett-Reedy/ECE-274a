`timescale 1ns / 1ps

module AND_Gate(A, B, AandB);
    input A, B;
    output reg AandB;
    
    always @(A, B) begin
        AandB <= A & B;
    end
endmodule
