module register_file_tb;
  reg clk,write_enable;
  reg [2:0]read_reg1,read_reg2,write_reg;
  reg [7:0]write_data;
  wire [7:0]read_data1,read_data2;
  register_file dut(
    .clk(clk),
    .write_enable(write_enable),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2));
    always #5 clk=~clk;
    
  initial begin 
    read_reg1=0;
    read_reg2=0;
    clk = 0;
    write_enable = 0;
    $monitor("time=%0t we=%b write_reg=%b write_data=%d read1=%d read2=%d",
         $time, write_enable, write_reg, write_data, read_data1, read_data2);

    #10 write_enable = 1;
        write_reg = 3'b000;
        write_data = 8'd13;

    #10 write_enable=1;
        write_reg = 3'b001;
        write_data = 8'd25;

    // stop writing
    #10 write_enable = 0;
        read_reg1 = 3'b000;
        read_reg2 = 3'b001;


    #20 $finish;
  end 
endmodule
  
