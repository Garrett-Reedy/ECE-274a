`timescale 1ns / 1ps

module Register_12bit_tb();
    reg Clk_tb, Clr_tb, Ld_tb;
    reg [11:0] I_tb;
    wire [11:0] Q_tb;
    
    Register #(12) reg_12bit(Clk_tb, Clr_tb, Ld_tb, I_tb, Q_tb);
    
    always begin
        Clk_tb <= 0;
        #100;
        Clk_tb <= 1;
        #100;
    end
    
    initial begin
        Clr_tb <= 1;
        Ld_tb <= 0;
        I_tb <= 12'h000;
        
        @(posedge Clk_tb);
        #50;
        Clr_tb <= 0;
        I_tb <= 12'habc;
        
        @(posedge Clk_tb);
        #50;
        Ld_tb <= 1;
        
        @(posedge Clk_tb);
        #50;
        I_tb <= 12'hfff;
    end
endmodule
