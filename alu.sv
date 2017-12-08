`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 04:19:13 PM
// Design Name: 
// Module Name: alu
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


module alu #(
    parameter DATA_WIDTH = 64,
    parameter OPCODE_LENGTH = 4
)(
    input logic [DATA_WIDTH-1:0] SrcA,
    input logic [DATA_WIDTH-1:0] SrcB,
    input logic [OPCODE_LENGTH-1:0] ALUCC,
    output logic [DATA_WIDTH-1:0] ALUResult
    );
    
//    logic [63:0] var_1 = SrcA * SrcB;
//    assign ALUResult = (ALUCC == 4'b0000)? (SrcA * SrcB):
//                       (ALUCC == 4'b0001)? (SrcA | SrcB):
//                       (ALUCC == 4'b0010)? (SrcA + SrcB):
//                       (ALUCC == 4'b0110)? (SrcA - SrcB):
//                       1'bz;
    always @(SrcA or SrcB or ALUCC)begin
        if(ALUCC == 4'b0000) begin
            ALUResult <= SrcA & SrcB;
        end
        else if (ALUCC == 4'b0001) begin
            ALUResult <= SrcA | SrcB;
        end
        else if (ALUCC == 4'b0010) begin
            ALUResult <= SrcA + SrcB;
        end
        else if (ALUCC == 4'b0110) begin
            ALUResult <= SrcA - SrcB;
        end
        $display("ALUCC is %b", ALUCC);
        $display("SrcA is %b", SrcA);
        $display("SrcB is %b", SrcB);
        $display("result is %b", ALUResult);
    end
endmodule
