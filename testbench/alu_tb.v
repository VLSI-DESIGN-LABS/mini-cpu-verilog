`timescale 1ns / 1ps

module alu_tb;
  reg [7:0]a;
  reg [7:0]b;
  reg [3:0]opcode;
  wire [7:0]result;
  wire zero_flag;
  wire overflow_flag;
  wire carry_flag;
  alu dut(
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result),
    .zero_flag(zero_flag),
    .overflow_flag(overflow_flag),
    .carry_flag(carry_flag)
  );
  initial begin 
    a=8'b10010101; 
    b=8'b01011010;
$monitor("time=%0t opcode=%b a=%b b=%b result=%b zero=%b carry=%b overflow=%b", $time, opcode, a, b, result, zero_flag, carry_flag, overflow_flag);

   #10 opcode=4'b0000;
   #10 opcode=4'b0001;
   #10 opcode=4'b0010;
   #10 opcode=4'b0011;
   #10 opcode=4'b0100;
   #10 opcode=4'b0101;
   #10 opcode=4'b0110;
   #10 opcode=4'b0111;
   #10 opcode=4'b1000;
   #10 $finish;
  end 
endmodule
