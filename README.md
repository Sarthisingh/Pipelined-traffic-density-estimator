
# 🚦 Pipelined Hardware Accelerator for Real-Time Traffic Density Estimation

## 📌 Overview

This project implements a pipelined RTL hardware accelerator for real-time traffic density estimation using SystemVerilog and Xilinx Vivado.

The design classifies traffic density into multiple states and dynamically controls traffic signal timing using FSM-based logic.

---

## 🧠 Features

* 3-stage pipelined architecture
* FSM-based traffic control
* Adaptive signal timing
* Real-time density classification
* Self-checking testbench
* Vivado waveform verification

---

## 🛠️ Technologies Used

* SystemVerilog
* Xilinx Vivado
* RTL Design
* FSM Design
* Pipeline Architecture
* Verification

---

## 🏗️ Module Architecture

### Modules

* `traffic_pipeline`
* `traffic_fsm`
* `traffic_light_controller`
* `traffic_top`
* `top_tb`

---

## ⚙️ Pipeline Stages

1. Data Capture
2. Density Classification
3. Output Register

Pipeline latency: 3 clock cycles
Throughput: 1 sample per cycle

---

## 📊 Traffic Density States

| Density | State     |
| ------- | --------- |
| LOW     | NORMAL    |
| MEDIUM  | WARNING   |
| HIGH    | CONGESTED |

---

## 💻 Simulation

Simulation and waveform analysis performed using Xilinx Vivado.

---

## 📈 Results

* Correct density classification
* Adaptive traffic signal timing
* Verified FSM transitions
* Stable registered outputs
* Successful waveform validation

---

## 🔮 Future Enhancements

* FPGA implementation
* AXI4 integration
* Multi-intersection support
* Formal verification

---

## 👨‍💻 Author

Sarthi
