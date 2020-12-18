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
    
    reg [31:0] counter; //32λʱ��
    reg clk_1hz;
    
    parameter cnt_num = 4;
/*
    //��50MHzʱ�ӷ�Ƶ���ֵ�1Hz
    always @ (posedge clk or negedge rst_n)			//()��д�����źű��ʽ������������/ʱ����ʽ�����ñ��ʽ�б���ֵ�ı�ʱ���ͻ���������������е�ִ��		���������������ź���or���ӣ�
    begin											//�����źţ����������Ͷ�Ӧʱ���·��posedge��negedge�����ؼ�������ʱ���ź�	posedge��ʾʱ���ź���������Ϊ��������
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
                    clk_1hz <= ~clk_1hz;    //clk_1hzȡ��������1sʱ������
                end
  
    end
*/
    reg [1:0] state; //����״̬��״̬��д��ˮ��
    
    always @ (posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            begin
                led <= 4'b1111;//�Ƶ͵�ƽ��Ч
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
