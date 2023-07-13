`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/07 14:53:21
// Design Name: 
// Module Name: tb
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


module tb(

    );
    
reg clk;
reg rst_n;
always #10 clk = ~clk;

initial begin
clk <= 1;
rst_n <= 0;
#30
rst_n <= 1;
end

initial begin
    $readmemb("inst_test.mem",tb.soc_0.rom_0.rom_mem);
end

initial begin
    while(1)begin
        @(posedge clk)
        $display("x27:",tb.soc_0.core_0.regs_0.regs[27]);
        $display("x28:",tb.soc_0.core_0.regs_0.regs[28]);
        $display("x29:",tb.soc_0.core_0.regs_0.regs[29]);
        $display("---------------------------------");
    end
end

soc soc_0(
.clk(clk),
.rst_n(rst_n)
);
endmodule
