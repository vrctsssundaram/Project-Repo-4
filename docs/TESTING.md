# Test procedure

Run `make test` and verify a zero exit status and `PASS`. Confirm the hosted regression for the same commit.

The test checks transitions on all three channels, no simultaneous complementary assertion, immediate trip suppression, sticky shutdown, explicit clear and global disable.

Before power-stage operation, test dead-time across extreme duty ratios, reset behavior, asynchronous trip capture, clock failure, external gate-driver interlocks and all output pin timing.
