`timescale 1ns / 1ps

module VendingMach_tb();
    reg clk_tb, Nc_tb, Dm_tb, Qt_tb, reset_tb;
    wire candy_tb;
    wire [4:0] change_tb;
    
    VendingMach a(clk_tb, reset_tb, Nc_tb, Dm_tb, Qt_tb, candy_tb, change_tb);
    
    //clock cycle
    always begin
        clk_tb <= 0;
        #100;
        clk_tb <= 1;
        #100;
    end
    
    initial begin
        reset_tb <= 1;
        Nc_tb <= 0;
        Dm_tb <= 0;
        Qt_tb <= 0;
        
        //no coin input
        @(posedge clk_tb);
        #50; 
        reset_tb <= 0;
        
        //multiple coins input
        @(posedge clk_tb);
        #50;
        Nc_tb <= 1;
        Dm_tb <= 1;
        
        @(posedge clk_tb);
        #50;
        Nc_tb <= 0;
        Dm_tb <= 0;
        reset_tb <= 1;
        
        //aum of 25
        @(posedge clk_tb);
        #50;
        reset_tb <= 0;
        Qt_tb <= 1;
        
        @(posedge clk_tb);
        #50;
        Qt_tb <= 0;
        reset_tb <= 1;
        
        //sum of 30
        @(posedge clk_tb);
        #50;
        reset_tb <= 0;
        Dm_tb <= 1;
        
        @(posedge clk_tb); //10 cents
        #50;
        Dm_tb <= 0;
        #50;
        Dm_tb <= 1;
        
        @(posedge clk_tb); //20 cents
        #50;
        Dm_tb <= 0;
        #50;
        Dm_tb <= 1;
        
        @(posedge clk_tb); //30 cents
        #50;
        Dm_tb <= 0;
        reset_tb <= 1;
        
        //sum of 35
        @(posedge clk_tb);
        #50;
        reset_tb <= 0;
        Dm_tb <= 1;
        
        @(posedge clk_tb); //10 cents
        #50;
        Dm_tb <= 0;
        Qt_tb <= 1;
        
        @(posedge clk_tb); //35 cents
        #50;
        Qt_tb <= 0;
        reset_tb <= 1;
        
        //sum of 40
        @(posedge clk_tb);
        #50;
        reset_tb <= 0;
        Nc_tb <= 1;
        
        @(posedge clk_tb); // 5 cents
        #50;
        Nc_tb <= 0;
        Dm_tb <= 1;
        
        @(posedge clk_tb); // 15 cents
        #50;
        Dm_tb <= 0;
        Qt_tb <= 1;
        
        @(posedge clk_tb); // 40 cents
        #50;
        Qt_tb <= 0;
        reset_tb <= 1;
        
        //sum of 45
        @(posedge clk_tb);
        #50;
        reset_tb <= 0;
        Dm_tb <= 1;
        
        @(posedge clk_tb); //10 cents
        #50;
        Dm_tb <= 0;
        #50;
        Dm_tb <= 1;
        
        @(posedge clk_tb); //20 cents
        #50;
        Dm_tb <= 0;
        Qt_tb <= 1;
        
        @(posedge clk_tb); //45 cents
        Qt_tb <= 0;
    end
endmodule
