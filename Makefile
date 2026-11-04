IVERILOG ?= iverilog
VVP ?= vvp
.PHONY: test
test:
	mkdir -p build
	$(IVERILOG) -g2012 -Wall -s tb_safe_pwm3 -o build/sim rtl/safe_pwm3.sv tb/tb_safe_pwm3.sv
	$(VVP) build/sim
