`timescale 1ns/1ps

module cpu_top_tb;

reg clk;
reg [15:0] instruction;

// instantiate cpu
cpu_top dut(
    .clk(clk),
    .instruction(instruction)
);

// clock
always #5 clk = ~clk;

initial begin
    clk = 0;

    $display("Starting CPU simulation...");

    // -------- PROGRAM START --------

    // MOV R1, R0  (we'll first load values manually using MOV style)
    // but since no immediate instruction,
    // we will preload using direct sequence later if needed

    // ADD R3 = R1 + R2
    // opcode=0000 dest=011 src1=001 src2=010
    #10 instruction = 16'b0000_011_001_010_000;

    // SUB R4 = R3 - R1
    #10 instruction = 16'b0001_100_011_001_000;

    // AND R5 = R3 & R4
    #10 instruction = 16'b0010_101_011_100_000;

    // OR R6 = R5 | R1
    #10 instruction = 16'b0011_110_101_001_000;

    // MOV R7 = R6
    #10 instruction = 16'b1000_111_110_000_000;

    #50 $finish;
end

endmodule
