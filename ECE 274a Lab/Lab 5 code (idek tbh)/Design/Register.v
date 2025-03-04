`timescale 1ns / 1ps

//at positive edge of Clk, 
//if Clr = 1, Q = 0;
//else if Ld = 1, Q = I;
//otherwise, Q stays the same

module Register (Clk, Clr, Ld, I, Q);
    parameter N = 12;
    
    input Clk, Clr, Ld;
    input [N - 1:0] I;
    output reg [N - 1:0] Q;
    
    always @ (posedge Clk) begin
        if (Clr == 1) begin
            Q <= 0;
        end
        else if (Ld == 1) begin
            Q <= I;
        end
        else begin
            Q <= Q;
        end
    end
endmodule