`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/05 16:08:49
// Design Name: 
// Module Name: ex
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


module ex(
    input wire [31:0]   inst_i,
    input wire [31:0]   inst_addr_i,
    input wire [31:0]   op1_i,
    input wire [31:0]   op2_i,
    input wire [31:0]   rd_addr_i,
    input wire [31:0]   rd_wen_i,
    
    output reg[4:0]     rd_addr_o,
    output reg[31:0]    rd_data_o,
    output reg          rd_wen_o
);
endmodule
