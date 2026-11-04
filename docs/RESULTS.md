# Verification record

Date: 05 November 2026
Source revision tested: `9ca42f3eeba002430b8f8f8c144a9c5ce2b097ff`
Hosted regression: https://github.com/vrctsssundaram/Project-Repo-4/actions/runs/41903102539
Hosted generic synthesis: https://github.com/vrctsssundaram/Project-Repo-4/actions/runs/41903102489

| Measurement | Recorded result |
|---|---|
| SystemVerilog compilation | **PASS** (`iverilog -g2012 -Wall`) |
| Self-checking simulation | **PASS** (`vvp`, exit code 0) |
| Directed checks | three-phase PWM, blanking/nonoverlap, immediate trip, latch, clear, disable |
| Generic Yosys synthesis | **PASS**; 826 technology-independent cells |
| Device-specific FPGA/ASIC utilization | **Not measured** |
| Static timing / Fmax | **Not measured** |
| Power and hardware throughput | **Not measured** |

The recorded checks apply to the named revision and exercise the bounded first implementation. No waveform image, fabricated timing report or estimated resource figure is presented as measured evidence.

The generic cell count is obtained from the cited Yosys `stat` output, not an FPGA LUT estimate, ASIC area, or timing result.
