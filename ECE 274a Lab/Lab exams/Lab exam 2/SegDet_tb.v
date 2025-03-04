`timescale 1ns / 1ps

module SegDet_tb();
    reg clk_tb, rst_tb, b_tb;
    wire w_tb;
    wire [2:0] debug;
    
    SeqDet A(clk_tb, rst_tb, b_tb, w_tb, debug);
    
    always begin
        clk_tb <= 0;
        #100;
        clk_tb <= 1;
        #100;
    end
    
    initial begin
        rst_tb = 1;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        rst_tb = 0;
        
        @(posedge clk_tb)
        #50;
        b_tb = 0;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        b_tb = 0;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        b_tb = 0;
        
        @(posedge clk_tb)
        #50;
        b_tb = 0;
        
        @(posedge clk_tb)
        #50;
        b_tb = 0;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        b_tb = 0;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
        
        @(posedge clk_tb)
        #50;
        b_tb = 1;
    end
endmodule
