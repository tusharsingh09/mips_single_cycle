`ifndef ALU_V
`define ALU_V

module ALU(
    input wire [2:0] ALUCtrl,
    input wire [31:0] a, b,
    output reg [31:0] result,
    output wire zero
);

always@(*) begin
    case(ALUCtrl)
    3'b010: result = a+b; 
    3'b110: result = a-b;
    3'b000: result = a&b;
    3'b001: result = a|b;
    3'b111: result = a << b;
    endcase
end

assign zero = (result == 32'd0);

endmodule

`endif