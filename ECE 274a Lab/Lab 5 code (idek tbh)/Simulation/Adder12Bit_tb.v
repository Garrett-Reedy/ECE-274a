`timescale 1ns / 1ps

module Adder12Bit_tb();
    reg [11:0] A_tb, B_tb; 
    reg Cin_tb;
    wire [11:0] S_tb;
    
    Adder #(12) B(A_tb, B_tb, Cin_tb, S_tb);
    
    initial begin
        A_tb <= 12'hc23;
        B_tb <= 12'h0b4;
        Cin_tb <= 0;
        
        #50;
        A_tb <= 12'hc23;
        B_tb <= 12'h0b4;
        Cin_tb <= 1;
        
        #50;
        A_tb <= 12'h023;
        B_tb <= 12'h0b4;
        Cin_tb <= 1;
        
        #50;
        A_tb <= 12'hfff;
        B_tb <= 12'h000;
        Cin_tb <= 1;
        
        #50;
        A_tb <= 12'hfff;
        B_tb <= 12'h00f;
        Cin_tb <= 0;
    end
endmodule
