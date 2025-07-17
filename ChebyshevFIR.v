// Lowpass (Chebyshev) Equiripple FIR filter
//Order - 15
//F_sampling = 100kHz
//F_pass = 200kHz
//F_stop = 355kHz
module FIR(
    input clk,
    input reset,
    input signed [15:0] input_data,
    output reg signed [31:0] output_data
);

// 16-tap FIR filter
reg signed [15:0] buff [0:15];
wire signed [31:0] mult_out [0:15];
wire signed [31:0] acc_tree [0:14]; // For tree-based accumulation

// Filter coefficients (16 taps)
wire signed [15:0] tap [0:15];
assign tap[0]  = 16'hFC9C;  // -0.0265 * 32768
assign tap[1]  = 16'h0000;  // 0
assign tap[2]  = 16'h05A5;  // 0.0441 * 32768
assign tap[3]  = 16'h0000;  // 0
assign tap[4]  = 16'hF40C;  // -0.0934 * 32768
assign tap[5]  = 16'h0000;  // 0
assign tap[6]  = 16'h282D;  // 0.3139 * 32768
assign tap[7]  = 16'h4000;  // 0.5000 * 32768
assign tap[8]  = 16'h282D;  // 0.3139 * 32768
assign tap[9]  = 16'h0000;  // 0
assign tap[10] = 16'hF40C;  // -0.0934 * 32768
assign tap[11] = 16'h0000;  // 0
assign tap[12] = 16'h05A5;  // 0.0441 * 32768
assign tap[13] = 16'h0000;  // 0
assign tap[14] = 16'hFC9C;  // -0.0265 * 32768
assign tap[15] = 16'h0000;  // 0 

integer j;

// Shift-register input buffer
always @(posedge clk) begin
    if (reset) begin
        for (j = 0; j < 16; j = j+1)
            buff[j] <= 16'sd0;
    end else begin
        for (j = 15; j > 0; j = j-1)
            buff[j] <= buff[j-1];
        buff[0] <= input_data;
    end
end

//multiplication part
genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : mul_stage
        vedicmult_16bit vmul(
            .a(tap[i]),
            .b(buff[i]),
            .clk(clk),
            .reset(reset),
            .out(mult_out[i])
        );
    end
endgenerate

// Tree-based accumulation
reg signed [31:0] acc_stage1 [0:7];
reg signed [31:0] acc_stage2 [0:3];
reg signed [31:0] acc_stage3 [0:1];

always @(posedge clk) begin
    if (reset) begin
        for (j = 0; j < 8; j = j+1)
            acc_stage1[j] <= 32'sd0;
        for (j = 0; j < 4; j = j+1)
            acc_stage2[j] <= 32'sd0;
        for (j = 0; j < 2; j = j+1)
            acc_stage3[j] <= 32'sd0;
        output_data <= 32'sd0;
    end else begin
        // Stage 1: Add pairs
        acc_stage1[0] <= mult_out[0] + mult_out[1];
        acc_stage1[1] <= mult_out[2] + mult_out[3];
        acc_stage1[2] <= mult_out[4] + mult_out[5];
        acc_stage1[3] <= mult_out[6] + mult_out[7];
        acc_stage1[4] <= mult_out[8] + mult_out[9];
        acc_stage1[5] <= mult_out[10] + mult_out[11];
        acc_stage1[6] <= mult_out[12] + mult_out[13];
        acc_stage1[7] <= mult_out[14] + mult_out[15];
        
        // Stage 2: Add groups of 4
        acc_stage2[0] <= acc_stage1[0] + acc_stage1[1];
        acc_stage2[1] <= acc_stage1[2] + acc_stage1[3];
        acc_stage2[2] <= acc_stage1[4] + acc_stage1[5];
        acc_stage2[3] <= acc_stage1[6] + acc_stage1[7];
        
        // Stage 3: Add groups of 8
        acc_stage3[0] <= acc_stage2[0] + acc_stage2[1];
        acc_stage3[1] <= acc_stage2[2] + acc_stage2[3];
        
        // Final output
        output_data <= acc_stage3[0] + acc_stage3[1];
    end
end
