`default_nettype none

import const_pkg::*;

module CSR #(
    parameter int unsigned DATA_WIDTH = 32
) (
    input logic                     clk,
    input logic                     reset,
    input logic [DATA_WIDTH-1:0]    s2_CSRData,
    input logic                     s2_CSRWrite,    // Control logic
    output logic [DATA_WIDTH-1:0]   output        // From the output in riscv_top.sv and Riscv151.sv
);
    always_ff @(posedge clk) begin
        if (reset) begin
            output <= '0;
        end else if (s2_CSRWrite) begin
            output <= s2_CSRData;
        end
    end
endmodule