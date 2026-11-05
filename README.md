# Three-channel PWM trip controller

Three-channel complementary PWM generator with programmable deadtime and trip latch.

## Features

- Period-boundary configuration sampling
- Nonoverlap deadtime control
- Trip-driven output suppression and clear behavior

## Run

```sh
make test
make synth
```

Design sources are in `rtl/`, directed tests in `tb/`, and interface, architecture, testing and measured results in `docs/`.

**Architecture:** Three-channel complementary PWM controller with deadtime and asynchronous trip suppression.

Project owner: Sundaram S S.
