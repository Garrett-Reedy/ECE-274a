`timescale 1ns / 1ps


module Lab5(Clk, Rst, go, sum, count, done);
    input Clk, Rst, go;
    output done;
    output [4:0] count;
    output [11:0] sum;

    wire W_en, R_en; 
    wire i_clr, i_ld;
    wire temp_clr, temp_ld;
    wire count_clr, count_ld;
    wire sum_clr, sum_ld;
    wire temp47_58, i_lt_16;
    wire Agt47, Alt58;
    wire [4:0] i, new_i, new_count;
    wire [7:0] temp, R_Data, W_Data;
    wire [11:0] new_sum;
    
    //controller
    Controller c1(Clk, Rst, go, temp47_58, i_lt_16, done, W_en, R_en, i_clr, i_ld, temp_clr, temp_ld, count_clr, count_ld, sum_clr, sum_ld);
    
    //registers
    RegFile16x8 RF_16x8(.R_Addr(i[3:0]), .W_Addr(i[3:0]), .R_en(R_en), .W_en(W_en), .R_Data(R_Data), .W_Data(W_Data), .Clk(Clk), .Rst(Rst));
    Register #(5) count_reg(.Clk(Clk), .Clr(count_clr), .Ld(count_ld), .I(new_count), .Q(count)); //number of numbers in range (47, 58)
    Register #(5) addr_reg(.Clk(Clk), .Clr(i_clr), .Ld(i_ld), .I(new_i), .Q(i)); //address for both read and write
    Register #(8) temp_reg(.Clk(Clk), .Clr(temp_clr), .Ld(temp_ld), .I(R_Data), .Q(temp)); //holds R_data
    Register #(12) sum_reg(.Clk(Clk), .Clr(sum_clr), .Ld(sum_ld), .I(new_sum), .Q(sum)); //holds sum of all data
    
    //adders and subtractors
    Adder #(5) counter(.A(count), .B(5'd1), .Cin(1'b0), .S(new_count)); //counts number of points between 47 & 58
    Adder #(5) increment_addr(.A(i), .B(5'd1), .Cin(1'b0), .S(new_i)); //increments address
    Adder #(12) summation(.A(sum), .B({4'b0000, R_Data}), .Cin(1'b0), .S(new_sum)); //adds R_data to sum
    Subtractor_8bits temp_minus_48(.A(temp), .B(8'd48), .S(W_Data)); //subtracts 48 if in range (47, 58)
    
    //Comparators and gates
    Comparator_8bits addr_vs_16(.A({3'b000, i}), .B(8'd16), .AltB(i_lt_16)); //i_lt_16 returns true if the address < 16
    Comparator_8bits temp_vs_47(.A(temp), .B(8'd47), .AgtB(Agt47)); //True if temp > 47
    Comparator_8bits temp_vs_58(.A(temp), .B(8'd58), .AltB(Alt58)); //True if temp < 58
    AND_Gate andgate(.A(Agt47), .B(Alt58), .AandB(temp47_58));
endmodule
