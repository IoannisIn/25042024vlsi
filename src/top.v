module tt_um_4mux1_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;

    wire  select[0] = ui_in[0];           // Output port for inled signal
    wire  select[1] = ui_in[1];           // Output port for deled signal
    wire  in1[0] = ui_in[2];             // Output port for led signal
    wire  in2[1] = ui_in[3];       // Output port for 1Hz clock signal
    wire  in3[2] = ui_in[4];             // Output port for led signal
    wire  in4[3] = ui_in[5];       // Output port for 1Hz clock signal
    reg out_mux; 
    assign uo_out[0] = out_mux;
  
        always @(*) begin
            case (select)
                2'h0: out_mux = in1;
                2'h1: out_mux = in2;
                2'h2: out_mux = in3;
                2'h3: out_mux = in4;
                default: out_mux = 0;
            endcase
        end   

endmodule
