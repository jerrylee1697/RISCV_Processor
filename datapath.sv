`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 04:36:40 PM
// Design Name: 
// Module Name: datapath
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

module datapath #(
    parameter PC_W = 9,
    parameter INS_W = 32,
    parameter RF_ADDRESS = 5,
    parameter DATA_W = 64,
    parameter DM_ADDRESS = 9,
    parameter ALU_CC_W = 4
)(
    input logic clk, reset,
    RegWrite, MemtoReg,
    ALUsrc, MemWrite,
    MemRead,
    input logic [ALU_CC_W-1:0] ALU_CC,
    output logic [DATA_W:0] ALUresult,
    output logic [INS_W-1:0] instruction
    );
    reg [8:0] adder_b;
    reg [8:0] init;
    wire [8:0] IM_addr;
    logic [8:0] adder_out;
    logic [8:0] PC_out;
    logic [32:0] IM_out;
    wire [32:0] regwire;
    wire [63:0]extender_out;
    wire [63:0] read_data_1;
    wire [63:0] read_data_2;
    wire [63:0] mux_out;
    wire [63:0] ALUout;
    wire [63:0] dm_out;
    wire [63:0] dm_mux_out;
    assign adder_b = 4'b0100;
    always @(posedge clk) begin
        if (reset == 1) begin
            init = 9'b000000000;
        end
        else begin
            init <= PC_out;
        end
    end
    flopr flipflop(clk, reset, adder_out, PC_out);
    adder ad(init, adder_b, adder_out);
    assign IM_addr = PC_out;
    instructionmemory IM(IM_addr, IM_out);
    assign instruction = IM_out;
    assign regwire = IM_out;
    regfile rf(clk, RegWrite, regwire[19-15], regwire[24-20], regwire[11-7], dm_mux_out, read_data_1, read_data_2);
    
    imm_Gen sign_extender(regwire, extender_out);
    mux2 ALU_mux(read_data_2, extender_out, ALUsrc, mux_out);
    alu dp_alu(read_data_1, mux_out, ALU_CC, ALUout);
    datamemory dm(MemRead, MemWrite, ALUout[8:0], read_data_2, dm_out);
    mux2 dm_mux(dm_out, ALUout, dm_mux_out);
    
    assign ALUresult = ALUout;
    

            
endmodule
