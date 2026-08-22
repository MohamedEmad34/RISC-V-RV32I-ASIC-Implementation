# RISC-V RV32I Processor — RTL to GDSII

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![ISA](https://img.shields.io/badge/ISA-RV32I-orange)
![Architecture](https://img.shields.io/badge/Architecture-32--bit-green)
![Implementation](https://img.shields.io/badge/Implementation-Single--Cycle-purple)
![ASIC](https://img.shields.io/badge/Flow-RTL%20to%20GDSII-red)
![Status](https://img.shields.io/badge/Status-In%20Development-yellow)

A complete **32-bit RISC-V RV32I processor** designed from RTL and planned for full **ASIC implementation from RTL to GDSII**.

This project is currently **under active development**. The processor is being built incrementally, starting from individual RTL modules and unit-level verification, followed by processor integration, synthesis, timing/power analysis, and physical implementation.

---

## 🚧 Project Status

> **Project Started — Active Development**

The project is being developed step-by-step with a focus on both **digital design correctness** and **ASIC implementation readiness**.

### Current Progress

| Stage | Status |
|---|:---:|
| Architecture Specification | ✅ |
| ISA Definition | ✅ |
| Datapath Definition | ✅ |
| ALU Design | 🚧 |
| ALU Verification | ⏳ |
| Register File | ⏳ |
| Instruction Decoder | ⏳ |
| Immediate Generator | ⏳ |
| Control Unit | ⏳ |
| Program Counter | ⏳ |
| Branch / Jump Logic | ⏳ |
| Memory Interface | ⏳ |
| RV32I Core Integration | ⏳ |
| System-Level Verification | ⏳ |
| Logic Synthesis | ⏳ |
| Area Analysis | ⏳ |
| Timing Analysis | ⏳ |
| Power Analysis | ⏳ |
| Floorplanning | ⏳ |
| Power Planning | ⏳ |
| Placement | ⏳ |
| Clock Tree Synthesis | ⏳ |
| Routing | ⏳ |
| Parasitic Extraction | ⏳ |
| Post-Route STA | ⏳ |
| Physical Verification | ⏳ |
| GDSII Generation | ⏳ |

---

## 🎯 Project Objective

The main objective of this project is to design and physically implement a functional **RV32I RISC-V processor**, starting from RTL and progressing through the complete ASIC design flow.

The project aims to demonstrate practical experience in:

- Digital system architecture
- RISC-V instruction set architecture
- RTL design using Verilog HDL
- Functional verification
- Computer architecture
- Logic synthesis
- Static Timing Analysis (STA)
- Power analysis
- ASIC physical design
- Floorplanning
- Placement
- Clock Tree Synthesis (CTS)
- Routing
- Parasitic extraction
- Physical verification
- GDSII generation

---

## 🏗️ Processor Specification

The first version of the processor will use a simple **single-cycle RV32I architecture**.


| Parameter | Specification |
|---|---|
| Architecture | RISC-V |
| ISA | RV32I |
| Data Width | 32-bit |
| Instruction Width | 32-bit |
| Registers | 32 × 32-bit |
| Register `x0` | Hardwired to `0` |
| Execution | Single-Cycle |
| Pipeline | None |
| Clock | Single Clock |
| Target Technology | FreePDK45 / NangateOpenCellLibrary |
| Final Target | GDSII |


---

## 📚 Supported Instructions

### R-Type

```text
ADD
SUB
AND
OR
XOR
SLT
```
### R-Type
```text
ADDI
ANDI
ORI
```
### Load / Store

```text
LW
SW
```
### Branch

```text
BEQ
BNE
```
### Jump

```text
JAL
```
---
## 🧩 Processor Architecture

The initial processor datapath is organized around the following major blocks:

                  ┌─────────────────────┐
                  │       PC            │
                  └──────────┬──────────┘
                             │
                             ▼
                  ┌─────────────────────┐
                  │  Instruction Memory │
                  └──────────┬──────────┘
                             │
                             ▼
                  ┌─────────────────────┐
                  │ Instruction Decoder │
                  └──────────┬──────────┘
                             │
                ┌────────────┴────────────┐
                ▼                         ▼
        ┌───────────────┐       ┌────────────────┐
        │ Register File │       │ Immediate Gen. │
        └───────┬───────┘       └────────┬───────┘
                │                        │
                └────────────┬───────────┘
                             ▼
                       ┌───────────┐
                       │    ALU    │
                       └─────┬─────┘
                             │
                  ┌──────────┴──────────┐
                  ▼                     ▼
           ┌─────────────┐       ┌─────────────┐
           │ Data Memory │       │ Write Back  │
           └─────────────┘       └──────┬──────┘
                                        │
                                        ▼
                                  Register File

---
## 🔨 Development Methodology
The processor is being developed incrementally rather than as a single RTL block.
Architecture
     ↓
RTL Module
     ↓
Unit Testbench
     ↓
Waveform Verification
     ↓
Integration
     ↓
System Verification
     ↓
Synthesis
     ↓
ASIC Physical Implementation
Each major RTL block will be verified independently before being integrated into the processor.
---
## 📂 Project Structure
RISC-V-RV32I-ASIC-Implementation/
│
├── RTL/
│   ├── alu/
│   ├── register_file/
│   ├── decoder/
│   ├── immediate_generator/
│   ├── control_unit/
│   ├── program_counter/
│   ├── branch_unit/
│   ├── memories/
│   └── rv32i_core/
│
├── Verification/
│   ├── alu_tb/
│   ├── register_file_tb/
│   ├── decoder_tb/
│   ├── immediate_generator_tb/
│   └── rv32i_core_tb/
│
├── constraints/
│
├── Synthesis/
│   ├── scripts/
│   ├── netlist/
│   └── reports/
│
├── Physical_Design/
│   ├── floorplan/
│   ├── power/
│   ├── placement/
│   ├── CTS/
│   ├── routing/
│   ├── extraction/
│   └── reports/
│
├── images/
│   ├── architecture/
│   ├── verification/
│   ├── synthesis/
│   ├── floorplan/
│   ├── placement/
│   ├── CTS/
│   ├── routing/
│   └── GDS/
│
├── docs/
│
└── README.md
---
## 🛠️ Tools
| Tool                     | Purpose                       |
| ------------------------ | ----------------------------- |
| Verilog HDL              | RTL Design                    |
| VCS / Simulation Tool    | Functional Verification       |
| Synopsys Design Compiler | Logic Synthesis               |
| Synopsys IC Compiler     | Physical Design               |
| NangateOpenCellLibrary   | Standard Cell Library         |
| FreePDK45                | Target Technology Environment |
---
## 📊 ASIC Implementation Targets
The final implementation will be evaluated using:

*Standard-cell area
*Cell count
*Sequential / combinational cell count
*Utilization
*Maximum routing congestion
*Clock skew
*Clock latency
*Setup WNS / TNS
*Hold WNS / TNS
*Dynamic power
*Leakage power
*Total power
*DRC violations
*LVS status
*Final GDSII generation

Final measured results will be added here as the physical implementation progresses.
---
## 📈 Implementation Results
This section will be continuously updated during the project.
| Metric         |    Result |
| -------------- | --------: |
| Technology     | FreePDK45 |
| Cell Count     |       TBD |
| Core Area      |       TBD |
| Utilization    |       TBD |
| WNS            |       TBD |
| TNS            |       TBD |
| Hold WNS       |       TBD |
| Hold TNS       |       TBD |
| Clock Skew     |       TBD |
| Dynamic Power  |       TBD |
| Leakage Power  |       TBD |
| Total Power    |       TBD |
| DRC Violations |       TBD |
| LVS            |       TBD |
| GDSII          |       TBD |
---
## 🔬 Future Improvements
After completing the first single-cycle implementation, future revisions may include:

*Additional RV32I instructions
*Improved verification environment
*Pipeline implementation
*Hazard detection
*Forwarding unit
*Branch prediction
*Performance optimization
*Area optimization
*Power optimization
*Timing optimization
*Physical-design optimization
