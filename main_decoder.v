`ifndef MAIN_DECODER_V
`define MAIN_DECODER_V

module MainDecoder(
    input wire [5:0] opcode,
    input wire [5:0] funct,
    output reg RegWrite,
    output reg RegDest,
    output reg ALUSrc,
    output reg Branch,
    output reg MemWrite,
    output reg MemtoReg,
    output reg [1:0] ALUOp
);

always@(*) begin
    case(opcode)
    
    // r tyep
    6'b000000: begin
        RegWrite = 1'b1;
        RegDest = 1'b1;
        ALUSrc = 1'b0;
        Branch = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 1'b0;
        ALUOp = 2'b10;
    end

    // load
    6'b100011: begin
        RegWrite = 1'b1;
        RegDest = 1'b0;
        ALUSrc = 1'b1;
        Branch = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 1'b0;
        ALUOp = 2'b00;
    end

    // save
    6'b101011: begin
        RegWrite = 1'b0;
        RegDest = 1'b0;
        ALUSrc = 1'b1;
        Branch = 1'b0;
        MemWrite = 1'b1;
        MemtoReg = 1'b0;
        ALUOp = 2'b00;
    end

    // branch
    6'b000100: begin
        RegWrite = 1'b0;
        RegDest = 1'b0;
        ALUSrc = 1'b0;
        Branch = 1'b1;
        MemWrite = 1'b0;
        MemtoReg = 1'b0;
        ALUOp = 2'b01;
    end
    
    // addi
    6'b001000: begin
        RegWrite = 1'b1;
        RegDest = 1'b0;
        ALUSrc = 1'b1;
        Branch = 1'b0;
        MemWrite = 1'b0;
        MemtoReg = 1'b0;
        ALUOp = 2'b00;
    end

    endcase
end

endmodule

`endif