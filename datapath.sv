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
    output logic [DATA_W-1:0] ALUresult,
    output logic [INS_W-1:0] instruction,
    output logic [DATA_W-1:0] Mux_out,
    output logic [DATA_W-1:0] rd1_out,
    output logic [DATA_W-1:0] rd2_out,
    output logic [8:0] PC_output
    );
    reg [8:0] adder_b;
    reg [8:0] init;
    wire [8:0] IM_addr;
    logic [8:0] adder_out;
    wire [8:0] PC_out;
    logic [31:0] IM_out;
    wire [31:0] regwire;
    wire [63:0]extender_out;
    wire [63:0] read_data_1;
    wire [63:0] read_data_2;
    wire [63:0] mux_out;
    wire [63:0] ALUout;
    wire [63:0] dm_out;
    wire [63:0] dm_mux_out;
    assign adder_b = 4'b0100;
    
    assign Mux_out = mux_out;
    
    assign rd1_out = read_data_1;
    assign rd2_out = read_data_2;
    
    always @(posedge clk) begin
        if (reset == 1) begin
            init = 9'b000000000;
        end
        else begin
            init <= PC_out;
        end
    end
    flopr flipflop(
        .clk(clk), 
        .reset(reset), 
        .d(adder_out), 
        .q(PC_out)
    );
    adder ad(
        .a(init), 
        .b(adder_b), 
        .y(adder_out)
        );
//    assign IM_addr = PC_out;
    assign PC_output = PC_out;
    instructionmemory IM(
        .ra(PC_out), 
        .rd(IM_out)
        );
    always @(posedge clk) begin
        $display ("Instruction is %b", IM_out);
    end
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
