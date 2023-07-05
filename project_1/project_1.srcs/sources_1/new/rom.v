`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/27 17:50:07
// Design Name: 
// Module Name: rom
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


module rom(
    input [31:0] inst_addr_i,
    output reg [31:0] inst_o
    );
    
    reg [31:0] rom_mem[0:11];
    always@(*)
    begin
        inst_o = rom_mem[inst_addr_i>>2];
    end
endmodule
