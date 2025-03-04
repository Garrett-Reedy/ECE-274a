`timescale 1ns / 1ps

module Comp8Bit_tb();
    reg [7:0] A_tb, B_tb;
    wire AltB_tb, AeqB_tb, AgtB_tb;
    
    Comparator_8bits a(A_tb, B_tb, AltB_tb, AeqB_tb, AgtB_tb);
    
    initial begin
        A_tb <= 175;
        B_tb <= 100;
        
        #50
        A_tb <= 10;
        B_tb <= 200;
        
        #50
        A_tb <= 45;
        B_tb <= 45;
    end
endmodule
