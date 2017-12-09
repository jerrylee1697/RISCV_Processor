`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2017 02:57:26 PM
// Design Name: 
// Module Name: instructionmemory
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


module instructionmemory #(
    parameter INS_ADDRESS = 9,
    parameter INS_W = 32
    )(
    input logic [ INS_ADDRESS -1:0] ra , // Read address of the instruction memory ,
    // comes from PC
    output logic [ INS_W -1:0] rd // Read Data
    );
logic [INS_W -1 :0] Inst_mem [(2**( INS_ADDRESS -2)) -1:0];

assign rd = Inst_mem [ra[ INS_ADDRESS -1:2]]; // Take 7 upper bits of address .
                                              // each instruction has 32 bits (4 byte )
                                              
//// --------------- Lab 9 Instructions ---------------
//// write the program in binary code into the Inst_mem
//assign Inst_mem [0] = 32'h00007033 ;
//// 0000 0000 0000 00001 110 00000 011 0011; and r0 = r0 & r0    h0
//assign Inst_mem [1] = 32'h00100093 ;
//// 0000 0000 0001 00000 000 00001 001 0011; addi r1 = r0 + h1   h1
//assign Inst_mem [2] = 32'h00200113 ;
//// 0000 0000 0010 00000 000 00010 001 0011; addi r2 = r0 + h2   h2
//assign Inst_mem [3] = 32'h00208433 ;
//// 0000000 00010 00001 000 01000 011 0011; add r8 = r1+r2       h3
//// ---------------------------------------------------

// --------------- Github Instructions ---------------
//assign Inst_mem[0]  = 32'h00007033;//  0000000 00000 00000 111 00000 011 0011;     and r0,r0,r0              
//assign Inst_mem[1]  = 32'h00100093;//  0000 0000 0001 00000 000 00001 001 0011;    addi r1,r0, 1         h1 
//assign Inst_mem[2]  = 32'h00200113;//  0000 0000 0010 00000 000 00010 001 0011;    addi r2,r0, 2         h2
//assign Inst_mem[3]  = 32'h00308193;//  0000 0000 0011 00001 000 00011 001 0011;    addi r3,r1, 3         h4  
//assign Inst_mem[4]  = 32'h00408213;//  0000 0000 0100 00001 000 00100 001 0011;    addi r4,r1, 4         h5
//assign Inst_mem[5]  = 32'h00510293;//  0000 0000 0101 00010 000 00101 001 0011;    addi r5,r2, 5         h7
//assign Inst_mem[6]  = 32'h00610313;//  0000 0000 0110 00010 000 00110 001 0011;    addi r6,r2, 6         h8
//assign Inst_mem[7]  = 32'h00718393;//  0000 0000 0111 00011 000 00111 001 0011;    addi r7,r3, 7         hB

//assign Inst_mem[8]   = 32'h00208433;//  0000000 00010 00001 000 01000 011 0011;    add r8  = r1+r2       h3
//assign Inst_mem[9]   = 32'h404404b3;//  0100000 00100 01000 000 01001 011 0011;    sub r9  = r8-r4       hfffffffe -2 
//assign Inst_mem[10]  = 32'h00317533;//  0000000 00011 00010 111 01010 011 0011;    and r10 = r2 & r3     h0
//assign Inst_mem[11]  = 32'h0041e5b3;//  0000000 00100 00011 110 01011 011 0011;    or  r11 = r3 | r4     h5
//assign Inst_mem[12]  = 32'h02a02823;//  0000001 01010 00000 010 10000 010 0011;    sw  48(r0)<-- r10     h30 
//assign Inst_mem[13]  = 32'h16802023;//  0001011 01000 00000 010 00000 010 0011;    sw  352(r0)<-- r8     h160
//assign Inst_mem[14]  = 32'h03002603;//  0000 0011 0000 00000 010 01100 000 0011;   lw r12 <-- 48(r0)     h30
//assign Inst_mem[15]  = 32'h16002603;//  0001 0110 0000 00000  010 01100 000 0011;  lw r12 <-- 352(r0)    h160
//// --------------- -------------------- --------------

assign Inst_mem[0]  = 32'h00007033;//  0000000 00000 00000 111 00000 011 0011;     and r0,r0,r0              
assign Inst_mem[1]  = 32'h00100093;//  0000 0000 0001 00000 000 00001 001 0011;    addi r1,r0, 1         h1 
assign Inst_mem[2]  = 32'h00200113;//  0000 0000 0010 00000 000 00010 001 0011;    addi r2,r0, 2         h2
assign Inst_mem[3]  = 32'h00308193;//  0000 0000 0011 00001 000 00011 001 0011;    addi r3,r1, 3         h4  
assign Inst_mem[4]  = 32'h00408213;//  0000 0000 0100 00001 000 00100 001 0011;    addi r4,r1, 4         h5
assign Inst_mem[5]  = 32'h00510293;//  0000 0000 0101 00010 000 00101 001 0011;    addi r5,r2, 5         h7
assign Inst_mem[6]  = 32'h00610313;//  0000 0000 0110 00010 000 00110 001 0011;    addi r6,r2, 6         h8
assign Inst_mem[7]  = 32'h00718393;//  0000 0000 0111 00011 000 00111 001 0011;    addi r7,r3, 7         hB

assign Inst_mem[8]   = 32'h00320433;//  0000000 00011 00100 000 01000 011 0011;    add r8  = r4+r3       h9
assign Inst_mem[9]   = 32'h0023F533;//  0000000 00010 00111 111 01010 011 0011;    and r9  = r7&r2       h2 
assign Inst_mem[10]  = 32'h40310433;//  0100000 00011 00010 000 01000 011 0011;    sub r10 = r2 - r3     hFFFE
assign Inst_mem[11]  = 32'h0010E5B3;//  0000000 00001 00001 110 01011 011 0011;    or  r11 = r1 | r1     h1
assign Inst_mem[12]  = 32'h02a02823;//  0000001 01010 00000 010 10000 010 0011;    sw  48(r0)<-- r10     h30 
assign Inst_mem[13]  = 32'h16802023;//  0001011 01000 00000 010 00000 010 0011;    sw  352(r0)<-- r8     h160
assign Inst_mem[14]  = 32'h03002603;//  0000 0011 0000 00000 010 01100 000 0011;   lw r12 <-- 48(r0)     h30
assign Inst_mem[15]  = 32'h16002603;//  0001 0110 0000 00000  010 01100 000 0011;  lw r12 <-- 352(r0)    h160
assign Inst_mem[16]  = 32'h00108433;//  0000000 00001 00001 000 01000 011 0011;    add r16 = r1+r1       h2
assign Inst_mem[17]  = 32'h408404B3;//  0100000 01000 01000 000 01001 011 0011;    sub r17 = r8-r8       h0 
assign Inst_mem[18]  = 32'h0031F533;//  0000000 00011 00011 111 01010 011 0011;    and r18 = r3 & r3     h4
assign Inst_mem[19]  = 32'h0041E5B3;//  0000000 00100 00011 110 01011 011 0011;    or  r19 = r3 | r4     h5
endmodule
