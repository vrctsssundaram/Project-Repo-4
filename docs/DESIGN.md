# Technical design

Each of three channels compares a shared phase counter against its active duty threshold. A transition-blanking counter forces both complementary outputs low for the configured duration after a logical edge. The asynchronous trip input directly gates outputs and also latches a fault on the next clock. The fault remains until cleared while trip is inactive.

This is synchronous digital control logic, not a complete motor drive. The system must additionally implement gate-driver fault handling, hardware interlocks, current measurement and suitable analog protection.
