`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2017 01:17:20 PM
// Design Name: 
// Module Name: Instructionmemory_tb
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


module Instructionmemory_tb;
    logic clk, reset;
    logic [31:0] instruction_result;
    logic [8:0] ra;
    
    always #10 clk = ~clk;
    assign ra = 9'b000000000;
    
    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;
    end
    always @(posedge clk) begin
        ra <= ra + 4'b0100;
    end
    instructionmemory Instructionmemory_tb(
        .clk(clk),
        .reset(reset),
        .ra(ra),
        .rd(instruction_result)
    );
    
    initial begin
        #2000;
        $finish;
    end
        
endmodule
