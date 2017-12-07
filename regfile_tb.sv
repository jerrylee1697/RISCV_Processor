`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2017 04:32:53 PM
// Design Name: 
// Module Name: regfile_tb
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


module tb_regfile(

    );
        logic clk, reset;
        logic RegWrite;
        logic [4:0] ra1, ra2, wa;
        logic [63:0] wd;
        logic [63:0] rd1, rd2;
        
        
        
        always #10 clk = ~clk;
        
        initial begin
            clk = 0;
            reset = 1;
            #20 reset = 0;
            ra1 = 5'b00000;
            ra2 = 5'b00000;
            wa = 5'b00000;
            RegWrite = 1;
            wd = 64'h1;
        end
        always @(posedge clk) begin
              ra1 <= ra1 + 5'b00001;
              ra2 <= ra2 + 5'b00001;
              wa  <= wa +5'b00001;
              wd = wd +1;
        end
        regfile tb_regfile(
            .clk(clk), .reset(reset),
            .RegWrite(RegWrite),
            .ra1(ra1), .ra2(ra2), .wa(wa),
            .wd(wd), 
            .rd1(rd1), .rd2(rd2)
        );
        
        
        initial begin
            #2000;
            $finish;
        end
            
    endmodule
