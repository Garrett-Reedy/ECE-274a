`timescale 1ns / 1ps

module SeqDet(clk, rst, b, w, debug);
    input clk, rst, b;
    output reg w;
    output reg [2:0] debug;
    
    parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;
    reg [2:0] state, nextState;
    
    always @(state, b) begin
        case (state)
            s0: begin //xxx
                w = 0;
                debug = 0;
                
                if (b == 1) begin
                    nextState = s0;
                end
                else begin
                    nextState = s1;
                end
            end
            s1: begin //0xx
                w = 0;
                debug = 1;
                
                if (b == 1) begin
                    nextState = s4;
                end
                else begin
                    nextState = s2;
                end
            end
            s2: begin //00x
                w = 0;
                debug = 2;
                
                if (b == 1) begin
                    nextState = s3;
                end
                else begin
                    nextState = s2;
                end
            end
            s3: begin //001
                w = 1;
                debug = 3;
                
                if (b == 1) begin
                    nextState = s0;
                end
                else begin
                    nextState = s1;
                end
            end
            s4: begin //01x
                w = 0;
                debug = 4;
                
                if (b == 1) begin
                    nextState = s5;
                end
                else begin
                    nextState = s1;
                end
            end
            s5: begin //011
                w = 1;
                debug = 5;
                
                if (b == 1) begin
                    nextState = s0;
                end
                else begin
                    nextState = s1;
                end
            end
            default: begin
                nextState = 0;
            end
        endcase
    end
    
    always @(posedge clk) begin
        if (rst == 1) begin
            state = s0;
        end
        else begin
            state = nextState;
        end
    end
endmodule
