`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.07.2025 18:53:31
// Design Name: 
// Module Name: FIRtriangularpulse_tb
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

module FIR_triangular_tb();

reg clk;
reg reset;
reg signed [15:0] input_data;
wire signed [31:0] output_data;


reg [7:0] high_cycles = 8'd5;   // Cycles for high state
reg [7:0] low_cycles = 8'd5;    // Cycles for low state
reg [7:0] cycle_count;
reg current_state;


FIR f3(
    .clk(clk),
    .reset(reset),
    .input_data(input_data),
    .output_data(output_data)
);


initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Symmetric square pulse 
always @(posedge clk) begin
    if (reset) begin
        cycle_count <= 8'h00;
        current_state <= 1'b0;
        input_data <= 16'sd0;
    end else begin
        case (current_state)
            1'b0: begin // Low state
                input_data <= 16'sd0;
                if (cycle_count == low_cycles - 1) begin
                    cycle_count <= 8'h00;
                    current_state <= 1'b1;
                end else begin
                    cycle_count <= cycle_count + 1;
                end
            end
            
            1'b1: begin // High state
                input_data <= 16'sd32767;
                if (cycle_count == high_cycles - 1) begin
                    cycle_count <= 8'h00;
                    current_state <= 1'b0;
                end else begin
                    cycle_count <= cycle_count + 1;
                end
            end
        endcase
    end
end

// Test sequence
initial begin
    $dumpfile("fir_configurable_square.vcd");
    $dumpvars(0, FIR_square_tb);
    
    // Test setup
    reset = 1;
    #50 reset = 0;
    
    $display("=== Symmetric Square Pulse Test ===");
    
    // Test: Equal high/low periods (15 cycles each)
    $display("Test 1: 15 cycles HIGH, 15 cycles LOW");
    repeat(100) #10;
    
    // Test: Different pulse width
    $display("Test 2: Changing to 10 cycles HIGH, 10 cycles LOW");
    high_cycles = 8'd10;
    low_cycles = 8'd10;
    repeat(100) #10;
    
    // Test: Narrow pulse
    $display("Test 3: Narrow pulse - 5 cycles HIGH, 25 cycles LOW");
    high_cycles = 8'd5;
    low_cycles = 8'd25;
    repeat(100) #10;
    
    $display("All tests completed");
    $finish;
end


always @(posedge clk) begin
    if (!reset && ($time % 10000 == 0)) begin // Sample every 10000ns
        $display("Time: %0t | State: %b | Input: %0d | Output: %0d", 
                 $time, current_state, input_data, output_data);
    end
end

endmodule
