# Interface summary

| Signal | Meaning |
|---|---|
| `cfg_period` | PWM period, minimum two clock cycles |
| `cfg_duty_a/b/c` | Channel duty thresholds |
| `cfg_deadtime` | Nonoverlap blanking cycles |
| `pwm_high[2:0], pwm_low[2:0]` | Complementary digital commands |
| `trip` | Immediate output suppression and fault latch |
| `clear_trip` | Clears latch when trip input is low |
| `trip_latched` | Sticky fault indication |
| `phase_count` | Current phase counter |

Input clock, FPGA I/O timing, safety reaction time and fault coverage have not been characterized on hardware.
