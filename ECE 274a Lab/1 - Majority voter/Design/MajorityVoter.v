`timescale 1ns / 1ps

module MajorityVoter(a, b, c, d, Out, tie);
    input a, b, c, d;
    output reg Out, tie;
    
    always @(a, b, c, d)
    begin
        Out <= (a & b & c) | (b & c & d) | (a & b & d) | (a & c & d);
        tie <= (~a & ~b & c & d) | (~a & b & ~c & d) | (~a & b & c & ~d) | (a & ~b & ~c & d) | (a & ~b & c & ~d) | (a & b & ~c & ~d);
    end
endmodule