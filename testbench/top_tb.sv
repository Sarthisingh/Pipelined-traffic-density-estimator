module top_tb;

    // Signals
    logic clk;
    logic rst;
    logic [7:0] vehicle_count;
    logic [1:0] density;
    logic [1:0] state;
    logic red, yellow, green;

    // DUT
    traffic_top dut (
        .clk(clk),
        .rst(rst),
        .vehicle_count(vehicle_count),
        .density(density),
        .state(state),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock generation (10 time unit period)
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        clk = 0;
        rst = 1;
        vehicle_count = 0;

        // Reset
        #10 rst = 0;

        // Test LOW traffic
        vehicle_count = 5;
        #100;

        // Test MEDIUM traffic
        vehicle_count = 20;
        #100;

        // Test HIGH traffic
        vehicle_count = 40;
        #150;

        $finish;
    end

    // Monitor EVERYTHING (important)
    initial begin
        $monitor("Time=%0t | Veh=%0d | Density=%b | State=%b | R=%b Y=%b G=%b",
                 $time, vehicle_count, density, state, red, yellow, green);
    end

endmodule
