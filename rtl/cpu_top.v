module cpu_top(
    input clk,
    input [15:0] instruction
);

// control signals
wire [3:0] alu_opcode;
wire [2:0] read_reg1, read_reg2, write_reg;
wire write_enable;

// register outputs
wire [7:0] read_data1, read_data2;

// ALU outputs
wire [7:0] alu_result;
wire zero_flag, overflow_flag, carry_flag; 
  
//control unit
control_unit CU(
    .instruction(instruction),
    .alu_opcode(alu_opcode),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_enable(write_enable)
);

// REGISTER FILE
register_file RF(
    .clk(clk),
    .write_enable(write_enable),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(alu_result),
    .read_data1(read_data1),
    .read_data2(read_data2)
);
  
// ALU
alu ALU(
    .a(read_data1),
    .b(read_data2),
    .opcode(alu_opcode),
    .result(alu_result),
    .zero_flag(zero_flag),
    .overflow_flag(overflow_flag),
    .carry_flag(carry_flag)
);

endmodule
