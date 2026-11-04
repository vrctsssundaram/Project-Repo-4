# TripGuard-PWM3

Three-channel complementary PWM controller with programmable duty, period and transition blanking (dead time). A direct hardware trip input suppresses all outputs immediately and sets a latched shutdown until explicitly cleared.

Configuration is sampled at the PWM period boundary. Use `make test` for the self-checking regression.

Project owner: Sundaram S S.
