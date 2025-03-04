`timescale 1ns / 1ps

module Lab4(CLK100MHZ, BTNU, BTNL, BTNC, BTNR, LED, CA, CB, CC, CD, CE, CF, CG, AN);
    input CLK100MHZ;
    input BTNU, BTNL, BTNC, BTNR; //BTNU is Reset, BTNL is Nickel, BTNC is Dime, BTNR is Quarter
    output [0:0] LED; //LED[0] is Candy
    output CA, CB, CC, CD, CE, CF, CG; //segment a, b, ... g
    output [7:0] AN; //enable each digit of the 8 digits
    wire CLKOUT, nickel, dime, quarter;
    wire [5:0] change;
    
    //1000 Hz clock
    ClkDiv CLK_1kHz(CLK100MHZ, 1'b0, CLKOUT);
    
    //Button synchronizers
    BtnSynch BtnS1(CLKOUT, BTNU, BTNL, nickel);
    BtnSynch BtnS2(CLKOUT, BTNU, BTNC, dime);
    BtnSynch BtnS3(CLKOUT, BTNU, BTNR, quarter);
    
    VendingMach VM(CLKOUT, BTNU, nickel, dime, quarter, LED[0], change);
    TwoDigitDisplay TwoDD(CLK100MHZ, change, CA, CB, CC, CD, CE, CF, CG, AN);
endmodule
