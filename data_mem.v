`ifndef DATA_MEM_V
`define DATA_MEM_V

module DataMemory(
    input wire clk,
    input wire [31:0] addr,
    input wire we,
    input wire [31:0] data,
    output wire[31:0] rd
);

reg [31:0] memory [2*32-1:0];

assign rd = memory[addr];

endmodule

`endif 