`ifndef PC_V
`define PC_V

module ProgramCounter(
    input wire clk,
    input wire reset,
    input wire [31:0] pc_next,
    output wire [31:0] pc
);

reg [31:0] latched_pc;
always@(posedge clk or posedge reset) begin
    if(reset) latched_pc <= 32'd0;
    else latched_pc <= pc_next;
end
assign pc = latched_pc;

endmodule

`endif