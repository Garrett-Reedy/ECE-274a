`timescale 1ns / 1ps

module top_tb();
    reg clk, rst, go;
    wire done;
    wire [3:0] cnt_even;
    wire [7:0]  avg;
    wire [11:0] sum;

    top T1(clk, rst, go, sum, cnt_even, avg, done);
    
    //clock cycle
    always begin
        clk = 0;
        #100;
        clk = 1;
        #100;
    end
    
    //testbench
    initial begin
        @(posedge clk);
        #50;
        rst = 1;
        
        @(posedge clk);
        #50; 
        rst = 0;
        go = 1;
        
        @(posedge clk);
        #50;
        go = 0;
    end
endmodule
