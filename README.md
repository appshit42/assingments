# VLSI Design Assignments

**Student:** Adrika  
**Area:** VLSI and Digital Design  
**Language:** Verilog HDL  
**Simulation:** Icarus Verilog (`iverilog`, `vvp`)

## About This Folder

This directory contains a collection of digital design assignments written in Verilog. The work includes arithmetic circuits, sequential logic, a linear feedback shift register, and a Simplified AES (S-AES) implementation.

## Assignment Projects

| Folder | Project | Main topics |
|---|---|---|
| `aes/` | Simplified Advanced Encryption Standard (S-AES) | S-box, key expansion, ShiftRows, MixColumns, AddRoundKey |
| `cla/` | Carry Lookahead Adder | 4-bit and 16-bit addition, carry generation |
| `counter/` | Four-bit Up/Down Counter | Clock division, reset, increment and decrement |
| `lfsr/` | Linear Feedback Shift Register | State shifting, feedback, seed selection |
| `rpa/` | Ripple Adder Project | Full adders and 8-bit/16-bit arithmetic |

## Tools

- Icarus Verilog for compiling and simulating Verilog designs
- `vvp` for running compiled simulations
- GTKWave or another VCD viewer for inspecting waveform files
- A text editor or Verilog-capable IDE

Check that Icarus Verilog is available:

```sh
iverilog -V
vvp -V
```

## Running Simulations

Each assignment may have its own source files, testbench, and compile command. Run commands from the relevant project folder. For example, a simple module and its testbench can be compiled and simulated with:

```sh
iverilog -g2012 -Wall -s <testbench_module> -o simulation <design_files.v> <testbench_file.v>
vvp simulation
```

Replace `<testbench_module>` with the module name declared by the testbench, and list all required Verilog source files. Some projects may need corrections or external modules before they compile.

## Review and Checklist Files

- [`saes_checklist.sh`](saes_checklist.sh): compiles and checks the S-AES files in this folder.
- [`run_assignment_checks.sh`](run_assignment_checks.sh): runs Icarus checks for the sibling assignment folders as well. It expects the folder layout shown above and should be run from this `aes/` directory:

  ```sh
  bash run_assignment_checks.sh
  ```

- [`Adrika_SA_Verilog_Review.txt`](Adrika_SA_Verilog_Review.txt): written review of the current files in all five project folders, including issues, next steps, and an overall readiness score.
- [`RISC_V_5_STAGE_PROCESSOR_PROJECT.md`](RISC_V_5_STAGE_PROCESSOR_PROJECT.md): proposed five-stage RISC-V processor project brief.
- [`RISC_V_TOOLCHAIN_AND_WORKFLOW.md`](RISC_V_TOOLCHAIN_AND_WORKFLOW.md): tools, setup commands, and workflow for the proposed RISC-V project.

## Current Status

The folders contain useful design work, but some modules and testbenches need fixes before all projects build and verify cleanly. The review file lists the observed compile issues and recommended next steps. Simulation completion alone does not prove correctness; testbenches should compare outputs against expected values and report pass or fail.

## Tags

`VLSI` `Verilog` `Digital-Design` `Icarus-Verilog` `Simulation` `Adder` `Counter` `LFSR` `S-AES` `RISC-V`
