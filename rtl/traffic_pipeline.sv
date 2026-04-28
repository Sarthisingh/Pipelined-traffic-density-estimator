module traffic_pipeline (
    input  logic        clk,
    input  logic        rst,
    input  logic [7:0]  vehicle_count,
    output logic [1:0]  density
);


    logic [7:0] stage1;
    logic [1:0] stage2;

    
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            stage1 <= 0;
        else
            stage1 <= vehicle_count;
    end

    // Stage 2: Processing (combinational inside sequential stage)
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            stage2 <= 0;
        else begin
            if (stage1 <= 10)
                stage2 <= 2'b00;
            else if (stage1 <= 30)
                stage2 <= 2'b01;
            else
                stage2 <= 2'b10;
        end
    end

    // Stage 3: Output register
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            density <= 0;
        else
            density <= stage2;
    end

endmodule
