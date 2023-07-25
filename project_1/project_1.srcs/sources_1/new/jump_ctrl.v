`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/13 08:08:10
// Design Name: 
// Module Name: jump_ctrl
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


module jump_ctrl(
        input  wire [31:0] jump_addr_i,
        input  wire jump_en_i  ,
        input  wire hold_flag_i ,
        
        output reg [31:0] jump_addr_o,
        output reg jump_en_o  ,
        output reg hold_flag_o 
    );
    
    always@(*)
    begin
        jump_addr_o = jump_addr_i;
        jump_en_o = jump_en_i;
        if(jump_en_i || hold_flag_i)
            hold_flag_o = 1'b1;
        else
            hold_flag_o = 1'b0;
    end
endmodule

