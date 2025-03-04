`timescale 1ns / 1ps

module LE1_tb();
reg A1_tb, A0_tb, B1_tb, B0_tb;
wire F_tb, G_tb;

LE1 a(A1_tb, A0_tb, B1_tb, B0_tb, F_tb, G_tb);

initial begin
    //case 0
    A1_tb <= 0; A0_tb <= 0; B1_tb <= 0; B0_tb <= 0;
        
    //case 1
    #10; 
    A1_tb <= 0; A0_tb <= 0; B1_tb <= 0; B0_tb <= 1;
    
    //case 2
    #10; 
    A1_tb <= 0; A0_tb <= 0; B1_tb <= 1; B0_tb <= 0;
        
    //case 3
    #10; 
    A1_tb <= 0; A0_tb <= 0; B1_tb <= 1; B0_tb <= 1;
        
    //case 4
    #10; 
    A1_tb <= 0; A0_tb <= 1; B1_tb <= 0; B0_tb <= 0;
       
    //case 5
    #10; 
    A1_tb <= 0; A0_tb <= 1; B1_tb <= 0; B0_tb <= 1;
      
    //case 6
    #10; 
    A1_tb <= 0; A0_tb <= 1; B1_tb <= 1; B0_tb <= 0;
      
    //case 7
    #10;
    A1_tb <= 0; A0_tb <= 1; B1_tb <= 1; B0_tb <= 1;
       
    //case 8
    #10;
    A1_tb <= 1; A0_tb <= 0; B1_tb <= 0; B0_tb <= 0;
        
    //case 9
    #10;
    A1_tb <= 1; A0_tb <= 0; B1_tb <= 0; B0_tb <= 1;
        
    //case 10
    #10; 
    A1_tb <= 1; A0_tb <= 0; B1_tb <= 1; B0_tb <= 0;
               
    //case 11
    #10;
    A1_tb <= 1; A0_tb <= 0; B1_tb <= 1; B0_tb <= 1;
        
    //case 12
    #10;
    A1_tb <= 1; A0_tb <= 1; B1_tb <= 0; B0_tb <= 0;
        
    //case 13
    #10;
    A1_tb <= 1; A0_tb <= 1; B1_tb <= 0; B0_tb <= 1;
        
    //case 14
    #10;
    A1_tb <= 1; A0_tb <= 1; B1_tb <= 1; B0_tb <= 0;

    //case 15
    #10; 
    A1_tb <= 1; A0_tb <= 1; B1_tb <= 1; B0_tb <= 1;
    end
endmodule
