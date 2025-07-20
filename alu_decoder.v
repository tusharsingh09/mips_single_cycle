`ifndef ALU_DECODER_V
`define ALU_DECODER_V

module ALUDecoder(
    input wire [1:0] ALUOp,
    input wire [5:0] funct,
    output reg [2:0] ALUControl
);

always@(*) begin
    if(ALUOp == 2'b00) ALUControl = 3'b010;
    else if(ALUOp == 2'bx1) ALUControl = 3'b110;
    else if(ALUOp == 2'b1x) begin
        case(funct)
        6'b100000: ALUControl = 3'b010;
        6'b100010: ALUControl = 3'b110;
        6'b100100: ALUControl = 3'b000;
        6'b100101: ALUControl = 3'b001;
        6'b101010: ALUControl = 3'b111;
        endcase 
    end
end

endmodule

`endif