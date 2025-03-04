`timescale 1ns / 1ps

module top(clk, rst, go, sum, count_even, avg, done);
    input clk, rst, go;
    output done;
    output [4:0] count_even; //max of 16
    output [7:0] avg; //max of 255
    output [11:0] sum; //max of 4080
    wire i_ld, i_clr, j_ld, j_clr, sum_ld, sum_clr, count_ld, count_clr, temp_ld, temp_clr, avg_ld, avg_clr,
         W_ld, W_clr, R_en, W_en, W_data_mux, W_ij_mux, R_ij_mux, A_mod_2, i_lt_8, i_lt_16;
    wire [3:0] R_addr, W_addr, j_in, j;
    wire [4:0] i_in, i, count_in;
    wire [7:0] R_data, W_data, W_in, temp, avg_in;
    wire [11:0] sum_in;
    
    //controller
    Controller_top C(clk, go, rst, A_mod_2, i_lt_8, i_lt_16, done, i_ld, i_clr, j_ld, j_clr, sum_ld, 
                     sum_clr, count_ld, count_clr, temp_ld, temp_clr, avg_ld, avg_clr, R_en, 
                     W_en, W_data_mux, W_ij_mux, R_ij_mux);
    
    //register file
    Register16_8 RF(R_addr, W_addr, R_en, W_en, R_data, W_data, clk, rst); //register file
    
    //local storage
    //Register_Nbit(clk, ld, clr, in, out);
    Register_Nbit #(4) Reg_j(clk, j_ld, j_clr, j_in, j); //for j
    Register_Nbit #(5) Reg_i(clk, i_ld, i_clr, i_in, i); //for i
    Register_Nbit #(5) Reg_count_even(clk, count_ld, count_clr, count_in, count_even); //for count_even
    Register_Nbit #(8) Reg_temp(clk, temp_ld, temp_clr, R_data, temp); //for temp
    Register_Nbit #(8) Reg_avg(clk, avg_ld, avg_clr, avg_in, avg); //for avg
    Register_Nbit #(12) Reg_sum(clk, sum_ld, sum_clr, sum_in, sum); //for sum
    
    //muxes
    //Mux2x1(i1, i0, addr, S);
    Mux2x1 #(4) M1(j, i, W_ij_mux, W_addr); //for RegFile addresses
    Mux2x1 #(4) M2(j, i, R_ij_mux, R_addr); //for RegFile addresses
    Mux2x1 #(8) M3(R_data, temp, W_data_mux, W_data); //for W_data input
    
    //comparators
    //Comparator(A, B, AltB, AeqB, AgtB);
    Comparator #(4) C1(i, 4'd8, i_lt_8); //for i_lt_8 (2nd loop)
    Comparator #(5) C2(i, 5'd16, i_lt_16); //for i_lt_16 (1st loop)
    
    //math
    //Adder(A, B, S);
    Adder #(5) A1(i, 5'd1, i_in); //i = i + 1
    Adder #(5) A2(count_even, 5'd1, count_in); //count = count + 1
    Adder #(12) A3(sum, {4'b0, R_data}, sum_in); //sum = sum + R_data
    //Subtractor(A, B, S);
    Subtractor #(4) S1(4'd15, i, j_in); //j = 15 - i
    //Divider(A, B, S, rem);
    Divider #(8) D1(.A(R_data), .B(8'd2), .rem(A_mod_2)); //A_mod_2 = R_data % 2
    Divider #(12) D2(sum, 12'd16, avg_in); //avg = sum / 16
endmodule
 