`timescale 1ns / 1ps 

module Register16_8(R_Addr, W_Addr, R_en, W_en, R_Data, W_Data, Clk, Rst, debug_Reg00, debug_Reg01, debug_Reg02, debug_Reg03, debug_Reg04, 
                    debug_Reg05, debug_Reg06, debug_Reg07, debug_Reg08, debug_Reg09, debug_Reg10, debug_Reg11, debug_Reg12, debug_Reg13, 
                    debug_Reg14, debug_Reg15);
    
    input [3:0] R_Addr, W_Addr;
    input R_en, W_en;
    output reg [7:0] R_Data;
    input [7:0] W_Data;
    input Clk, Rst;
    output [7:0] debug_Reg00, debug_Reg01, debug_Reg02, debug_Reg03, debug_Reg04, debug_Reg05, 
                 debug_Reg06, debug_Reg07, debug_Reg08, debug_Reg09, debug_Reg10, debug_Reg11, 
                 debug_Reg12, debug_Reg13, debug_Reg14, debug_Reg15;
   
    //simple memory declaration
    (* mark_debug = "true" *) reg [7:0] RegFile [0:15];
    
    assign debug_Reg00 = RegFile [0];
    assign debug_Reg01 = RegFile [1];
    assign debug_Reg02 = RegFile [2];
    assign debug_Reg03 = RegFile [3];
    assign debug_Reg04 = RegFile [4];
    assign debug_Reg05 = RegFile [5];
    assign debug_Reg06 = RegFile [6];
    assign debug_Reg07 = RegFile [7];
    assign debug_Reg08 = RegFile [8];
    assign debug_Reg09 = RegFile [9];
    assign debug_Reg10 = RegFile [10];
    assign debug_Reg11 = RegFile [11];
    assign debug_Reg12 = RegFile [12];
    assign debug_Reg13 = RegFile [13];
    assign debug_Reg14 = RegFile [14];
    assign debug_Reg15 = RegFile [15];
    
    //write procedure
    always @(posedge Clk) begin
        if (Rst==1) begin        	
	        RegFile[0] = 8'd255;
            RegFile[1] = 8'd254;
            RegFile[2] = 8'd253;
            RegFile[3] = 8'd252;
            RegFile[4] = 8'd251;
            RegFile[5] = 8'd250;
            RegFile[6] = 8'd249;
            RegFile[7] = 8'd248;
     	    RegFile[8] = 8'd247;
       	    RegFile[9] = 8'd246;
      	    RegFile[10] = 8'd245;
     	    RegFile[11] = 8'd244;
            RegFile[12] = 8'd236;
      	    RegFile[13] = 8'd242;
     	    RegFile[14] = 8'd238;
       	    RegFile[15] = 8'd240;
        end //if (Rst == 1)
        else if (W_en==1) begin
            RegFile[W_Addr] <= W_Data;
        end //elif (W_en == 1)
    end //always @(posedge Clk)
    
    // Read procedure
    always @* begin
        if (R_en==1) begin
            R_Data <= RegFile[R_Addr];
        end //if (R_en == 1)
        else begin
            R_Data <= 32'hZZZZZZZZ;
        end //elif (R_en != 1)
    end //always @*
    
endmodule //module Register16_8(...)
