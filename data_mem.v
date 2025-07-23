`ifndef DATA_MEM_V
`define DATA_MEM_V

`define DEBUG_DATAMEM

module DataMemory(
    input wire clk,
    input wire reset,
    input wire [31:0] addr,
    input wire we,
    input wire [31:0] data,
    output wire[31:0] rd
);

// Limit this to 16 as well
reg [31:0] memory [2**16-1:0];
integer i;

always@(posedge clk or posedge reset) begin
    if(reset) for(i=0;i<2*16-1;i=i+1) memory[i] <= 32'd0;
    else if(we) memory[addr] <= data;
    
`ifdef DEBUG_DATAMEM
    $writememh("data.hex", memory, 0, 2**16-1);
`endif
end

assign rd = memory[addr];

endmodule

`endif