IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_safe_pwm3 -o build/sim rtl/safe_pwm3.sv tb/tb_safe_pwm3.sv
	$(VVP) build/sim

YOSYS ?= yosys
.PHONY: synth
synth:
	mkdir -p build
	$(YOSYS) -Q -T -l build/synthesis.log -p 'read_verilog -sv rtl/safe_pwm3.sv; hierarchy -check -top safe_pwm3; synth -top safe_pwm3; stat'
