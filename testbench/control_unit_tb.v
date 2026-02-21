`timescale 1ns/1ps

module control_unit_tb;

reg [15:0] instruction;

wire [3:0] alu_opcode;
wire [2:0] read_reg1;
wire [2:0] read_reg2;
wire [2:0] write_reg;
wire write_enable;

control_unit dut(
    .instruction(instruction),
    .alu_opcode(alu_opcode),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_enable(write_enable)
);

initial begin
  instruction =0;

  $monitor("time=%0t instruction=%b opcode=%b reg_1=%b reg_2=%b write_reg=%b write_enable=%b",
         $time, instruction, alu_opcode,
         read_reg1, read_reg2, write_reg, write_enable);


// ADD R3,R1,R2
// opcode=0000 dest=011 src1=001 src2=010
#10 instruction = 16'b0000_011_001_010_000;

// SUB R4,R2,R1
#10 instruction = 16'b0001_100_010_001_000;

// MOV R5,R3
#10 instruction = 16'b1000_101_011_000_000;

// CMP R1,R2  (write_enable should be 0)
#10 instruction = 16'b1001_000_001_010_000;

#20 $finish;

end

endmodule
