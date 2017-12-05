`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 03:44:04 PM
// Design Name: 
// Module Name: imm_Gen
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


module imm_Gen(
    input logic [31:0] inst_code,
    output logic [63:0] Imm_out
    );
    
    assign Imm_out[11:0] = (inst_code[6:0] == 7'b0000011) ? inst_code[31:20]:
                            ((inst_code[6:0] == 7'b0010011) ? inst_code[31:20]:
                            ((inst_code[6:0] == 7'b1100111) ? inst_code[31:20]:
                            ((inst_code[6:0] == 7'b0100011) ? inst_code[31:25]:
                            1'bz)));
    assign Imm_out[63:12] = (inst_code[6:0] == 7'b0000011) ? {52{Imm_out[11]}}:
                            ((inst_code[6:0] == 7'b0010011) ? {52{Imm_out[11]}}:
                            ((inst_code[6:0] == 7'b1100111) ? {52{Imm_out[11]}}:
                            ((inst_code[6:0] == 7'b0100011) ? {57{Imm_out[6]}}:
                            1'bz)));
    
//    always begin
//        if (inst_code[6:0] == 7'b0000011) begin
//            Imm_out[11:0] = inst_code[31:20];
//            Imm_out[63:12] = {52{Imm_out[11]}};
//        end
//        else if (inst_code[6:0] == 7'b0010011) begin
//            Imm_out[11:0] = inst_code[31:20];
//            Imm_out[63:12] = {52{Imm_out[11]}};
//        end
//        else if (inst_code[6:0] == 7'b1100111) begin
//            Imm_out[11:0] = inst_code[31:20];
//            Imm_out[63:12] = {52{Imm_out[11]}};
//        end
//        else if (inst_code[6:0] == 7'b0100011) begin
//            Imm_out[6:0] = inst_code[31:25];
//            Imm_out[63:7] = {57{Imm_out[6]}};
//        end
//    end
    
    
    
endmodule
