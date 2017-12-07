`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2017 03:44:09 PM
// Design Name: 
// Module Name: basys3_wrapper
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


module basys3_wrapper(
    input clk,
    input btnR,
    output [6:0] seg,
    output dp,
    output [3:0] an
    );
    
    //wire [63:0] alu_result;
    logic [15:0] alu_result;
    reg [43:0] clk_divide;
    wire seg_disp_clk;
    wire processor_clk;
    
    assign dp = 1'b1;
    assign seg_disp_clk = clk_divide[15];//[17]
    assign processor_clk = clk_divide[26];//[28]
    
    
    RISC_V 
        processor_31L(
        .clk(processor_clk), 
        .reset(btnR),
        .ALU_Result(alu_result)
        );
    
    always_ff @(posedge clk) begin
        if (btnR)
            clk_divide = 0;
        else
            clk_divide = clk_divide + 'd1;
    end
    
    seg_display
        seg_display0 (
        .clk (seg_disp_clk),
        .rst (btnR),
        .data_in (alu_result[15:0]),
        .seg (seg),
        .an (an)
        );
    
    
endmodule 
