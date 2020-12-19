`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/18 16:06:07
// Design Name: 
// Module Name: led_run
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_run(clk, rst_n, led);
    
    input clk;
    input rst_n;
    output reg [3:0] led;
     
    reg [1:0] state; //定义状态，状态机写流水灯
    
    always @ (posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                led <= 4'b1111;//灯低电平有效
                state <= 0;
            end
        else
            case(state)
                0   :   begin
                            led <= 4'b0111;
                            state <= 1;
                        end
                        
                1   :   begin
                            led <= 4'b1011;
                            state <= 2;
                        end
                2   :   begin
                            led <= 4'b1101;
                            state <= 3;
                        end
                3   :   begin
                            led <= 4'b1110;
                            state <= 0;
                        end
                default:    state <= 0;
            endcase
    
    
    end
    
endmodule
