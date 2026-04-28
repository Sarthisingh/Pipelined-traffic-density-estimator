module traffic_top (
    input  logic clk,
    input  logic rst,
    input  logic [7:0] vehicle_count,
    output logic [1:0] density,
    output logic [1:0] state,
    output logic red,
    output logic yellow,
    output logic green
);

    traffic_pipeline u1 (
        .clk(clk),
        .rst(rst),
        .vehicle_count(vehicle_count),
        .density(density)
    );

    traffic_fsm u2 (
        .clk(clk),
        .rst(rst),
        .density(density),
        .state(state)
    );

    traffic_light_controller u3 (
        .clk(clk),
        .rst(rst),
        .state(state),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

endmodule
