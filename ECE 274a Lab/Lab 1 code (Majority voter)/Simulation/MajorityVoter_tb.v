`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2024 10:15:00 AM
// Design Name: 
// Module Name: MajorityVoter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MajorityVoter_tb();
reg a_tb, b_tb, c_tb, d_tb;
wire out_tb, tie_tb;

MajorityVoter a(a_tb, b_tb, c_tb, d_tb,out_tb, tie_tb);

initial begin
    //case 0
        a_tb <= 0; b_tb <= 0; c_tb <= 0; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 1
        #10 a_tb <= 0; b_tb <= 0; c_tb <= 0; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 2
        #10 a_tb <= 0; b_tb <= 0; c_tb <= 1; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 3
        #10 a_tb <= 0; b_tb <= 0; c_tb <= 1; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 4
        #10 a_tb <= 0; b_tb <= 1; c_tb <= 0; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 5
        #10 a_tb <= 0; b_tb <= 1; c_tb <= 0; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 6
        #10 a_tb <= 0; b_tb <= 1; c_tb <= 1; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 7
        #10 a_tb <= 0; b_tb <= 1; c_tb <= 1; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 8
        #10 a_tb <= 1; b_tb <= 0; c_tb <= 0; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 9
        #10 a_tb <= 1; b_tb <= 0; c_tb <= 0; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 10
        #10 a_tb <= 1; b_tb <= 0; c_tb <= 1; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);        
        //case 11
        #10 a_tb <= 1; b_tb <= 0; c_tb <= 1; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 12
        #10 a_tb <= 1; b_tb <= 1; c_tb <= 0; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 13
        #10 a_tb <= 1; b_tb <= 1; c_tb <= 0; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 14
        #10 a_tb <= 1; b_tb <= 1; c_tb <= 1; d_tb <= 0;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
        //case 15
        #10 a_tb <= 1; b_tb <= 1; c_tb <= 1; d_tb <= 1;
        $display ("out_tb=%b", out_tb);
        $display ("tie_tb=%b", tie_tb);
    end
endmodule
