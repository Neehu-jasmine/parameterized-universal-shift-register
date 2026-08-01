`timescale 1ns / 1ps

module universal_shift_register_tb;

    parameter WIDTH = 8;

    // Testbench signals
    reg                 clk;
    reg                 reset;
    reg  [1:0]          sel;
    reg                 serial_in;
    reg  [WIDTH-1:0]    parallel_in;

    wire [WIDTH-1:0]    q;

    // Design Under Test
    universal_shift_register #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .reset(reset),
        .sel(sel),
        .serial_in(serial_in),
        .parallel_in(parallel_in),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin

        // Initial values
        clk = 0;
        reset = 0;
        sel = 2'b00;
        serial_in = 0;
        parallel_in = 8'b00000000;

        // Test 1: Reset
        #10;
        reset = 1;

        #10;
        reset = 0;

        // Test 2: Parallel Load
        sel = 2'b11;
        parallel_in = 8'b10101010;

        #10;

        // Test 3: Shift Right
        sel = 2'b01;
        serial_in = 1'b1;

        #10;

        // Test 4: Shift Left
        sel = 2'b10;
        serial_in = 1'b1;

        #10;

        // Test 5: Hold
        sel = 2'b00;

        #10;

        // End simulation
        $finish;

    end

endmodule
