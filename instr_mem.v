`ifndef INSTRUCTION_MEM_V
`define INSTRUCTION_MEM_V

// Contains assembly code
module InstructionMemory(
    input wire [31:0] addr,
    output wire [31:0] out
);

// this should be ideally [2**32-1:0] but since verilog cannot have arrays this big
// we use only 16 LSB
reg [31:0] memory [2**16-1:0];
initial $readmemh("./examples/instruction.hex", memory, 0, 3);

assign out = memory[addr[31:2]];

endmodule

`endif