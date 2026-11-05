# Test procedure

Run `make test` and verify a zero exit status and `PASS`. Confirm the hosted regression for the same commit.

The test checks transitions on all three channels, complementary nonoverlap, immediate trip suppression, sticky shutdown, explicit clear and global disable.

`make synth` reproduces the generic Yosys RTL synthesis check.
