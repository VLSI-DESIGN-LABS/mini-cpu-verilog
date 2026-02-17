`timescale 1ns / 1ps


module alu(
  input [7:0]a,
  input [7:0]b,
  input [3:0]opcode,
  output reg [7:0]result,
  output reg zero_flag,
  output reg overflow_flag,
  output reg carry_flag);
  reg [8:0]temp; 
  always @(*)
    begin 
      zero_flag=0;
      carry_flag=0;
      overflow_flag=0;
       case(opcode)
             4'b0000:begin 
                 temp=a+b;
                 result=temp[7:0];
                 carry_flag=temp[8];
                 overflow_flag=temp[8];
                 end 
             4'b0001:begin
                 temp=a-b;
                 result=temp[7:0];
                 zero_flag=(result==0);
                 carry_flag=temp[8];
                 overflow_flag=temp[8];
                 end
           
           4'b0010: result = a & b;   
           4'b0011: result = a | b;   
           4'b0100: result = ~a;  
           4'b0101: result = a ^ b;     
           4'b0110: result = ~(a & b); 
           4'b0111: result = ~(a | b); 
           4'b1000: result = b; 
         default:result=8'b00000000;
    endcase 
    end
endmodule

