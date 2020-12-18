`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/16 22:36:15
// Design Name: 
// Module Name: pulse
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


module pulse(clk, reset, key_in, sum);

    input clk;
    input reset;
    input key_in;
    
    output [7:0] sum;
    
    reg flag;
    reg [31:0] count;
    reg state;
    
    parameter cnt_num = 50_000_000/100;
    
    always @ (posedge clk)
    begin
    
        if(reset)
            begin
                flag <= 0;
                count <= 0;
                state <= 0;
            end
        else
            case(state)
                0   :   begin
                            if(!key)
                                begin
                                    if(count < cut_num - 1)
                                        begin
                                        
                                        end
                                end
                            
                        end
            
            
            endcase
        
        
        
    end

endmodule
