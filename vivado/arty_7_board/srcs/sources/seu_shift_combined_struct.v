//
// Module SEU_Test_lib.seu_shift_combined.struct
//
// Created:
//          by - lehmann.edagrp (chipdev2.physik.uni-wuppertal.de)
//          at - 16:52:41 02/06/17
//
// Generated by Mentor Graphics' HDL Designer(TM) 2015.1b (Build 4)
//

`resetall
`timescale 1ns/10ps
module seu_shift_combined( 
   // Port Declarations
   input   wire      clk_in, 
   input   wire      data_in, 
   input   wire      mode, 
   output  wire      data_out, 
   output  wire      data_outTMR
);

// Internal Declarations

// Local declarations
parameter LENGTH =  3000;


// Internal signal declarations
//wire clk;
wire clk_n;
wire data_in_n;
wire mode_n;
wire data_out_n;
wire data_outTMR_n;

// input clock buffer  to buffer the external clock signal. 
//This is a standard practice to ensure proper handling of the incoming clock signal.
BUFG clkbuf(
  .I (clk_in),
  .O (clk)
);


// invert signals as in level shifter
assign clk_n = ~clk;
assign data_in_n = ~data_in;
assign mode_n = ~mode;
assign data_out = ~data_out_n;

assign data_outTMR = ~data_outTMR_n;




// Instances 
seu_shift_reg #(LENGTH) seu_shift_reg0( 
   .clk      (clk_n), 
   .data_in  (data_in_n), 
   .mode     (mode_n), 
   .data_out (data_out_n)
); 

seu_shift_reg_tmr #(LENGTH) seu_shift_reg_tmr0( 
   .clk      (clk_n),   
   .data_in  (data_in_n),  
   .mode     (mode_n),  
   .data_out (data_outTMR_n)
); 


endmodule // seu_shift_combined
