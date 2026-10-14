```markdown
# Processor Architecture

A Verilog-based processor design project implementing a RISC-V-inspired architecture with both sequential and pipelined execution models. The project focuses on digital design fundamentals, datapath/control logic, pipelining, hazard resolution, and simulation-based verification.

## Overview

This project explores the design and implementation of a processor at the hardware description level using Verilog. It contains modular RTL implementations for various processor units, including:
- Arithmetic Logic Unit (ALU)
- Instruction Fetch stage
- Decode stage
- Execute stage
- Memory stage
- Writeback stage
- Hazard detection and forwarding logic
- Pipeline control logic

The repository includes two major architectures:
1. Sequential processor implementation
2. Pipelined processor implementation

## Features

- RISC-V style instruction execution flow
- Modular Verilog design for reusable hardware blocks
- ALU support for arithmetic, logical, shift, and comparison operations
- Pipeline execution for improved throughput
- Hazard detection to prevent incorrect data flow
- Forwarding logic for dependency handling
- Testbench-based functional verification
- Simulation waveform analysis for debugging and validation

## Included Modules

- `src/` : core combinational and arithmetic logic modules
- `sequential/` : sequential processor implementation
- `pipelined/` : pipelined processor implementation
- `processor.v` : top-level processor module
- `processor_tb.v` : testbench for processor verification

## Supported Operations

- Addition
- Subtraction
- AND / OR / XOR
- Shift Left Logical (SLL)
- Shift Right Logical (SRL)
- Shift Right Arithmetic (SRA)
- Set Less Than (SLT)
- Set Less Than Unsigned (SLTU)

## Design Goals

- Understand processor architecture at the RTL level
- Model a working datapath and control unit
- Compare sequential and pipelined execution
- Handle data hazards and pipeline dependencies
- Validate design correctness using simulation

## Simulation

This project is designed for simulation using a Verilog simulator such as:
- Icarus Verilog (`iverilog`)
- GTKWave for waveform viewing

Example workflow:
```bash
iverilog processor_tb.v -o processor.out
vvp processor.out
```

Waveform inspection can be done with GTKWave:
```bash
gtkwave processor_tb.vcd
```

## Project Structure

```text
Processor-architecture/
├── src/
│   ├── adder.v
│   ├── alu.v
│   ├── and.v
│   ├── mux.v
│   ├── sll.v
│   ├── slt.v
│   ├── sltu.v
│   ├── sra.v
│   ├── srl.v
│   ├── subtract.v
│   └── xor.v
├── sequential/
│   ├── processor.v
│   ├── processor_tb.v
│   └── ...
├── pipelined/
│   ├── processor.v
│   ├── Hazard.v
│   ├── forwarding.v
│   ├── processor_tb.v
│   └── ...
├── README.md
└── ...
```
