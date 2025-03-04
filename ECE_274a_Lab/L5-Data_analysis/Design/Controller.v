`timescale 1ns / 1ps

module Controller(Clk, Rst, go, temp47_58, i_lt_16, done, W_en, R_en,
                  i_clr, i_ld, temp_clr, temp_ld, count_clr, 
			      count_ld, sum_clr, sum_ld);

    input Clk, Rst, go; //go starts the circuit
    input temp47_58; //47 < temp < 58
    input i_lt_16; //addr < 16
    output reg R_en, W_en; //read/write enable for 16x8 reg
    output reg i_clr, i_ld; //clear/load for addr_reg
    output reg count_clr, count_ld; //clear/load for count_reg
    output reg temp_clr, temp_ld; //clear/load for temp_reg
    output reg sum_clr, sum_ld; //clear/load for sum_reg
    output reg done; //controller output
    
    parameter [2:0] SA = 0, SB = 1, SC = 2, SD = 3, SE = 4, SF = 5, SG = 6, SH = 7; //states
    reg [2:0]  state, nextState;
    
    always @ (posedge Clk)
        begin
            if(Rst == 1) begin
                state = SA;
            end
            else begin
                state = nextState;
            end
        end
            
        always @ (*) begin
            case(state)
                SA: begin //Initial
                    W_en = 0; 
                    R_en = 0; 
                    i_clr = 0; 
                    i_ld = 0; 
                    temp_clr = 0; 
                    temp_ld = 0; 
                    count_clr = 0; 
                    count_ld = 0;
                    sum_clr = 0; 
                    sum_ld = 0;
                    done = 0;
                    
                    if (go) begin
                        nextState = SB;
                    end
                    else begin
                        nextState = SA;
                    end
                end
                SB: begin //Clear address, temp, count, and sum
                    W_en = 0; 
                    R_en = 0; 
                    i_clr = 1; 
                    i_ld = 0; 
                    temp_clr = 1; 
                    temp_ld = 0; 
                    count_clr = 1; 
                    count_ld = 0;
                    sum_clr = 1; 
                    sum_ld = 0;
                    done = 0;
                
                    nextState = SC;
                end
                SC: begin //Start of loop
                    W_en = 0; 
                    R_en = 0; 
                    i_clr = 0; 
                    i_ld = 0; 
                    temp_clr = 0; 
                    temp_ld = 0; 
                    count_clr = 0; 
                    count_ld = 0;
                    sum_clr = 0; 
                    sum_ld = 0;
                    done = 0;
                
                    if (i_lt_16) begin
                        nextState = SD;
                    end
                    else begin
                        nextState = SH; //loop ends
                    end
                end
                SD: begin //Read data to temp, add R_data to sum
                    W_en = 0; 
                    R_en = 1; 
                    i_clr = 0; 
                    i_ld = 0; 
                    temp_clr = 0; 
                    temp_ld = 1; 
                    count_clr = 0; 
                    count_ld = 0;
                    sum_clr = 0; 
                    sum_ld = 1;
                    done = 0;
                    
                    nextState = SE;
                end
                SE: begin //Sets values back to zero
                    W_en = 0; 
                    R_en = 0; 
                    i_clr = 0; 
                    i_ld = 0; 
                    temp_clr = 0; 
                    temp_ld = 0; 
                    count_clr = 0; 
                    count_ld = 0;
                    sum_clr = 0; 
                    sum_ld = 0;
                    done = 0;
                    
                    if (temp47_58) begin
                        nextState = SF;
                    end
                    else begin
                        nextState = SG;
                    end
                end
                SF: begin //if 47 < temp < 58: increments count, updates data to temp - 48
                    W_en = 1; 
                    R_en = 0; 
                    i_clr = 0; 
                    i_ld = 0; 
                    temp_clr = 0; 
                    temp_ld = 0; 
                    count_clr = 0; 
                    count_ld = 1;
                    sum_clr = 0; 
                    sum_ld = 0;
                    done = 0;
                    
                    nextState = SG;
                end
                SG: begin //increments address
                    W_en = 0; 
                    R_en = 0; 
                    i_clr = 0; 
                    i_ld = 1; 
                    temp_clr = 0; 
                    temp_ld = 0; 
                    count_clr = 0; 
                    count_ld = 0;
                    sum_clr = 0; 
                    sum_ld = 0;
                    done = 0;
                    
                    nextState = SC; //Restarts loop
                end
                SH: begin //Sets done to 1
                    W_en = 0; 
                    R_en = 0; 
                    i_clr = 0; 
                    i_ld = 0; 
                    temp_clr = 0; 
                    temp_ld = 0; 
                    count_clr = 0; 
                    count_ld = 0;
                    sum_clr = 0; 
                    sum_ld = 0;
                    done = 1;
                    
                    nextState = SA;
                end
                default: begin
                    nextState = SA;
                end                                                                  
            endcase
        end
    endmodule
