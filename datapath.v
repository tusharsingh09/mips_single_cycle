`ifndef DATAPATH_V
`define DATAPATH_V

`include "pc.v"
`include "mux.v"
`include "sign_ext.v"
`include "reg_file.v"
`include "alu.v"

module Datapath(
    input wire clk,
    input wire reset,
    input wire [31:0] instruction,
    input wire [31:0] read_data,
    input wire [2:0] ALUControl,
    input wire Branch,
    input wire MemtoReg,
    input wire ALUSrc,
    input wire RegDest,
    input wire RegWrite,
    output wire [31:0] ALUOut,
    output wire [31:0] PC,
    output wire [31:0] WriteData
);

wire [31:0] next_pc, current_pc;
wire [31:0] SigImm;
wire [31:0] srcB; // for ALU

// outputs of register file
wire [31:0] rd1, rd2;
wire [31:0] wd3; // written back to register file

wire [4:0] addr3;

wire alu_zero;
wire [31:0] alu_result;

SignExtend sign_extend(instruction[15:0], SigImm);

// to select what value to give to PC
// i accidentally made INstruction memory word addressable T-T gotta remove the multiplier of 4
Mux32 pc_mux(current_pc+4, (current_pc+4+(SigImm*4)), alu_zero&Branch, next_pc);

// to select what to give into WD3 of register file
Mux5 reg_file_mux(instruction[20:16], instruction[15:11], RegDest, addr3);

// to select input B of ALU
Mux32 srcB_mux(rd2, SigImm, ALUSrc, srcB);

// to select what to send to register file (eithr from ALU or from data memory)
Mux32 reg_file_write_mux(alu_result, read_data, MemtoReg, wd3);

ProgramCounter prog_counter(clk, reset, next_pc, current_pc);
ALU main_alu(ALUControl, rd1, srcB, alu_result, alu_zero);
RegFile register_file(clk, reset, instruction[25:21], instruction[20:16], addr3, wd3, RegWrite, rd1, rd2);

// all outputs (they goto data memory (all of them))
assign PC = current_pc;
assign ALUOut = alu_result;
assign WriteData = rd2;

endmodule

`endif