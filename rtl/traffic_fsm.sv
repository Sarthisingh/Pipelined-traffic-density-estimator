module traffic_fsm (
    input  logic        clk,
    input  logic        rst,
    input  logic [1:0]  density,
    output logic [1:0]  state
);

    typedef enum logic [1:0] {
        IDLE       = 2'b00,
        NORMAL     = 2'b01, // low traffic
        WARNING    = 2'b10, // medium traffic
        CONGESTED  = 2'b11  // high traffic
    } state_t;

    state_t current_state;

    // State register
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= IDLE;
        else begin
            case (density)
                2'b00: current_state <= NORMAL;
                2'b01: current_state <= WARNING;
                2'b10: current_state <= CONGESTED;
                default: current_state <= NORMAL;
            endcase
        end
    end

    assign state = current_state;

endmodule
