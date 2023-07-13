`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/10 10:49:27
// Design Name: 
// Module Name: soc
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


module soc(
    input wire clk,
    input wire rst_n
    );
    
    wire [31:0] core2rom_inst_addr;
    wire [31:0] rom2core_inst;
    core core_0(
    .clk            (clk),
    .rst_n          (rst_n),
    .inst_addr_o    (core2rom_inst_addr),
    .inst_i         (rom2core_inst)
    );
    
    rom rom_0(
    .inst_addr_i     (core2rom_inst_addr),
    .inst_o          (rom2core_inst)
    );
    
    
endmodule
