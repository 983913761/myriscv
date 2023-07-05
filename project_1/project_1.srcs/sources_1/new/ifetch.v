`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/27 17:30:25
// Design Name: 
// Module Name: ifetch
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


module ifetch(
    input [31:0]    pc_addr_i,
    input [31:0]    rom_inst_i,
    output [31:0]   if2rom_addr_o,
    output [31:0]   inst_addr_o,
    output [31:0]   inst_o
    );
    
    assign if2rom_addr_o = pc_addr_i;
    assign inst_addr_o = pc_addr_i;
    assign inst_o = rom_inst_i;
endmodule
