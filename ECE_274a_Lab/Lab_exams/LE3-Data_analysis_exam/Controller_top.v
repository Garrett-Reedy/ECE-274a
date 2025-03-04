`timescale 1ns / 1ps

module Controller_top(clk, go, rst, A_mod_2, i_lt_8, i_lt_16, done, i_ld, i_clr, j_ld, j_clr, sum_ld, 
                      sum_clr, count_ld, count_clr, temp_ld, temp_clr, avg_ld, avg_clr, R_en, 
                      W_en, W_data_mux, W_ij_mux, R_ij_mux, DBstate, DBnextState);
    input clk, go, rst, A_mod_2, i_lt_8, i_lt_16;
    output reg done = 0, i_ld = 0, i_clr = 0, j_ld = 0, j_clr = 0, sum_ld = 0, sum_clr = 0, count_ld = 0, count_clr = 0, temp_ld = 0, 
               temp_clr = 0, avg_ld = 0, avg_clr = 0, R_en = 0, W_en = 0, W_data_mux = 0, W_ij_mux = 0, R_ij_mux = 0;
    
    output [3:0] DBstate, DBnextState;
        
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9, s10 = 10, 
              s11 = 11, s12 = 12, s13 = 13, s14 = 14, s15 = 15;
    (* KEEP = "true" *)  reg [3:0] state = s0, nextState = s0;
    
    reg DB;
    
    always @(state, go) begin
        i_ld <= 0; i_clr <= 0; j_ld <= 0; j_clr <= 0; sum_ld <= 0; sum_clr <= 0; count_ld <= 0; 
        count_clr <= 0; temp_ld <= 0; temp_clr <= 0; avg_ld <= 0; avg_clr <= 0; R_en <= 1; W_en <= 0;
        nextState <= state;
        
        DB <= 0;
        
        case (state)
            s0: begin
                done <= 0;
                avg_clr <= 1;
                sum_clr <= 1;
                count_clr <= 1;
                i_clr <= 1;
                
                if (go) begin
                    nextState <= s1;
                end
                else begin
                    nextState <= state;
                end
            end
            s1: begin
                if (i_lt_16) begin
                    nextState <= s2;
                end
                else begin
                    nextState <= s5;
                end
            end
            s2: begin
                R_ij_mux <= 0;
                sum_ld <= 1;
                
                if (!A_mod_2) begin
                    nextState <= s3;
                end
                else begin
                    nextState <= s4;
                end
            end
            s3: begin
                count_ld <= 1;
                
                nextState <= s4;
            end
            s4: begin
                i_ld <= 1;
                
                nextState <= s1;
            end
            s5: begin
                i_clr <= 1;
                j_clr <= 1;
                avg_ld <= 1;
                
                nextState <= s6;
            end
            s6: begin
                if (i_lt_8) begin
                    nextState <= s7;
                end
                else begin
                    nextState <= s10;
                end
            end
            s7: begin
                j_ld <= 1;
                //temp = A[i]
                R_ij_mux <= 0;
                temp_ld <= 1;
                
                nextState <= s8;
            end
            s8: begin
                //A[i] = A[j]
                W_ij_mux <= 0;
                R_ij_mux <= 1;
                W_data_mux <= 1;
                W_en <= 1;
                                
                nextState <= s9;
            end
            s9: begin
                //A[j] = temp
                W_ij_mux <= 1;
                W_data_mux <= 0;
                W_en <= 1;
                
                i_ld <= 1;
                
                nextState <= s6;
            end
            s10: begin
                done <= 1;
                
                nextState <= s0;
            end
            default: begin
                nextState <= s0;
            end
        endcase
    end
    
    always @(posedge clk) begin    
        if (rst) begin
            state <= s0;
        end
        else begin
            state <= nextState;
        end
    end
endmodule