`timescale 1ns / 1ps

module BtnSynch(Clk, Rst, bi, bo);
    input Clk, Rst, bi;
    output reg bo;
    
    parameter WRise = 0, Pulse = 1, WFall = 2;
    
    reg [1:0] State, StateNext;
    
    always@(State, bi)
    begin
        case(State)
            WRise: begin
                bo <= 0;
                
                if (bi == 0) begin
                    StateNext <= WRise;
                end
                else begin
                    StateNext <= Pulse;
                end
            end    //Case WRise
            Pulse: begin
                bo <= 1;
                
                if (bi == 0) begin
                    StateNext <= WRise;
                end
                else begin
                    StateNext <= WFall;
                end
            end    //Case Pulse
            WFall: begin
                bo <= 0;
                
                if (bi == 0) begin
                    StateNext <= WRise;
                end
                else begin
                    StateNext <= WFall;
                end
            end    //Case WFall
        endcase    //case(State)
    end    //always@         
    
    always@(posedge Clk)
    begin
        if (Rst == 1) begin
            State <= WRise;
        end
        else begin
            State <= StateNext;
        end 
    end   
endmodule
