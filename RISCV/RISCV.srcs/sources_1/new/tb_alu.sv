`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2017 10:09:25 PM
// Design Name: 
// Module Name: tb_alu
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


module tb_alu(
//    logic clk, reset;
//    logic [31:0] instruction_result;
//    logic [8:0] ra;
);
    logic clk;
    logic [63:0] SrcA;
    logic [63:0] SrcB;
    logic [3:0] ALUCC;
    logic [63:0] ALUResult;
    
        
    always #10 clk = ~clk;

    
    initial begin
        clk = 0;
        SrcA = 2;
        SrcB = 2;
        ALUCC = 0;
    end
    
    always @(posedge clk) begin
        ALUCC <= ALUCC + 4'b0001;
    end
    
    alu tb_alu(
        .SrcA(SrcA),
        .SrcB(SrcB),
        .ALUCC(ALUCC),
        .ALUResult(ALUResult)
    );
    
    initial begin
        #2000;
        $finish;
    end
        
endmodule