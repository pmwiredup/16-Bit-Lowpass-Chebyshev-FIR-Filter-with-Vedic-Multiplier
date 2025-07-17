# 16-Bit Lowpass Equiripple FIR Filter with Vedic Multiplier and Carry Lookahead Adder

## 🎯 Project Overview

This project implements a **16-tap lowpass equiripple FIR (Finite Impulse Response) filter** optimized for high-speed digital signal processing applications. The design features a custom **16-bit Vedic multiplier** with **carry lookahead adders** to achieve time-efficient multiplication operations in the filter's convolution process.

### Key Features
- **16-tap FIR filter** with equiripple response
- **Sampling frequency**: 1 MHz
- **Cutoff frequency**: 400kHz
- **Passband frequency**: 200kHz
- **Stopband frequency**: 355kHz 
- **16-bit signed arithmetic** throughout the signal path
- **Vedic multiplication** for high-speed parallel processing
- **Carry lookahead adders** for optimized addition operations
- **Fully synthesizable Verilog HDL** implementation

---

## 📚 Technical Background

### 🔄 Equiripple FIR Filters

For this project, an equiripple FIR filter with the above-given specifications was created using MATLAB Filter Designer. This made it easy to obtain the accurate filter coefficients, which are important for convolution purpose as shown below:

<img width="762" height="621" alt="image" src="https://github.com/user-attachments/assets/9be95622-62fc-45d8-861e-328142a101de" />

### ⚡ Vedic Multipliers

Vedic multipliers are based on ancient Indian **Vedic Mathematics** principles, specifically the **Urdhva Tiryagbhyam** (vertically and crosswise) sutra. This approach enables:

#### Advantages:
- **Parallel processing** of partial products
- **Reduced complexity** compared to conventional multipliers
- **High speed** due to simultaneous calculations
- **Regular structure** suitable for VLSI implementation

**Note:** The module for Vedic Multiplier with CLA has been directly fetched from an earlier project, which can be accessed here - https://github.com/pmwiredup/Vedic-multiplier-with-CLA.

## Future Enhancements
- I'm working to improve the design further by analysing the frequency dependence on timing and power constraints.

## Acknowledgments

- A small discussion and idea by my project mentor, Dr. Abhishek K Gupta, at IIT-Kanpur, on FIR filters and how they're so essential in Digital Signal Processing (DSP) and the requirement of them being low powered. 
- The **Vedic multiplier with carry lookahead adder** implementation is based on my previous project on high-speed arithmetic units
- Filter coefficient generation using the **Parks-McClellan algorithm**.

