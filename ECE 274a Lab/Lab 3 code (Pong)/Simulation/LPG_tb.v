`timescale 1ns / 1ps

module LPG_tb();
    reg Clk_tb, Rst_tb, Start_tb, Play_tb;
    wire [3:0] LD_tb;
    
    LPG a(Clk_tb, Rst_tb, Start_tb, Play_tb, LD_tb);
    
    //Clock cycle
    always begin
        Clk_tb <= 0;
        #100;
        Clk_tb <= 1;
        #100;
    end
    
    initial begin
        Rst_tb <= 1;
        Start_tb <= 0;
        Play_tb <= 0;
        
        @(posedge Clk_tb);
        #50;
        Rst_tb <= 0;
        
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        #50;
        Start_tb <= 1;
        
        @(posedge Clk_tb);    //Start of cycle
        #50;
        Start_tb <= 0;
        
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);    //End of cycle
        
        @(posedge Clk_tb);    //blinking lights (game over)
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        #50;
        Rst_tb <= 1;
        
        @(posedge Clk_tb);
        #50;
        Rst_tb <= 0;
        Start_tb <= 1;
        
        @(posedge Clk_tb);
        #50;
        Start_tb <= 0;
        
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        #50;
        Play_tb <= 1;
        
        @(posedge Clk_tb);
        #50;
        Play_tb <= 0;
        
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        #50;
        Play_tb <= 1;
        
        @(posedge Clk_tb);
        #50;
        Play_tb <= 0;
        
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);        
        #50;
        Play_tb <= 1;
        
        @(posedge Clk_tb);
        #50;
        Play_tb <= 0;
        
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
    end
endmodule
