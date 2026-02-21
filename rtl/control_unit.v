module control_unit(
    input [15:0] instruction,

    output reg [3:0] alu_opcode,
    output reg [2:0] read_reg1,
    output reg [2:0] read_reg2,
    output reg [2:0] write_reg,
    output reg write_enable
);

always @(*) begin
    alu_opcode = instruction[15:12];
    write_reg  = instruction[11:9];
    read_reg1  = instruction[8:6];
    read_reg2  = instruction[5:3];
   
    write_enable = 1;

    case(alu_opcode)
        4'b1001: write_enable = 0; 
        default: write_enable = 1;
    endcase

end

endmodule
