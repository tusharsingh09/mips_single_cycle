`ifndef CPU_V
`define CPU_V

`include "datapath.v"
`include "instr_mem.v"
`include "data_mem.v"
`include "alu_decoder.v"
`include "main_decoder.v"

module CPU(
    input wire clk,
    input wire reset
);

wire [31:0] instruction;
wire [31:0] read_data;

// Datapath outputs (Data memory & instruction memory inputs)
wire [31:0] ALUOut;
wire [31:0] PC;
wire [31:0] WriteData;

wire [1:0] ALUOp;
wire [2:0] ALUControl;
wire Branch;
wire MemtoReg;
wire ALUSrc;
wire RegDest;
wire RegWrite;
wire MemWrite;

Datapath datapath(
    clk, 
    reset,
    instruction,
    read_data,
    ALUControl,
    Branch,
    MemtoReg,
    ALUSrc,
    RegDest,
    RegWrite,
    ALUOut,
    PC,
    WriteData
);

InstructionMemory instr_mem(PC, instruction);

DataMemory data_mem(
    clk,
    reset,
    ALUOut,
    MemWrite,
    WriteData,
    read_data
);

ALUDecoder alu_dec(
    ALUOp,
    instruction[5:0],
    ALUControl
);

MainDecoder main_dec(
    instruction[31:26],
    instruction[5:0],
    RegWrite,
    RegDest,
    ALUSrc,
    Branch,
    MemWrite,
    MemtoReg,
    ALUOp
);

endmodule

`endif