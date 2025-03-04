`timescale 1ns / 1ps

module VendingMach(clk, reset, Nc, Dm, Qt, candy, change);
    input clk, Nc, Dm, Qt, reset;
    output reg candy;
    output reg [4:0] change;
    
    parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8, s9=9;
    reg [3:0] state = s0;
    
    always @(state) begin
        case (state)
            s0: begin
                candy <= 0;
                change <= 0;
            end //case s0
            s1: begin
                candy <= 0;
                change <= 5;
            end //case s1
            s2: begin
                candy <= 0;
                change <= 10;
            end //case s2
            s3: begin
                candy <= 0;
                change <= 15;
            end //case s3
            s4: begin
                candy <= 0;
                change <= 20;
            end //case s4
            s5: begin
                candy <= 1;
                change <= 0;
            end //case s5
            s6: begin
                candy <= 1;
                change <= 5;
            end //case s6
            s7: begin
                candy <= 1;
                change <= 10;
            end //case s7
            s8: begin
                candy <= 1;
                change <= 15;
            end //case s8
            s9: begin
                candy <= 1;
                change <= 20;
            end //case s9
        endcase
    end
    
    always @(posedge clk)
    begin
        if (reset == 1) begin
            state = 0;
        end
        else if (state < 5) begin
            if (Nc == 1 && Dm == 0 && Qt == 0) begin
                state = state + 1;
            end
            else if (Nc == 0 && Dm == 1 && Qt == 0) begin
                state = state + 2;
            end
            else if (Nc == 0 && Dm == 0 && Qt == 1) begin
                state = state + 5;
            end
            else begin
                state = state;
            end
        end
        else begin
            state = state;
        end
    end
endmodule