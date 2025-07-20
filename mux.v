`ifndef MUX_V
`define MUX_V

module Mux5(
    input wire [4:0] I0, I1,
    input wire s,
    output wire [4:0] out
);
assign out = s?I1:I0;
endmodule

module Mux32(
    input wire [31:0] I0, I1,
    input wire s,
    output wire [31:0] out
);
assign out = s?I1:I0;
endmodule

`endif