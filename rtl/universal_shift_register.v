module universal_shift_register #(
    parameter WIDTH = 8
)(
    input  wire             clk,
    input  wire             reset,
    input  wire [1:0]       sel,
    input  wire             serial_in,
    input  wire [WIDTH-1:0] parallel_in,
    output reg  [WIDTH-1:0] q
);

    always @(posedge clk) begin

        if (reset) begin
            q <= {WIDTH{1'b0}};
        end
        else begin
            case (sel)

                2'b00: q <= q;                          // Hold

                2'b01: q <= {serial_in, q[WIDTH-1:1]};  // Shift Right

                2'b10: q <= {q[WIDTH-2:0], serial_in};  // Shift Left

                2'b11: q <= parallel_in;                // Parallel Load

                default: q <= q;

            endcase
        end

    end

endmodule
