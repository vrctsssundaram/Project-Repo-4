# Technical design

Each of three channels compares a shared phase counter against its active duty threshold. A transition-blanking counter forces both complementary outputs low for the configured duration after a logical edge. The asynchronous trip input directly gates outputs and also latches a fault on the next clock. The fault remains until cleared while trip is inactive.

The controller generates complementary PWM and trip-gated outputs. External gate drivers, current sensing, hardware interlocks and analog protection form the surrounding power-stage interface.
