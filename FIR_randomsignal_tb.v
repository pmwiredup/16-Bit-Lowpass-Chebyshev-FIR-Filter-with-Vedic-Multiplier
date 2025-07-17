`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2025 17:39:39
// Design Name: 
// Module Name: sinusoidal_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module FIR_randomsignal_tb();

// Configurable parameters
parameter real AMPLITUDE = 16383.0;      // Signal amplitude
parameter real FREQUENCY = 200000.0;     // Frequency in Hz
parameter real SAMPLING_FREQ = 1000000.0; // 1 MHz sampling
parameter integer TEST_CYCLES = 500;     // Number of test cycles

// DUT signals
reg clk;
reg reset;
reg signed [15:0] input_data;
wire signed [31:0] output_data;


integer cycle_count;
real phase_rad;
real sine_value;

FIR f3(
    .clk(clk),
    .reset(reset),
    .input_data(input_data),
    .output_data(output_data)
);


initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
end


always @(posedge clk) begin
    if (reset) begin
        input_data <= 16'sd0;
        cycle_count <= 0;
    end else begin
        //phase
        phase_rad = 2.0 * 3.14159 * FREQUENCY * cycle_count / SAMPLING_FREQ;
        
        //sine wave
        sine_value = AMPLITUDE * $sin(phase_rad);
        
        // Convert to 16-bit signed integer
        if (sine_value > 32767.0)
            input_data <= 16'sd32767;
        else if (sine_value < -32768.0)
            input_data <= -16'sd32768; //Note: to assign a signed decimal number, put a minus sign before the width specifier
        else
            input_data <= $signed(sine_value);
        
        cycle_count <= cycle_count + 1;
    end
end

// Test stimulus
initial begin
    $dumpfile("fir_sine.vcd");
    $dumpvars(0, FIR_randomsignal_tb);
    
    // Initialize
    reset = 1;
    #50 reset = 0;
    
    $display("=== FIR Filter Sine Wave Test ===");
    $display("Frequency: %.1f kHz", FREQUENCY/1000.0);
    $display("Amplitude: %.0f", AMPLITUDE);
    
    // Run test
    repeat(TEST_CYCLES) @(posedge clk);
    
    $display("Test completed");
    $finish;
end

always @(posedge clk) begin
    if (!reset && cycle_count % 25 == 0) begin
        $display("Time: %0t | Input: %0d | Output: %0d", $time, input_data, output_data);
    end
end

endmodule
