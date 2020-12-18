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
    
    reg [31:0] counter; //32位时钟
    reg clk_1hz;
    
    parameter cnt_num = 4;
/*
    //对50MHz时钟分频，分到1Hz
    always @ (posedge clk or negedge rst_n)			//()中写敏感信号表达式，即触发条件/时间表达式，当该表达式中变量值改变时，就会引发其中语句序列的执行		两个或以上敏感信号用or连接，
    begin											//敏感信号：边沿敏感型对应时序电路，posedge、negedge两个关键字描述时钟信号	posedge表示时钟信号上升沿作为触发条件
        if(!rst_n)
            begin
                counter <= 0;
                clk_1hz <= 0;
            end
        else
            if(counter < cnt_num)
                counter <= counter + 1;
            else
                begin
                    counter <= 0;
                    clk_1hz <= ~clk_1hz;    //clk_1hz取反，就是1s时钟周期
                end
  
    end
*/
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
