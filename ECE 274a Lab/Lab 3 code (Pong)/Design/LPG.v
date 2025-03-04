`timescale 1ns / 1ps

module LPG(Clk, Rst, Start, Play, LD);
    input Clk, Rst, Start, Play;
    output reg [3:0] LD;
    
   
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5, s6 = 6, s7 = 7, s8 = 8, s9 = 9;
    reg [3:0] State, StateNext;
    
    always@(State, Play, Start) 
    begin
        case(State)
            s0: begin
                LD[3] <= 0;
                LD[2] <= 0;
                LD[1] <= 0;
                LD[0] <= 0;
                
                if (Start == 1) begin
                    StateNext <= 1;
                end    //if start == 1
                else begin
                    StateNext <= 0;
                end    //else
            end    //s0
            s1: begin
                LD[3] <= 1;
                
                StateNext <= 2;
            end    //s1
            s2: begin
                LD[3] <= 0;
                LD[2] <= 1;
                
                StateNext <= 3;
            end    //s2
            s3: begin
                LD[2] <= 0;
                LD[1] <= 1;
                
                StateNext <= 4;
            end    //s3
            s4: begin
                LD[1] <= 0;
                LD[0] <= 1;
                
                StateNext <= 5;
            end    //s4
            s5: begin
                LD[0] <= 0;
                LD[1] <= 1;
                
                StateNext <= 6;
            end    //s5
            s6: begin
                LD[1] <= 0;
                LD[2] <= 1;
            
                StateNext <= 7;
            end    //s6
            s7: begin
                LD[2] <= 0;
                LD[3] <= 1;
                
                if (Play == 1) begin
                    StateNext <= 2;
                end    //if play == 1
                else begin
                    StateNext <= s8;
                end    //else 
            end    //s7
            s8: begin              
                LD[0] <= 1;
                LD[1] <= 1;
                LD[2] <= 1;
                LD[3] <= 1;
                StateNext <= 9;
            end    //s8
            s9: begin              
                LD[0] <= 0;
                LD[1] <= 0;
                LD[2] <= 0;
                LD[3] <= 0;
                StateNext <= 8;
            end    //s9
            default: begin
                LD[0] <= 0;
                LD[1] <= 0;
                LD[2] <= 0;
                LD[3] <= 0;
                
                StateNext <= 0;
            end
        endcase
    end    //always@
    
    always@(posedge Clk) begin
        if (Rst == 1) begin 
            State <= 0;
        end
        else begin
            State <= StateNext;
        end
    end //always@ posedge clk
endmodule
