# RISC-V Single Cycle Processor with I Extension

Welcome to the **RISC-V Single Cycle Processor** project! This repository contains the design and synthesis of a single-cycle RISC-V processor implementing the I extension, synthesized using Cadence Excellium and tested using Google Tracer IP.

## Overview

This project demonstrates the implementation of a single-cycle RISC-V processor, designed to execute the base integer instruction set (I-extension) efficiently in a single clock cycle. The processor has been meticulously crafted and tested to ensure reliability and accuracy in various scenarios, making it a robust solution for educational purposes and further development in RISC-V architecture.

## Features

- **Single-Cycle Design**: All instructions are executed in a single clock cycle, ensuring a straightforward implementation with predictable performance.
- **RISC-V I Extension**: Supports the base integer instruction set, including all necessary arithmetic, logical, memory access, and control flow operations.
- **Synthesis with Cadence Excellium**: The design has been synthesized and optimized using Cadence Excellium, ensuring high performance and low power consumption.
- **Tested with Google Tracer IP**: Rigorous testing has been performed using Google's Tracer IP to validate the design against standard benchmarks and edge cases.


## Directory Breakdown

### `rtl/` (Register Transfer Level)

This directory contains all the Verilog files (`.sv`) that describe the hardware implementation of the single-cycle RISC-V processor.

- **Key Components:**
  - **Multiplexers** (`ASel_mux.sv`, `BSel_mux.sv`): Components to select among different inputs.
  - **ALU and Logic** (`alu_logic.sv`): Performs arithmetic and logical operations.
  - **Control Units** (`control_unit.sv`): Generates control signals based on the instruction opcode.
  - **Memory** (`data_mem.sv`, `inst_mem.sv`): Handles data and instruction storage.
  - **Program Counter** (`program_counter.sv`, `pc4.sv`): Maintains the address of the current instruction.
  - **Registers** (`rf.sv`): Implements the register file for storing general-purpose registers.
  - **Top Module** (`top.sv`): Integrates all components into a complete single-cycle processor.

### `tb/` (Testbenches)

This directory includes testbench files used to verify the functionality of each module in the `rtl/` directory.

- **Testbenches for Individual Modules** (e.g., `alu_logic_tb.sv`, `control_unit_tb.sv`): Simulate each RTL component independently to verify its correctness.
- **Top-Level Testbench** (`top_tb.sv`): Simulates the entire processor to ensure all modules work together as expected.

## Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/bilal7317/RV32I_Single_Cycle.git
   cd RV32I_Single_Cycle

2. **Install Necessary Tools:**
While this project was synthesized using Cadence Excellium and tested with Google Tracer IP, you can use any software that supports SystemVerilog files (.sv). The RTL and testbench files provided in this repository are compatible with a variety of digital design tools.

3. **Run Simulations:**
Use the provided testbenches to verify the functionality of the design in your preferred simulation environment.

**Contributing**
We welcome contributions from the community! Please feel free to fork the repository, make enhancements, and submit a pull request. For any major changes, please open an issue first to discuss what you would like to change.
