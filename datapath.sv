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
    output logic [INS_W-1:0] instruction
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
    
//    always @(posedge reset) begin
//        init <= 9'b000000000;
//    end
    
    always @(posedge clk or negedge reset) begin
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
    assign IM_addr = PC_out;
    instructionmemory IM(
        .ra(PC_out), 
        .rd(IM_out)
        );
//    always @(posedge clk) begin
//        $display ("Instruction is %b", IM_out);
//    end
    assign instruction = IM_out;
    assign regwire = IM_out;
    regfile rf(
        .clk(clk),
        .reset(reset), 
        .RegWrite(RegWrite), 
        .ra1(regwire[19:15]), 
        .ra2(regwire[24:20]), 
        .wa(regwire[11:7]), 
        .wd(dm_mux_out), 
        .rd1(read_data_1), 
        .rd2(read_data_2)
        );
//    always @(posedge clk) begin
//        $display("read data 1 is %b", read_data_1);
//        $display("read data 2 is %b", read_data_2);
//    end
    imm_Gen sign_extender(
        .inst_code(regwire), 
        .Imm_out(extender_out)
        );
    mux2 ALU_mux(
        .d0(read_data_2), 
        .d1(extender_out), 
        .s(ALUsrc), 
        .y(mux_out)
        );
    alu dp_alu(
        .SrcA(read_data_1), 
        .SrcB(mux_out), 
        .ALUCC(ALU_CC), 
        .ALUResult(ALUout)
        );
    datamemory dm(MemRead, MemWrite, ALUout[8:0], read_data_2, dm_out);
    mux2 dm_mux(
//        .d0(dm_out),
//        .d1(ALUout),
        .d0(ALUout),
        .d1(dm_out),
        .s(MemtoReg), 
        .y(dm_mux_out)
        );
    
    assign ALUresult = ALUout;
    

            
endmodule
