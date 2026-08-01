# Parameterized Universal Shift Register

A parameterized Universal Shift Register designed using **Verilog HDL** and verified through simulation in **Xilinx Vivado**.

The design supports four operations: **Hold, Shift Right, Shift Left, and Parallel Load**.

---

## 📌 Project Overview

A Universal Shift Register is a sequential digital circuit capable of storing and shifting binary data.

This project implements a reusable, parameterized design where the register width can be changed using the `WIDTH` parameter.

Default configuration:

```verilog
parameter WIDTH = 8;
