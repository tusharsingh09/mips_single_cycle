`ifndef REG_FILE_V
`define REG_FILE_V

module RegFile(
    input wire clk,
    input wire reset,
    input wire [4:0] addr1, addr2, addr3,
    input wire [31:0] data,
    input wire we3, 
    output wire [31:0] rd1, rd2
);

reg [31:0] memory [2**5-1:0];
integer i;

always@(posedge clk or posedge reset) begin
    if(reset) begin
        for(i=0;i<31;i=i+1) memory[i] <= 32'd0;
    end else if(we3) memory[addr3] <= data;
end

assign rd1 = memory[addr1];
assign rd2 = memory[addr2];

endmodule

`endif