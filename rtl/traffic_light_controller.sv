module traffic_light_controller (
    input  logic clk,
    input  logic rst,
    input  logic [1:0] state,   // from FSM
    output logic red,
    output logic yellow,
    output logic green
);

    typedef enum logic [1:0] {
        S_RED    = 2'b00,
        S_GREEN  = 2'b01,
        S_YELLOW = 2'b10
    } light_state_t;

    light_state_t current, next;

    logic [4:0] counter;
    logic [4:0] green_time;
    logic [4:0] red_time;

    // ✅ Adaptive timing based on traffic
    always_comb begin
        case (state)
            2'b01: begin // NORMAL (low traffic)
                green_time = 5;
                red_time   = 12;
            end
            2'b10: begin // WARNING (medium traffic)
                green_time = 10;
                red_time   = 10;
            end
            2'b11: begin // CONGESTED (high traffic)
                green_time = 15;  // ✅ MORE GREEN
                red_time   = 5;   // ✅ LESS RED
            end
            default: begin
                green_time = 5;
                red_time   = 10;
            end
        endcase
    end

    // ✅ State register + counter
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            current <= S_RED;
            counter <= 0;
        end else begin
            if (current != next) begin
                current <= next;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // ✅ Next state logic
    always_comb begin
        next = current;

        case (current)
            S_RED:
                if (counter >= red_time)
                    next = S_GREEN;

            S_GREEN:
                if (counter >= green_time)
                    next = S_YELLOW;

            S_YELLOW:
                if (counter >= 3)
                    next = S_RED;
        endcase
    end

    // ✅ Output logic
    always_comb begin
        red    = (current == S_RED);
        green  = (current == S_GREEN);
        yellow = (current == S_YELLOW);
    end

endmodule
