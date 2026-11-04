# Verification record

Date: 04 November 2026
Source revision tested: `388ca927acaa3338db2ab32c52426dd364e86914`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-4/actions/runs/41869711512

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | three-phase PWM, blanking/nonoverlap, immediate trip, latch, clear, disable |
| FPGA synthesis / utilization | **Not run** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.
