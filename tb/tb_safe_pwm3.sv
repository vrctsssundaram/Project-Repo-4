module tb_safe_pwm3;
    timeunit 1ns; timeprecision 1ps;
    reg clk = 0;
    always #5 clk = ~clk;
    reg rst_n=0, enable=1, trip=0, clear_trip=0;
    reg [15:0] period=20, duty_a=5, duty_b=10, duty_c=15, deadtime=2;
    wire [2:0] high_out, low_out;
    wire latched;
    wire [15:0] count;
    integer n;
    reg [2:0] seen_high=0, seen_low=0;
    safe_pwm3 dut (
        .clk(clk), .rst_n(rst_n), .enable(enable), .trip(trip), .clear_trip(clear_trip),
        .cfg_period(period), .cfg_duty_a(duty_a), .cfg_duty_b(duty_b),
        .cfg_duty_c(duty_c), .cfg_deadtime(deadtime),
        .pwm_high(high_out), .pwm_low(low_out), .trip_latched(latched), .phase_count(count)
    );
    always @(posedge clk) if (rst_n) begin
        if ((high_out & low_out) != 0)
            $fatal(1, "Complementary outputs overlap");
        seen_high <= seen_high | high_out;
        seen_low <= seen_low | low_out;
    end
    initial begin
        #22; rst_n=1;
        repeat (110) @(posedge clk);
        if (seen_high != 3'b111 || seen_low != 3'b111)
            $fatal(1, "Not all PWM phases toggled");
        @(negedge clk); trip=1;
        #1; if (high_out != 0 || low_out != 0) $fatal(1, "Trip not immediate");
        @(negedge clk); trip=0;
        #1; if (!latched || high_out != 0 || low_out != 0)
            $fatal(1, "Trip latch failed");
        @(negedge clk); clear_trip=1;
        @(negedge clk); clear_trip=0;
        repeat (25) @(posedge clk);
        if (latched) $fatal(1, "Trip latch did not clear");
        @(negedge clk); enable=0;
        #1; if (high_out != 0 || low_out != 0) $fatal(1, "Disable failed");
        $display("PASS: three-phase PWM, blanking/nonoverlap, immediate trip, latch, clear, disable");
        $finish;
    end
    initial begin #30000; $fatal(1, "Watchdog timeout"); end
endmodule
