`ifndef SIGNEXT_V
`define SIGNEXT_V

module SignExtend(
    input wire [15:0] in,
    output wire [31:0] out
);
assign out = {{16{in[15]}}, in};
endmodule

`endif