`include "cpu.v"
`timescale 1ns/1ns

module tb_cpu();

reg clk, reset;

CPU dut(
    clk, 
    reset
);

initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0, tb_cpu);
    clk = 1'b0;
    reset = 1'b1;
    #2 reset = 1'b0;
end

always #5 clk = ~clk;
always #1 if($time == 100) $finish;

endmodule