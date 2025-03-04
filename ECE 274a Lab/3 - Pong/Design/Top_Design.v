`timescale 1ns / 1ps

module Top_Design(CLK100MHZ, BTNU, BTNC, BTND, LED);
    input CLK100MHZ, BTNU, BTNC, BTND;
    output [3:0] LED;
        
    // The code below is to instantiate the ClkDiv module that
	//you can use for this part	
    wire ClkOut, bo;
    ClkDiv a1(CLK100MHZ, 1'b0, ClkOut);    
    BtnSynch sync(ClkOut, BTNU, BTND, bo);    //Clock, Reset, ButtonIn, Play
    LPG fsm(ClkOut, BTNU, BTNC, bo, LED);    //Clock, Reset, Start, Play, LED

    //see figure 2 in the lab handout and add your code below to 
	//a) instantiate the Button synchronizer and make connections
	//b) instantiate the light pattern generator and make connections.		


endmodule