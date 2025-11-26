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
!(image alt)([image_url)](https://github.com/rajendragunji24/RISC-V-5-stage-pipeline-processor/blob/19fb61e35b9f382a83aa2d631c3bcfffeb683b55/waveform1)
!(image alt)([image_url](https://github.com/rajendragunji24/RISC-V-5-stage-pipeline-processor/blob/b868737c18a3672785c4d2423c824574407b5c51/waveform2))
!(image alt)([image_url](https://github.com/rajendragunji24/RISC-V-5-stage-pipeline-processor/blob/ad3e31963bee422baec2b96d72128a901819d015/waveform3))
!(image alt)(image_url)
