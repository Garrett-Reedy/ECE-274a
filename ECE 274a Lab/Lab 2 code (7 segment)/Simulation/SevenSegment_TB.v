`timescale 1ns / 1ps

module SevenSegment_tb();
    reg [3:0] SW_tb;
    wire CA_tb, CB_tb, CC_tb, CD_tb, CE_tb, CF_tb, CG_tb;
    
    SevenSegment SevenSegment_1(SW_tb, CA_tb, CB_tb, CC_tb, CD_tb, CE_tb, CF_tb, CG_tb);
    initial
    begin
        //case 0
        SW_tb = 4'b0000;
        #10;
        //case 1
        SW_tb = 4'b0001;
        #10;
        //case 2
        SW_tb = 4'b0010;
        #10;
        //case 3
        SW_tb = 4'b0011;
        #10;
        //case 4
        SW_tb = 4'b0100;
        #10;
        //case 5
        SW_tb = 4'b0101;
        #10;
        //case 6
        SW_tb = 4'b0110;
        #10;
        //case 7
        SW_tb = 4'b0111;
        #10;
        //case 8
        SW_tb = 4'b1000;
        #10;
        //case 9
        SW_tb = 4'b1001;
        #10;
        //case 10
        SW_tb = 4'b1010;
        #10;
        //case 11
        SW_tb = 4'b1011;
        #10;
        //case 12
        SW_tb = 4'b1100;
        #10;
        //case 13
        SW_tb = 4'b1101;
        #10;
        //case 14
        SW_tb = 4'b1110;
        #10;
        //case 15
        SW_tb = 4'b1111;
    end
endmodule