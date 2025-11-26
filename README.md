# RISC-V-5-stage-pipeline-processor
5-Stage RISC-V Pipeline CPU (SystemVerilog)

A fully modular 5-stage RISC-V pipelined processor implemented in SystemVerilog, supporting core RV32I instructions with cycle-accurate execution. The design includes:

Pipeline Stages: IF → ID → EX → MEM → WB

Hazard Handling: Load-use stall unit, full forwarding (EX/MEM/WB bypassing)

Functional Units: PC, ROM, ALU, Register File, Immediate Generator

Control Path: Branch detection + flush, ALU control, memory control

Data Path: Load/store aligned memory, pipeline registers, branch target calc

Debug Features: Register write tracing, memory access logs, WB-stage trace

Verification

Automated self-checking testbench developed using Synopsys VCS

Waveform debugging and signal-level trace analysis using Synopsys Verdi

Validated: ALU operations, register writes, pipeline stalls, forwarding, branch execution, and memory correctness
