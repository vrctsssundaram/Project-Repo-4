module safe_pwm3 #(
    parameter integer COUNTER_W = 16
) (
    input  wire                 clk,
    input  wire                 rst_n,
    input  wire                 enable,
    input  wire                 trip,
    input  wire                 clear_trip,
    input  wire [COUNTER_W-1:0] cfg_period,
    input  wire [COUNTER_W-1:0] cfg_duty_a,
    input  wire [COUNTER_W-1:0] cfg_duty_b,
    input  wire [COUNTER_W-1:0] cfg_duty_c,
    input  wire [COUNTER_W-1:0] cfg_deadtime,
    output wire [2:0]           pwm_high,
    output wire [2:0]           pwm_low,
    output reg                  trip_latched,
    output reg  [COUNTER_W-1:0] phase_count
);
    reg [COUNTER_W-1:0] active_period, active_deadtime;
    reg [COUNTER_W-1:0] duty_a, duty_b, duty_c;
    reg [COUNTER_W-1:0] blank [0:2];
    reg [2:0] last_level;
    wire [2:0] next_level = {
        (phase_count < duty_c),
        (phase_count < duty_b),
        (phase_count < duty_a)
    };
    wire outputs_allowed = enable && !trip && !trip_latched;
    genvar j;
    generate
        for (j=0; j<3; j=j+1) begin: g_output
            assign pwm_high[j] = outputs_allowed && (blank[j] == 0) && last_level[j];
            assign pwm_low[j]  = outputs_allowed && (blank[j] == 0) && !last_level[j];
        end
    endgenerate

    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            phase_count <= 0;
            active_period <= 16'd20;
            active_deadtime <= 0;
            duty_a <= 0;
            duty_b <= 0;
            duty_c <= 0;
            last_level <= 0;
            trip_latched <= 0;
            for (i=0; i<3; i=i+1) blank[i] <= 0;
        end else begin
            if (trip)
                trip_latched <= 1;
            else if (clear_trip)
                trip_latched <= 0;

            if (phase_count >= active_period-1'b1) begin
                phase_count <= 0;
                active_period <= (cfg_period < 2) ? 2 : cfg_period;
                duty_a <= cfg_duty_a;
                duty_b <= cfg_duty_b;
                duty_c <= cfg_duty_c;
                active_deadtime <= cfg_deadtime;
            end else begin
                phase_count <= phase_count + 1'b1;
            end

            for (i=0; i<3; i=i+1) begin
                if (next_level[i] != last_level[i]) begin
                    last_level[i] <= next_level[i];
                    blank[i] <= active_deadtime;
                end else if (blank[i] != 0) begin
                    blank[i] <= blank[i] - 1'b1;
                end
            end
        end
    end
endmodule
