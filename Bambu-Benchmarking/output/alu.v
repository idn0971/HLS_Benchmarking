// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.6 - Revision 5e5e306b86383a7d85274d64977a3d71fdcff4fe-master - Date 2020-05-28T15:41:26
// bambu executed with: bambu --compiler=I386_CLANG6 --top-fname=alu --device-name=EP2C70F896C6 --simulate --simulator=VERILATOR ../cpu.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1, value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock, reset, in1, wenable, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock, reset, in1, wenable, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1, in2, in3, in4, in5, in6, in7, in8, in9, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
  genvar i0;
  for (i0=0; i0<8; i0=i0+1)
  begin : L0
        always @(*)
        begin
           if (in0[i0] == 1'b1)
              cleaned_in0[i0] = 1'b1;
           else
              cleaned_in0[i0] = 1'b0;
        end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
   if(BITSIZE_out1 > 1)
     assign out1[BITSIZE_out1-1:1] = 0;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module multi_read_cond_FU(in1, out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRLN(clock, in1, in2, in3, in4, sel_LOAD, sel_STORE, out1, Min_oe_ram, Mout_oe_ram, Min_we_ram, Mout_we_ram, Min_addr_ram, Mout_addr_ram, M_Rdata_ram, Min_Wdata_ram, Mout_Wdata_ram, Min_data_ram_size, Mout_data_ram_size, M_DataRdy);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_in4=1, PORTSIZE_in4=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2, BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2, BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2, BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2, BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2, BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2, BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2, BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2, BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2, BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2, BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2, BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2;
  // IN
  input clock;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;
  
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_Mout_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_Mout_oe_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  wire  [(PORTSIZE_in2*BITSIZE_in2)-1:0] tmp_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign tmp_addr = in2;
  generate
  genvar i;
    for (i=0; i<max_n_rw; i=i+1)
    begin : L0
      assign Mout_addr_ram[(i+1)*BITSIZE_Mout_addr_ram-1:i*BITSIZE_Mout_addr_ram] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (tmp_addr[(i+1)*BITSIZE_in2-1:i*BITSIZE_in2]) : Min_addr_ram[(i+1)*BITSIZE_Min_addr_ram-1:i*BITSIZE_Min_addr_ram];
    end
    endgenerate
  assign Mout_oe_ram = int_sel_LOAD | Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE | Min_we_ram;
  generate
    for (i=0; i<max_n_reads; i=i+1)
    begin : L1
      assign out1[(i+1)*BITSIZE_out1-1:i*BITSIZE_out1] = M_Rdata_ram[i*BITSIZE_M_Rdata_ram+BITSIZE_out1-1:i*BITSIZE_M_Rdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L2
      assign Mout_Wdata_ram[(i+1)*BITSIZE_Mout_Wdata_ram-1:i*BITSIZE_Mout_Wdata_ram] = int_sel_STORE[i] ? in1[(i+1)*BITSIZE_in1-1:i*BITSIZE_in1] : Min_Wdata_ram[(i+1)*BITSIZE_Min_Wdata_ram-1:i*BITSIZE_Min_Wdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L3
      assign Mout_data_ram_size[(i+1)*BITSIZE_Mout_data_ram_size-1:i*BITSIZE_Mout_data_ram_size] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (in3[(i+1)*BITSIZE_in3-1:i*BITSIZE_in3]) : Min_data_ram_size[(i+1)*BITSIZE_Min_data_ram_size-1:i*BITSIZE_Min_data_ram_size];
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lt_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module rshift_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >>> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >>> in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_concat_expr_FU(in1, in2, in3, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_in3=1, BITSIZE_out1=1, OFFSET_PARAMETER=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  parameter nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire [nbit_out-1:0] tmp_in1;
  wire [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){1'b0}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){1'b0}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_xor_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 ^ in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1, in2, in3, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_in3=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ge_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 >= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lt_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 < in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_minus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_mult_expr_FU(clock, in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, PIPE_PARAMETER=0;
  // IN
  input clock;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg [BITSIZE_in1-1:0] in1_in;
      reg [BITSIZE_in2-1:0] in2_in;
      wire [BITSIZE_out1-1:0] mult_res;
      reg [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_ne_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1, PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bus_merger(in1, out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  function [BITSIZE_out1-1:0] merge;
    input [BITSIZE_in1*PORTSIZE_in1-1:0] m;
    reg [BITSIZE_out1-1:0] res;
    integer i1;
  begin
    res={BITSIZE_in1{1'b0}};
    for(i1 = 0; i1 < PORTSIZE_in1; i1 = i1 + 1)
    begin
      res = res | m[i1*BITSIZE_in1 +:BITSIZE_in1];
    end
    merge = res;
  end
  endfunction
  
  assign out1 = merge(in1);
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module join_signal(in1, out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign out1[(i1+1)*(BITSIZE_out1/PORTSIZE_in1)-1:i1*(BITSIZE_out1/PORTSIZE_in1)] = in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module split_signal(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1, PORTSIZE_out1=2;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_VECTOR_BOOL_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel, in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1, BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for alu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_alu(clock, reset, in_port_P0, in_port_P1, in_port_P2, in_port_P3, in_port_P4, in_port_P5, M_Rdata_ram, M_DataRdy, Min_oe_ram, Min_we_ram, Min_addr_ram, Min_Wdata_ram, Min_data_ram_size, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size, fuselector_BMEMORY_CTRLN_27_i0_LOAD, fuselector_BMEMORY_CTRLN_27_i0_STORE, fuselector_BMEMORY_CTRLN_27_i1_LOAD, fuselector_BMEMORY_CTRLN_27_i1_STORE, selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0, selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0, selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0, selector_MUX_68_reg_6_0_0_0, selector_MUX_69_reg_7_0_0_0, selector_MUX_70_reg_8_0_0_0, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, wrenable_reg_7, wrenable_reg_8, wrenable_reg_9, OUT_MULTIIF_alu_419511_419857);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_P0;
  input [31:0] in_port_P1;
  input [31:0] in_port_P2;
  input [31:0] in_port_P3;
  input [31:0] in_port_P4;
  input [31:0] in_port_P5;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_27_i0_STORE;
  input fuselector_BMEMORY_CTRLN_27_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_27_i1_STORE;
  input selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  input selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0;
  input selector_MUX_68_reg_6_0_0_0;
  input selector_MUX_69_reg_7_0_0_0;
  input selector_MUX_70_reg_8_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_MULTIIF_alu_419511_419857;
  // Component and signal declarations
  wire null_out_signal_BMEMORY_CTRLN_27_i0_out1_0;
  wire null_out_signal_BMEMORY_CTRLN_27_i0_out1_1;
  wire [31:0] out_IUdata_converter_FU_8_i0_fu_alu_419511_419944;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  wire [6:0] out_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0;
  wire out_MUX_68_reg_6_0_0_0;
  wire out_MUX_69_reg_7_0_0_0;
  wire [31:0] out_MUX_70_reg_8_0_0_0;
  wire signed [31:0] out_UIdata_converter_FU_6_i0_fu_alu_419511_419968;
  wire signed [31:0] out_UIdata_converter_FU_7_i0_fu_alu_419511_419971;
  wire out_UUdata_converter_FU_10_i0_fu_alu_419511_419593;
  wire out_UUdata_converter_FU_11_i0_fu_alu_419511_419576;
  wire out_UUdata_converter_FU_12_i0_fu_alu_419511_419577;
  wire out_UUdata_converter_FU_19_i0_fu_alu_419511_420198;
  wire out_UUdata_converter_FU_21_i0_fu_alu_419511_420201;
  wire out_UUdata_converter_FU_25_i0_fu_alu_419511_419748;
  wire out_UUdata_converter_FU_9_i0_fu_alu_419511_419592;
  wire out_const_0;
  wire [4:0] out_const_1;
  wire [3:0] out_const_10;
  wire [4:0] out_const_11;
  wire [4:0] out_const_12;
  wire [2:0] out_const_13;
  wire [3:0] out_const_14;
  wire [4:0] out_const_15;
  wire [4:0] out_const_16;
  wire [3:0] out_const_17;
  wire [4:0] out_const_18;
  wire [7:0] out_const_19;
  wire [6:0] out_const_2;
  wire [1:0] out_const_20;
  wire [2:0] out_const_21;
  wire [3:0] out_const_22;
  wire [4:0] out_const_23;
  wire [4:0] out_const_24;
  wire [15:0] out_const_25;
  wire [3:0] out_const_26;
  wire [4:0] out_const_27;
  wire [2:0] out_const_28;
  wire [3:0] out_const_29;
  wire out_const_3;
  wire [3:0] out_const_30;
  wire [15:0] out_const_31;
  wire [15:0] out_const_32;
  wire [1:0] out_const_4;
  wire [2:0] out_const_5;
  wire [3:0] out_const_6;
  wire [4:0] out_const_7;
  wire [12:0] out_const_8;
  wire [4:0] out_const_9;
  wire [5:0] out_conv_out_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0_7_6;
  wire [5:0] out_conv_out_const_1_5_6;
  wire [6:0] out_conv_out_const_1_5_7;
  wire [7:0] out_conv_out_reg_7_reg_7_1_8;
  wire [7:0] out_conv_out_reg_9_reg_9_1_8;
  wire [31:0] out_conv_out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1_8_32;
  wire [31:0] out_conv_out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2_8_32;
  wire out_lt_expr_FU_32_32_32_28_i0_fu_alu_419511_419973;
  wire out_lut_expr_FU_13_i0_fu_alu_419511_420281;
  wire out_lut_expr_FU_14_i0_fu_alu_419511_420285;
  wire out_lut_expr_FU_15_i0_fu_alu_419511_420289;
  wire out_lut_expr_FU_16_i0_fu_alu_419511_420292;
  wire out_lut_expr_FU_17_i0_fu_alu_419511_420295;
  wire out_lut_expr_FU_18_i0_fu_alu_419511_420260;
  wire out_lut_expr_FU_20_i0_fu_alu_419511_420268;
  wire out_lut_expr_FU_3_i0_fu_alu_419511_420011;
  wire out_lut_expr_FU_4_i0_fu_alu_419511_420014;
  wire out_lut_expr_FU_5_i0_fu_alu_419511_420017;
  wire out_multi_read_cond_FU_22_i0_fu_alu_419511_419857;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_2_reg_2;
  wire out_reg_3_reg_3;
  wire out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire out_reg_6_reg_6;
  wire out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire out_reg_9_reg_9;
  wire signed [31:0] out_rshift_expr_FU_32_32_32_29_i0_fu_alu_419511_419605;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_30_i0_fu_alu_419511_419561;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_31_i0_fu_alu_419511_419997;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_32_i0_fu_alu_419511_419739;
  wire [31:0] out_ui_bit_ior_expr_FU_32_32_32_33_i0_fu_alu_419511_419566;
  wire [31:0] out_ui_bit_xor_expr_FU_32_32_32_34_i0_fu_alu_419511_419571;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i0_fu_alu_419511_420006;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i10_fu_alu_419511_420105;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i11_fu_alu_419511_420114;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i12_fu_alu_419511_420123;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i13_fu_alu_419511_420132;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i14_fu_alu_419511_420141;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i15_fu_alu_419511_420150;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i16_fu_alu_419511_420159;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i17_fu_alu_419511_420168;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i18_fu_alu_419511_420177;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i19_fu_alu_419511_420186;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i1_fu_alu_419511_420024;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i20_fu_alu_419511_420195;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i21_fu_alu_419511_420204;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i2_fu_alu_419511_420033;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i3_fu_alu_419511_420042;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i4_fu_alu_419511_420051;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i5_fu_alu_419511_420060;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i6_fu_alu_419511_420069;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i7_fu_alu_419511_420078;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i8_fu_alu_419511_420087;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_35_i9_fu_alu_419511_420096;
  wire out_ui_eq_expr_FU_32_0_32_36_i0_fu_alu_419511_419866;
  wire out_ui_eq_expr_FU_32_0_32_37_i0_fu_alu_419511_419869;
  wire out_ui_eq_expr_FU_32_0_32_38_i0_fu_alu_419511_419872;
  wire out_ui_eq_expr_FU_32_0_32_39_i0_fu_alu_419511_419875;
  wire out_ui_eq_expr_FU_32_0_32_40_i0_fu_alu_419511_419878;
  wire out_ui_eq_expr_FU_32_0_32_41_i0_fu_alu_419511_419881;
  wire out_ui_eq_expr_FU_32_0_32_42_i0_fu_alu_419511_419884;
  wire out_ui_eq_expr_FU_32_0_32_43_i0_fu_alu_419511_419887;
  wire out_ui_eq_expr_FU_32_0_32_44_i0_fu_alu_419511_419890;
  wire out_ui_eq_expr_FU_32_0_32_45_i0_fu_alu_419511_419893;
  wire out_ui_eq_expr_FU_32_0_32_46_i0_fu_alu_419511_419896;
  wire out_ui_eq_expr_FU_32_0_32_47_i0_fu_alu_419511_419899;
  wire out_ui_eq_expr_FU_32_0_32_48_i0_fu_alu_419511_419902;
  wire out_ui_eq_expr_FU_32_0_32_49_i0_fu_alu_419511_419905;
  wire out_ui_eq_expr_FU_32_0_32_50_i0_fu_alu_419511_419908;
  wire out_ui_eq_expr_FU_32_0_32_51_i0_fu_alu_419511_419911;
  wire out_ui_eq_expr_FU_32_0_32_52_i0_fu_alu_419511_419914;
  wire out_ui_eq_expr_FU_32_0_32_53_i0_fu_alu_419511_419917;
  wire out_ui_eq_expr_FU_32_0_32_54_i0_fu_alu_419511_419920;
  wire out_ui_eq_expr_FU_32_0_32_55_i0_fu_alu_419511_419923;
  wire out_ui_eq_expr_FU_32_0_32_56_i0_fu_alu_419511_419926;
  wire out_ui_eq_expr_FU_32_0_32_57_i0_fu_alu_419511_419929;
  wire out_ui_eq_expr_FU_32_0_32_58_i0_fu_alu_419511_419932;
  wire out_ui_eq_expr_FU_32_0_32_59_i0_fu_alu_419511_419935;
  wire out_ui_eq_expr_FU_32_0_32_60_i0_fu_alu_419511_419938;
  wire out_ui_eq_expr_FU_32_0_32_61_i0_fu_alu_419511_419941;
  wire out_ui_eq_expr_FU_32_32_32_62_i0_fu_alu_419511_419961;
  wire out_ui_ge_expr_FU_32_32_32_63_i0_fu_alu_419511_419976;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_64_i0_fu_alu_419511_419993;
  wire [31:0] out_ui_lshift_expr_FU_32_32_32_65_i0_fu_alu_419511_419623;
  wire [31:0] out_ui_lshift_expr_FU_32_32_32_65_i1_fu_alu_419511_419628;
  wire out_ui_lt_expr_FU_32_32_32_66_i0_fu_alu_419511_419979;
  wire [31:0] out_ui_minus_expr_FU_32_32_32_67_i0_fu_alu_419511_419556;
  wire [31:0] out_ui_mult_expr_FU_32_32_32_0_68_i0_fu_alu_419511_419633;
  wire out_ui_ne_expr_FU_32_32_32_69_i0_fu_alu_419511_419964;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_70_i0_fu_alu_419511_419990;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_71_i0_fu_alu_419511_419640;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_71_i1_fu_alu_419511_419742;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_72_i0_fu_alu_419511_419751;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_0_32_73_i0_fu_alu_419511_419753;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_74_i0_fu_alu_419511_419985;
  wire [31:0] out_ui_rshift_expr_FU_32_32_32_75_i0_fu_alu_419511_419613;
  wire [31:0] out_ui_rshift_expr_FU_32_32_32_75_i1_fu_alu_419511_419618;
  wire [31:0] out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0;
  wire [7:0] out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1;
  wire [7:0] out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [63:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;
  
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_0 (.out1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0), .in1(out_reg_8_reg_8));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) ASSIGN_VECTOR_BOOL_FU_vb_assign_1 (.out1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1), .in1(out_conv_out_reg_7_reg_7_1_8));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(8), .BITSIZE_out1(8)) ASSIGN_VECTOR_BOOL_FU_vb_assign_2 (.out1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2), .in1(out_conv_out_reg_9_reg_9_1_8));
  BMEMORY_CTRLN #(.BITSIZE_in1(32), .PORTSIZE_in1(2), .BITSIZE_in2(32), .PORTSIZE_in2(2), .BITSIZE_in3(6), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_out1(1), .PORTSIZE_out1(2), .BITSIZE_Min_oe_ram(1), .PORTSIZE_Min_oe_ram(2), .BITSIZE_Min_we_ram(1), .PORTSIZE_Min_we_ram(2), .BITSIZE_Mout_oe_ram(1), .PORTSIZE_Mout_oe_ram(2), .BITSIZE_Mout_we_ram(1), .PORTSIZE_Mout_we_ram(2), .BITSIZE_M_DataRdy(1), .PORTSIZE_M_DataRdy(2), .BITSIZE_Min_addr_ram(32), .PORTSIZE_Min_addr_ram(2), .BITSIZE_Mout_addr_ram(32), .PORTSIZE_Mout_addr_ram(2), .BITSIZE_M_Rdata_ram(32), .PORTSIZE_M_Rdata_ram(2), .BITSIZE_Min_Wdata_ram(32), .PORTSIZE_Min_Wdata_ram(2), .BITSIZE_Mout_Wdata_ram(32), .PORTSIZE_Mout_Wdata_ram(2), .BITSIZE_Min_data_ram_size(6), .PORTSIZE_Min_data_ram_size(2), .BITSIZE_Mout_data_ram_size(6), .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_27_i0 (.out1({null_out_signal_BMEMORY_CTRLN_27_i0_out1_1, null_out_signal_BMEMORY_CTRLN_27_i0_out1_0}), .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0), .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0), .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0), .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0), .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0), .clock(clock), .in1({out_conv_out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1_8_32, out_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0}), .in2({out_reg_1_reg_1, out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0}), .in3({out_conv_out_const_1_5_6, out_conv_out_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0_7_6}), .in4({out_const_3, out_const_3}), .sel_LOAD({fuselector_BMEMORY_CTRLN_27_i1_LOAD, fuselector_BMEMORY_CTRLN_27_i0_LOAD}), .sel_STORE({fuselector_BMEMORY_CTRLN_27_i1_STORE, fuselector_BMEMORY_CTRLN_27_i0_STORE}), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .M_Rdata_ram(M_Rdata_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size), .M_DataRdy(M_DataRdy));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_27_i0_0_0_0 (.out1(out_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0), .sel(selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0), .in1(out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_0), .in2(out_conv_out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2_8_32));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0), .sel(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0), .in1(out_reg_2_reg_2), .in2(in_port_P0));
  MUX_GATE #(.BITSIZE_in1(7), .BITSIZE_in2(7), .BITSIZE_out1(7)) MUX_2_BMEMORY_CTRLN_27_i0_2_0_0 (.out1(out_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0), .sel(selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0), .in1(out_conv_out_const_1_5_7), .in2(out_const_2));
  MUX_GATE #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_out1(1)) MUX_68_reg_6_0_0_0 (.out1(out_MUX_68_reg_6_0_0_0), .sel(selector_MUX_68_reg_6_0_0_0), .in1(out_const_0), .in2(out_UUdata_converter_FU_19_i0_fu_alu_419511_420198));
  MUX_GATE #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_out1(1)) MUX_69_reg_7_0_0_0 (.out1(out_MUX_69_reg_7_0_0_0), .sel(selector_MUX_69_reg_7_0_0_0), .in1(out_const_0), .in2(out_UUdata_converter_FU_21_i0_fu_alu_419511_420201));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_70_reg_8_0_0_0 (.out1(out_MUX_70_reg_8_0_0_0), .sel(selector_MUX_70_reg_8_0_0_0), .in1(out_ui_cond_expr_FU_32_32_32_32_35_i21_fu_alu_419511_420204), .in2(out_ui_mult_expr_FU_32_32_32_0_68_i0_fu_alu_419511_419633));
  bus_merger #(.BITSIZE_in1(64), .PORTSIZE_in1(1), .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_), .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(64), .PORTSIZE_in1(1), .BITSIZE_out1(64)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_), .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12), .PORTSIZE_in1(1), .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_), .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2), .PORTSIZE_in1(1), .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_), .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2), .PORTSIZE_in1(1), .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_), .in1({sig_in_bus_mergerMout_we_ram4_0}));
  constant_value #(.BITSIZE_out1(1), .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(5), .value(5'b01000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(4), .value(4'b1001)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(5), .value(5'b10010)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(5), .value(5'b10011)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(3), .value(3'b101)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(4), .value(4'b1010)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(5), .value(5'b10100)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(5), .value(5'b10101)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(4), .value(4'b1011)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(5), .value(5'b10111)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(8), .value(8'b10111000)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(7), .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2), .value(2'b11)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(3), .value(3'b110)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(4), .value(4'b1100)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(5), .value(5'b11000)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(5), .value(5'b11001)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(16), .value(16'b1100110010100000)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(4), .value(4'b1101)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(5), .value(5'b11010)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(3), .value(3'b111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(4), .value(4'b1110)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(1), .value(1'b1)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(4), .value(4'b1111)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(16), .value(16'b1111000111100000)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(16), .value(16'b1111111111111110)) const_32 (.out1(out_const_32));
  constant_value #(.BITSIZE_out1(2), .value(2'b10)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3), .value(3'b100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4), .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(5), .value(5'b10000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(13), .value(13'b1000000000000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(5), .value(5'b10001)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(7), .BITSIZE_out1(6)) conv_out_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0_7_6 (.out1(out_conv_out_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0_7_6), .in1(out_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0));
  UUdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(6)) conv_out_const_1_5_6 (.out1(out_conv_out_const_1_5_6), .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(7)) conv_out_const_1_5_7 (.out1(out_conv_out_const_1_5_7), .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(8)) conv_out_reg_7_reg_7_1_8 (.out1(out_conv_out_reg_7_reg_7_1_8), .in1(out_reg_7_reg_7));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(8)) conv_out_reg_9_reg_9_1_8 (.out1(out_conv_out_reg_9_reg_9_1_8), .in1(out_reg_9_reg_9));
  UUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1_8_32 (.out1(out_conv_out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1_8_32), .in1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_1));
  UUdata_converter_FU #(.BITSIZE_in1(8), .BITSIZE_out1(32)) conv_out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2_8_32 (.out1(out_conv_out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2_8_32), .in1(out_vb_assign_conn_obj_2_ASSIGN_VECTOR_BOOL_FU_vb_assign_2));
  ui_minus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_alu_419511_419556 (.out1(out_ui_minus_expr_FU_32_32_32_67_i0_fu_alu_419511_419556), .in1(in_port_P1), .in2(in_port_P2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_alu_419511_419561 (.out1(out_ui_bit_and_expr_FU_32_32_32_30_i0_fu_alu_419511_419561), .in1(in_port_P2), .in2(in_port_P1));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_alu_419511_419566 (.out1(out_ui_bit_ior_expr_FU_32_32_32_33_i0_fu_alu_419511_419566), .in1(in_port_P2), .in2(in_port_P1));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_alu_419511_419571 (.out1(out_ui_bit_xor_expr_FU_32_32_32_34_i0_fu_alu_419511_419571), .in1(in_port_P2), .in2(in_port_P1));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_419576 (.out1(out_UUdata_converter_FU_11_i0_fu_alu_419511_419576), .in1(out_lt_expr_FU_32_32_32_28_i0_fu_alu_419511_419973));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_419577 (.out1(out_UUdata_converter_FU_12_i0_fu_alu_419511_419577), .in1(out_UUdata_converter_FU_11_i0_fu_alu_419511_419576));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_419592 (.out1(out_UUdata_converter_FU_9_i0_fu_alu_419511_419592), .in1(out_ui_lt_expr_FU_32_32_32_66_i0_fu_alu_419511_419979));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_419593 (.out1(out_UUdata_converter_FU_10_i0_fu_alu_419511_419593), .in1(out_UUdata_converter_FU_9_i0_fu_alu_419511_419592));
  rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PRECISION(32)) fu_alu_419511_419605 (.out1(out_rshift_expr_FU_32_32_32_29_i0_fu_alu_419511_419605), .in1(out_UIdata_converter_FU_6_i0_fu_alu_419511_419968), .in2(in_port_P4));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PRECISION(32)) fu_alu_419511_419613 (.out1(out_ui_rshift_expr_FU_32_32_32_75_i0_fu_alu_419511_419613), .in1(in_port_P1), .in2(in_port_P2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PRECISION(32)) fu_alu_419511_419618 (.out1(out_ui_rshift_expr_FU_32_32_32_75_i1_fu_alu_419511_419618), .in1(in_port_P1), .in2(in_port_P4));
  ui_lshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PRECISION(32)) fu_alu_419511_419623 (.out1(out_ui_lshift_expr_FU_32_32_32_65_i0_fu_alu_419511_419623), .in1(in_port_P1), .in2(in_port_P2));
  ui_lshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PRECISION(32)) fu_alu_419511_419628 (.out1(out_ui_lshift_expr_FU_32_32_32_65_i1_fu_alu_419511_419628), .in1(in_port_P1), .in2(in_port_P4));
  ui_mult_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PIPE_PARAMETER(0)) fu_alu_419511_419633 (.out1(out_ui_mult_expr_FU_32_32_32_0_68_i0_fu_alu_419511_419633), .clock(clock), .in1(in_port_P2), .in2(in_port_P1));
  ui_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_alu_419511_419640 (.out1(out_ui_plus_expr_FU_32_32_32_71_i0_fu_alu_419511_419640), .in1(in_port_P5), .in2(in_port_P2));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_in3(2), .BITSIZE_out1(32), .OFFSET_PARAMETER(2)) fu_alu_419511_419739 (.out1(out_ui_bit_ior_concat_expr_FU_32_i0_fu_alu_419511_419739), .in1(out_ui_lshift_expr_FU_32_0_32_64_i0_fu_alu_419511_419993), .in2(out_ui_bit_and_expr_FU_8_0_8_31_i0_fu_alu_419511_419997), .in3(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_alu_419511_419742 (.out1(out_ui_plus_expr_FU_32_32_32_71_i1_fu_alu_419511_419742), .in1(in_port_P2), .in2(in_port_P1));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_419748 (.out1(out_UUdata_converter_FU_25_i0_fu_alu_419511_419748), .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(3), .BITSIZE_out1(32), .LSB_PARAMETER(0)) fu_alu_419511_419751 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_72_i0_fu_alu_419511_419751), .in1(in_port_P0), .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(3), .BITSIZE_out1(32), .LSB_PARAMETER(0)) fu_alu_419511_419753 (.out1(out_ui_pointer_plus_expr_FU_32_0_32_73_i0_fu_alu_419511_419753), .in1(in_port_P0), .in2(out_const_13));
  multi_read_cond_FU #(.BITSIZE_in1(1), .PORTSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_419857 (.out1(out_multi_read_cond_FU_22_i0_fu_alu_419511_419857), .in1({out_reg_3_reg_3}));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_alu_419511_419866 (.out1(out_ui_eq_expr_FU_32_0_32_36_i0_fu_alu_419511_419866), .in1(in_port_P3), .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_alu_419511_419869 (.out1(out_ui_eq_expr_FU_32_0_32_37_i0_fu_alu_419511_419869), .in1(in_port_P3), .in2(out_const_3));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(1)) fu_alu_419511_419872 (.out1(out_ui_eq_expr_FU_32_0_32_38_i0_fu_alu_419511_419872), .in1(in_port_P3), .in2(out_const_4));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(1)) fu_alu_419511_419875 (.out1(out_ui_eq_expr_FU_32_0_32_39_i0_fu_alu_419511_419875), .in1(in_port_P3), .in2(out_const_20));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(3), .BITSIZE_out1(1)) fu_alu_419511_419878 (.out1(out_ui_eq_expr_FU_32_0_32_40_i0_fu_alu_419511_419878), .in1(in_port_P3), .in2(out_const_5));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(3), .BITSIZE_out1(1)) fu_alu_419511_419881 (.out1(out_ui_eq_expr_FU_32_0_32_41_i0_fu_alu_419511_419881), .in1(in_port_P3), .in2(out_const_13));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(3), .BITSIZE_out1(1)) fu_alu_419511_419884 (.out1(out_ui_eq_expr_FU_32_0_32_42_i0_fu_alu_419511_419884), .in1(in_port_P3), .in2(out_const_21));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(3), .BITSIZE_out1(1)) fu_alu_419511_419887 (.out1(out_ui_eq_expr_FU_32_0_32_43_i0_fu_alu_419511_419887), .in1(in_port_P3), .in2(out_const_28));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419890 (.out1(out_ui_eq_expr_FU_32_0_32_44_i0_fu_alu_419511_419890), .in1(in_port_P3), .in2(out_const_6));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419893 (.out1(out_ui_eq_expr_FU_32_0_32_45_i0_fu_alu_419511_419893), .in1(in_port_P3), .in2(out_const_10));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419896 (.out1(out_ui_eq_expr_FU_32_0_32_46_i0_fu_alu_419511_419896), .in1(in_port_P3), .in2(out_const_14));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419899 (.out1(out_ui_eq_expr_FU_32_0_32_47_i0_fu_alu_419511_419899), .in1(in_port_P3), .in2(out_const_17));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419902 (.out1(out_ui_eq_expr_FU_32_0_32_48_i0_fu_alu_419511_419902), .in1(in_port_P3), .in2(out_const_22));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419905 (.out1(out_ui_eq_expr_FU_32_0_32_49_i0_fu_alu_419511_419905), .in1(in_port_P3), .in2(out_const_26));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419908 (.out1(out_ui_eq_expr_FU_32_0_32_50_i0_fu_alu_419511_419908), .in1(in_port_P3), .in2(out_const_29));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(1)) fu_alu_419511_419911 (.out1(out_ui_eq_expr_FU_32_0_32_51_i0_fu_alu_419511_419911), .in1(in_port_P3), .in2(out_const_30));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419914 (.out1(out_ui_eq_expr_FU_32_0_32_52_i0_fu_alu_419511_419914), .in1(in_port_P3), .in2(out_const_7));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419917 (.out1(out_ui_eq_expr_FU_32_0_32_53_i0_fu_alu_419511_419917), .in1(in_port_P3), .in2(out_const_9));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419920 (.out1(out_ui_eq_expr_FU_32_0_32_54_i0_fu_alu_419511_419920), .in1(in_port_P3), .in2(out_const_11));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419923 (.out1(out_ui_eq_expr_FU_32_0_32_55_i0_fu_alu_419511_419923), .in1(in_port_P3), .in2(out_const_12));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419926 (.out1(out_ui_eq_expr_FU_32_0_32_56_i0_fu_alu_419511_419926), .in1(in_port_P3), .in2(out_const_15));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419929 (.out1(out_ui_eq_expr_FU_32_0_32_57_i0_fu_alu_419511_419929), .in1(in_port_P3), .in2(out_const_16));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419932 (.out1(out_ui_eq_expr_FU_32_0_32_58_i0_fu_alu_419511_419932), .in1(in_port_P3), .in2(out_const_18));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419935 (.out1(out_ui_eq_expr_FU_32_0_32_59_i0_fu_alu_419511_419935), .in1(in_port_P3), .in2(out_const_23));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419938 (.out1(out_ui_eq_expr_FU_32_0_32_60_i0_fu_alu_419511_419938), .in1(in_port_P3), .in2(out_const_24));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(1)) fu_alu_419511_419941 (.out1(out_ui_eq_expr_FU_32_0_32_61_i0_fu_alu_419511_419941), .in1(in_port_P3), .in2(out_const_27));
  IUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_alu_419511_419944 (.out1(out_IUdata_converter_FU_8_i0_fu_alu_419511_419944), .in1(out_rshift_expr_FU_32_32_32_29_i0_fu_alu_419511_419605));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(1)) fu_alu_419511_419961 (.out1(out_ui_eq_expr_FU_32_32_32_62_i0_fu_alu_419511_419961), .in1(in_port_P1), .in2(in_port_P2));
  ui_ne_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(1)) fu_alu_419511_419964 (.out1(out_ui_ne_expr_FU_32_32_32_69_i0_fu_alu_419511_419964), .in1(in_port_P1), .in2(in_port_P2));
  UIdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_alu_419511_419968 (.out1(out_UIdata_converter_FU_6_i0_fu_alu_419511_419968), .in1(in_port_P1));
  UIdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_alu_419511_419971 (.out1(out_UIdata_converter_FU_7_i0_fu_alu_419511_419971), .in1(in_port_P2));
  lt_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(1)) fu_alu_419511_419973 (.out1(out_lt_expr_FU_32_32_32_28_i0_fu_alu_419511_419973), .in1(out_UIdata_converter_FU_6_i0_fu_alu_419511_419968), .in2(out_UIdata_converter_FU_7_i0_fu_alu_419511_419971));
  ui_ge_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(1)) fu_alu_419511_419976 (.out1(out_ui_ge_expr_FU_32_32_32_63_i0_fu_alu_419511_419976), .in1(in_port_P1), .in2(in_port_P2));
  ui_lt_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(1)) fu_alu_419511_419979 (.out1(out_ui_lt_expr_FU_32_32_32_66_i0_fu_alu_419511_419979), .in1(in_port_P1), .in2(in_port_P2));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(30), .PRECISION(32)) fu_alu_419511_419985 (.out1(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_alu_419511_419985), .in1(in_port_P5), .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(30), .BITSIZE_in2(1), .BITSIZE_out1(30)) fu_alu_419511_419990 (.out1(out_ui_plus_expr_FU_32_0_32_70_i0_fu_alu_419511_419990), .in1(out_ui_rshift_expr_FU_32_0_32_74_i0_fu_alu_419511_419985), .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(30), .BITSIZE_in2(2), .BITSIZE_out1(32), .PRECISION(32)) fu_alu_419511_419993 (.out1(out_ui_lshift_expr_FU_32_0_32_64_i0_fu_alu_419511_419993), .in1(out_ui_plus_expr_FU_32_0_32_70_i0_fu_alu_419511_419990), .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(2)) fu_alu_419511_419997 (.out1(out_ui_bit_and_expr_FU_8_0_8_31_i0_fu_alu_419511_419997), .in1(in_port_P5), .in2(out_const_20));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(1), .BITSIZE_out1(32)) fu_alu_419511_420006 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i0_fu_alu_419511_420006), .in1(out_ui_eq_expr_FU_32_0_32_50_i0_fu_alu_419511_419908), .in2(in_port_P2), .in3(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(4), .BITSIZE_out1(1)) fu_alu_419511_420011 (.out1(out_lut_expr_FU_3_i0_fu_alu_419511_420011), .in1(out_const_29), .in2(out_ui_eq_expr_FU_32_0_32_53_i0_fu_alu_419511_419917), .in3(out_ui_eq_expr_FU_32_0_32_52_i0_fu_alu_419511_419914), .in4(1'b0), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4), .BITSIZE_out1(1)) fu_alu_419511_420014 (.out1(out_lut_expr_FU_4_i0_fu_alu_419511_420014), .in1(out_const_29), .in2(out_ui_eq_expr_FU_32_0_32_54_i0_fu_alu_419511_419920), .in3(out_ui_eq_expr_FU_32_0_32_55_i0_fu_alu_419511_419923), .in4(1'b0), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4), .BITSIZE_out1(1)) fu_alu_419511_420017 (.out1(out_lut_expr_FU_5_i0_fu_alu_419511_420017), .in1(out_const_29), .in2(out_ui_eq_expr_FU_32_0_32_60_i0_fu_alu_419511_419938), .in3(out_ui_eq_expr_FU_32_0_32_59_i0_fu_alu_419511_419935), .in4(1'b0), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420024 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i1_fu_alu_419511_420024), .in1(out_ui_eq_expr_FU_32_0_32_36_i0_fu_alu_419511_419866), .in2(out_ui_plus_expr_FU_32_32_32_71_i1_fu_alu_419511_419742), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i0_fu_alu_419511_420006));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420033 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i2_fu_alu_419511_420033), .in1(out_ui_eq_expr_FU_32_0_32_37_i0_fu_alu_419511_419869), .in2(out_ui_minus_expr_FU_32_32_32_67_i0_fu_alu_419511_419556), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i1_fu_alu_419511_420024));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420042 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i3_fu_alu_419511_420042), .in1(out_ui_eq_expr_FU_32_0_32_38_i0_fu_alu_419511_419872), .in2(out_ui_bit_and_expr_FU_32_32_32_30_i0_fu_alu_419511_419561), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i2_fu_alu_419511_420033));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420051 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i4_fu_alu_419511_420051), .in1(out_ui_eq_expr_FU_32_0_32_39_i0_fu_alu_419511_419875), .in2(out_ui_bit_ior_expr_FU_32_32_32_33_i0_fu_alu_419511_419566), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i3_fu_alu_419511_420042));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420060 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i5_fu_alu_419511_420060), .in1(out_ui_eq_expr_FU_32_0_32_40_i0_fu_alu_419511_419878), .in2(out_ui_bit_xor_expr_FU_32_32_32_34_i0_fu_alu_419511_419571), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i4_fu_alu_419511_420051));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420069 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i6_fu_alu_419511_420069), .in1(out_ui_eq_expr_FU_32_0_32_41_i0_fu_alu_419511_419881), .in2(out_UUdata_converter_FU_12_i0_fu_alu_419511_419577), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i5_fu_alu_419511_420060));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420078 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i7_fu_alu_419511_420078), .in1(out_ui_eq_expr_FU_32_0_32_42_i0_fu_alu_419511_419884), .in2(out_UUdata_converter_FU_10_i0_fu_alu_419511_419593), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i6_fu_alu_419511_420069));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420087 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i8_fu_alu_419511_420087), .in1(out_ui_eq_expr_FU_32_0_32_43_i0_fu_alu_419511_419887), .in2(out_ui_rshift_expr_FU_32_32_32_75_i0_fu_alu_419511_419613), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i7_fu_alu_419511_420078));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420096 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i9_fu_alu_419511_420096), .in1(out_ui_eq_expr_FU_32_0_32_44_i0_fu_alu_419511_419890), .in2(out_IUdata_converter_FU_8_i0_fu_alu_419511_419944), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i8_fu_alu_419511_420087));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420105 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i10_fu_alu_419511_420105), .in1(out_ui_eq_expr_FU_32_0_32_45_i0_fu_alu_419511_419893), .in2(out_ui_rshift_expr_FU_32_32_32_75_i0_fu_alu_419511_419613), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i9_fu_alu_419511_420096));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420114 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i11_fu_alu_419511_420114), .in1(out_ui_eq_expr_FU_32_0_32_46_i0_fu_alu_419511_419896), .in2(out_ui_rshift_expr_FU_32_32_32_75_i1_fu_alu_419511_419618), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i10_fu_alu_419511_420105));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420123 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i12_fu_alu_419511_420123), .in1(out_ui_eq_expr_FU_32_0_32_47_i0_fu_alu_419511_419899), .in2(out_ui_lshift_expr_FU_32_32_32_65_i0_fu_alu_419511_419623), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i11_fu_alu_419511_420114));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420132 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i13_fu_alu_419511_420132), .in1(out_ui_eq_expr_FU_32_0_32_48_i0_fu_alu_419511_419902), .in2(out_ui_lshift_expr_FU_32_32_32_65_i1_fu_alu_419511_419628), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i12_fu_alu_419511_420123));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420141 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i14_fu_alu_419511_420141), .in1(out_ui_eq_expr_FU_32_0_32_51_i0_fu_alu_419511_419911), .in2(out_ui_plus_expr_FU_32_32_32_71_i0_fu_alu_419511_419640), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i13_fu_alu_419511_420132));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420150 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i15_fu_alu_419511_420150), .in1(out_ui_eq_expr_FU_32_0_32_56_i0_fu_alu_419511_419926), .in2(out_const_0), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i14_fu_alu_419511_420141));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420159 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i16_fu_alu_419511_420159), .in1(out_ui_eq_expr_FU_32_0_32_57_i0_fu_alu_419511_419929), .in2(out_const_0), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i15_fu_alu_419511_420150));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420168 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i17_fu_alu_419511_420168), .in1(out_ui_eq_expr_FU_32_0_32_58_i0_fu_alu_419511_419932), .in2(out_const_0), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i16_fu_alu_419511_420159));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420177 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i18_fu_alu_419511_420177), .in1(out_ui_eq_expr_FU_32_0_32_61_i0_fu_alu_419511_419941), .in2(out_const_0), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i17_fu_alu_419511_420168));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420186 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i19_fu_alu_419511_420186), .in1(out_lut_expr_FU_5_i0_fu_alu_419511_420017), .in2(out_const_0), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i18_fu_alu_419511_420177));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420195 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i20_fu_alu_419511_420195), .in1(out_lut_expr_FU_4_i0_fu_alu_419511_420014), .in2(out_ui_bit_ior_concat_expr_FU_32_i0_fu_alu_419511_419739), .in3(out_ui_cond_expr_FU_32_32_32_32_35_i19_fu_alu_419511_420186));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_420198 (.out1(out_UUdata_converter_FU_19_i0_fu_alu_419511_420198), .in1(out_lut_expr_FU_18_i0_fu_alu_419511_420260));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_420201 (.out1(out_UUdata_converter_FU_21_i0_fu_alu_419511_420201), .in1(out_lut_expr_FU_20_i0_fu_alu_419511_420268));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_alu_419511_420204 (.out1(out_ui_cond_expr_FU_32_32_32_32_35_i21_fu_alu_419511_420204), .in1(out_reg_4_reg_4), .in2(out_reg_0_reg_0), .in3(out_reg_5_reg_5));
  lut_expr_FU #(.BITSIZE_in1(13), .BITSIZE_out1(1)) fu_alu_419511_420260 (.out1(out_lut_expr_FU_18_i0_fu_alu_419511_420260), .in1(out_const_8), .in2(out_ui_eq_expr_FU_32_0_32_54_i0_fu_alu_419511_419920), .in3(out_ui_eq_expr_FU_32_0_32_55_i0_fu_alu_419511_419923), .in4(out_lut_expr_FU_13_i0_fu_alu_419511_420281), .in5(out_lut_expr_FU_17_i0_fu_alu_419511_420295), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16), .BITSIZE_out1(1)) fu_alu_419511_420268 (.out1(out_lut_expr_FU_20_i0_fu_alu_419511_420268), .in1(out_const_32), .in2(out_ui_eq_expr_FU_32_0_32_53_i0_fu_alu_419511_419917), .in3(out_ui_eq_expr_FU_32_0_32_52_i0_fu_alu_419511_419914), .in4(out_ui_eq_expr_FU_32_0_32_54_i0_fu_alu_419511_419920), .in5(out_ui_eq_expr_FU_32_0_32_55_i0_fu_alu_419511_419923), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_alu_419511_420281 (.out1(out_lut_expr_FU_13_i0_fu_alu_419511_420281), .in1(out_const_3), .in2(out_ui_eq_expr_FU_32_0_32_53_i0_fu_alu_419511_419917), .in3(out_ui_eq_expr_FU_32_0_32_52_i0_fu_alu_419511_419914), .in4(1'b0), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16), .BITSIZE_out1(1)) fu_alu_419511_420285 (.out1(out_lut_expr_FU_14_i0_fu_alu_419511_420285), .in1(out_const_25), .in2(out_ui_eq_expr_FU_32_32_32_62_i0_fu_alu_419511_419961), .in3(out_ui_ne_expr_FU_32_32_32_69_i0_fu_alu_419511_419964), .in4(out_ui_eq_expr_FU_32_0_32_56_i0_fu_alu_419511_419926), .in5(out_ui_eq_expr_FU_32_0_32_57_i0_fu_alu_419511_419929), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8), .BITSIZE_out1(1)) fu_alu_419511_420289 (.out1(out_lut_expr_FU_15_i0_fu_alu_419511_420289), .in1(out_const_19), .in2(out_lt_expr_FU_32_32_32_28_i0_fu_alu_419511_419973), .in3(out_ui_eq_expr_FU_32_0_32_58_i0_fu_alu_419511_419932), .in4(out_lut_expr_FU_14_i0_fu_alu_419511_420285), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8), .BITSIZE_out1(1)) fu_alu_419511_420292 (.out1(out_lut_expr_FU_16_i0_fu_alu_419511_420292), .in1(out_const_19), .in2(out_ui_ge_expr_FU_32_32_32_63_i0_fu_alu_419511_419976), .in3(out_ui_eq_expr_FU_32_0_32_61_i0_fu_alu_419511_419941), .in4(out_lut_expr_FU_15_i0_fu_alu_419511_420289), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16), .BITSIZE_out1(1)) fu_alu_419511_420295 (.out1(out_lut_expr_FU_17_i0_fu_alu_419511_420295), .in1(out_const_31), .in2(out_ui_eq_expr_FU_32_0_32_60_i0_fu_alu_419511_419938), .in3(out_ui_eq_expr_FU_32_0_32_59_i0_fu_alu_419511_419935), .in4(out_ui_lt_expr_FU_32_32_32_66_i0_fu_alu_419511_419979), .in5(out_lut_expr_FU_16_i0_fu_alu_419511_420292), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  join_signal #(.BITSIZE_in1(32), .PORTSIZE_in1(2), .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0), .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(32), .PORTSIZE_in1(2), .BITSIZE_out1(64)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0), .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(6), .PORTSIZE_in1(2), .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0), .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0), .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0), .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  register_STD #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0), .clock(clock), .reset(reset), .in1(out_ui_plus_expr_FU_32_32_32_71_i1_fu_alu_419511_419742), .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1), .clock(clock), .reset(reset), .in1(out_ui_pointer_plus_expr_FU_32_0_32_72_i0_fu_alu_419511_419751), .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_2 (.out1(out_reg_2_reg_2), .clock(clock), .reset(reset), .in1(out_ui_pointer_plus_expr_FU_32_0_32_73_i0_fu_alu_419511_419753), .wenable(wrenable_reg_2));
  register_STD #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_3 (.out1(out_reg_3_reg_3), .clock(clock), .reset(reset), .in1(out_ui_eq_expr_FU_32_0_32_49_i0_fu_alu_419511_419905), .wenable(wrenable_reg_3));
  register_STD #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_4 (.out1(out_reg_4_reg_4), .clock(clock), .reset(reset), .in1(out_lut_expr_FU_3_i0_fu_alu_419511_420011), .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5), .clock(clock), .reset(reset), .in1(out_ui_cond_expr_FU_32_32_32_32_35_i20_fu_alu_419511_420195), .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_6 (.out1(out_reg_6_reg_6), .clock(clock), .reset(reset), .in1(out_MUX_68_reg_6_0_0_0), .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_7 (.out1(out_reg_7_reg_7), .clock(clock), .reset(reset), .in1(out_MUX_69_reg_7_0_0_0), .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8), .clock(clock), .reset(reset), .in1(out_MUX_70_reg_8_0_0_0), .wenable(wrenable_reg_8));
  register_STD #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_9 (.out1(out_reg_9_reg_9), .clock(clock), .reset(reset), .in1(out_UUdata_converter_FU_25_i0_fu_alu_419511_419748), .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(64), .BITSIZE_out1(32), .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram), .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(64), .BITSIZE_out1(32), .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram), .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12), .BITSIZE_out1(6), .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size), .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2), .BITSIZE_out1(1), .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram), .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2), .BITSIZE_out1(1), .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram), .in1(sig_out_bus_mergerMout_we_ram4_));
  // io-signal post fix
  assign OUT_MULTIIF_alu_419511_419857 = out_multi_read_cond_FU_22_i0_fu_alu_419511_419857;

endmodule

// FSM based controller description for alu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_alu(done_port, fuselector_BMEMORY_CTRLN_27_i0_LOAD, fuselector_BMEMORY_CTRLN_27_i0_STORE, fuselector_BMEMORY_CTRLN_27_i1_LOAD, fuselector_BMEMORY_CTRLN_27_i1_STORE, selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0, selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0, selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0, selector_MUX_68_reg_6_0_0_0, selector_MUX_69_reg_7_0_0_0, selector_MUX_70_reg_8_0_0_0, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, wrenable_reg_7, wrenable_reg_8, wrenable_reg_9, OUT_MULTIIF_alu_419511_419857, clock, reset, start_port);
  // IN
  input OUT_MULTIIF_alu_419511_419857;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_27_i0_STORE;
  output fuselector_BMEMORY_CTRLN_27_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_27_i1_STORE;
  output selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  output selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0;
  output selector_MUX_68_reg_6_0_0_0;
  output selector_MUX_69_reg_7_0_0_0;
  output selector_MUX_70_reg_8_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [2:0] S_1 = 3'd1,
    S_2 = 3'd2,
    S_0 = 3'd0,
    S_3 = 3'd3,
    S_4 = 3'd4,
    S_5 = 3'd5;
  reg [2:0] _present_state, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_27_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_27_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_27_i1_STORE;
  reg selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  reg selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0;
  reg selector_MUX_68_reg_6_0_0_0;
  reg selector_MUX_69_reg_7_0_0_0;
  reg selector_MUX_70_reg_8_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_1;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_27_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_27_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_27_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_27_i1_STORE = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 = 1'b0;
    selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0 = 1'b0;
    selector_MUX_68_reg_6_0_0_0 = 1'b0;
    selector_MUX_69_reg_7_0_0_0 = 1'b0;
    selector_MUX_70_reg_8_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_1 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          _next_state = S_2;
        end
        else
        begin
          selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0 = 1'bX;
          selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 = 1'bX;
          selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0 = 1'bX;
          selector_MUX_68_reg_6_0_0_0 = 1'bX;
          selector_MUX_69_reg_7_0_0_0 = 1'bX;
          selector_MUX_70_reg_8_0_0_0 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_2 = 1'bX;
          wrenable_reg_3 = 1'bX;
          wrenable_reg_4 = 1'bX;
          wrenable_reg_5 = 1'bX;
          wrenable_reg_6 = 1'bX;
          wrenable_reg_7 = 1'bX;
          wrenable_reg_8 = 1'bX;
          wrenable_reg_9 = 1'bX;
          _next_state = S_1;
        end
      S_2 :
        begin
          selector_MUX_70_reg_8_0_0_0 = 1'b1;
          wrenable_reg_8 = 1'b1;
          if (OUT_MULTIIF_alu_419511_419857 == 1'b1)
            begin
              _next_state = S_0;
              selector_MUX_70_reg_8_0_0_0 = 1'b0;
              wrenable_reg_8 = 1'b0;
            end
          else
            begin
              _next_state = S_3;
            end
        end
      S_0 :
        begin
          selector_MUX_68_reg_6_0_0_0 = 1'b1;
          selector_MUX_69_reg_7_0_0_0 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          fuselector_BMEMORY_CTRLN_27_i0_STORE = 1'b1;
          fuselector_BMEMORY_CTRLN_27_i1_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_4;
        end
      S_4 :
        begin
          fuselector_BMEMORY_CTRLN_27_i0_STORE = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 = 1'b1;
          selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0 = 1'b1;
          _next_state = S_5;
          done_port = 1'b1;
        end
      S_5 :
        begin
          _next_state = S_1;
        end
      default :
        begin
          _next_state = S_1;
          selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0 = 1'bX;
          selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0 = 1'bX;
          selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0 = 1'bX;
          selector_MUX_68_reg_6_0_0_0 = 1'bX;
          selector_MUX_69_reg_7_0_0_0 = 1'bX;
          selector_MUX_70_reg_8_0_0_0 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_2 = 1'bX;
          wrenable_reg_3 = 1'bX;
          wrenable_reg_4 = 1'bX;
          wrenable_reg_5 = 1'bX;
          wrenable_reg_6 = 1'bX;
          wrenable_reg_7 = 1'bX;
          wrenable_reg_8 = 1'bX;
          wrenable_reg_9 = 1'bX;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock, reset, in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for alu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _alu(clock, reset, start_port, done_port, P0, P1, P2, P3, P4, P5, M_Rdata_ram, M_DataRdy, Min_oe_ram, Min_we_ram, Min_addr_ram, Min_Wdata_ram, Min_data_ram_size, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] P0;
  input [31:0] P1;
  input [31:0] P2;
  input [31:0] P3;
  input [31:0] P4;
  input [31:0] P5;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_MULTIIF_alu_419511_419857;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_27_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_27_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_27_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_27_i1_STORE;
  wire selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0;
  wire selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0;
  wire selector_MUX_68_reg_6_0_0_0;
  wire selector_MUX_69_reg_7_0_0_0;
  wire selector_MUX_70_reg_8_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_alu Controller_i (.done_port(done_delayed_REG_signal_in), .fuselector_BMEMORY_CTRLN_27_i0_LOAD(fuselector_BMEMORY_CTRLN_27_i0_LOAD), .fuselector_BMEMORY_CTRLN_27_i0_STORE(fuselector_BMEMORY_CTRLN_27_i0_STORE), .fuselector_BMEMORY_CTRLN_27_i1_LOAD(fuselector_BMEMORY_CTRLN_27_i1_LOAD), .fuselector_BMEMORY_CTRLN_27_i1_STORE(fuselector_BMEMORY_CTRLN_27_i1_STORE), .selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0), .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0), .selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0(selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0), .selector_MUX_68_reg_6_0_0_0(selector_MUX_68_reg_6_0_0_0), .selector_MUX_69_reg_7_0_0_0(selector_MUX_69_reg_7_0_0_0), .selector_MUX_70_reg_8_0_0_0(selector_MUX_70_reg_8_0_0_0), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6), .wrenable_reg_7(wrenable_reg_7), .wrenable_reg_8(wrenable_reg_8), .wrenable_reg_9(wrenable_reg_9), .OUT_MULTIIF_alu_419511_419857(OUT_MULTIIF_alu_419511_419857), .clock(clock), .reset(reset), .start_port(start_port));
  datapath_alu Datapath_i (.Mout_oe_ram(Mout_oe_ram), .Mout_we_ram(Mout_we_ram), .Mout_addr_ram(Mout_addr_ram), .Mout_Wdata_ram(Mout_Wdata_ram), .Mout_data_ram_size(Mout_data_ram_size), .OUT_MULTIIF_alu_419511_419857(OUT_MULTIIF_alu_419511_419857), .clock(clock), .reset(reset), .in_port_P0(P0), .in_port_P1(P1), .in_port_P2(P2), .in_port_P3(P3), .in_port_P4(P4), .in_port_P5(P5), .M_Rdata_ram(M_Rdata_ram), .M_DataRdy(M_DataRdy), .Min_oe_ram(Min_oe_ram), .Min_we_ram(Min_we_ram), .Min_addr_ram(Min_addr_ram), .Min_Wdata_ram(Min_Wdata_ram), .Min_data_ram_size(Min_data_ram_size), .fuselector_BMEMORY_CTRLN_27_i0_LOAD(fuselector_BMEMORY_CTRLN_27_i0_LOAD), .fuselector_BMEMORY_CTRLN_27_i0_STORE(fuselector_BMEMORY_CTRLN_27_i0_STORE), .fuselector_BMEMORY_CTRLN_27_i1_LOAD(fuselector_BMEMORY_CTRLN_27_i1_LOAD), .fuselector_BMEMORY_CTRLN_27_i1_STORE(fuselector_BMEMORY_CTRLN_27_i1_STORE), .selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_27_i0_0_0_0), .selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_27_i0_1_0_0), .selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0(selector_MUX_2_BMEMORY_CTRLN_27_i0_2_0_0), .selector_MUX_68_reg_6_0_0_0(selector_MUX_68_reg_6_0_0_0), .selector_MUX_69_reg_7_0_0_0(selector_MUX_69_reg_7_0_0_0), .selector_MUX_70_reg_8_0_0_0(selector_MUX_70_reg_8_0_0_0), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6), .wrenable_reg_7(wrenable_reg_7), .wrenable_reg_8(wrenable_reg_8), .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1), .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out), .clock(clock), .reset(reset), .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: alu
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module alu(clock, reset, start_port, P0, P1, P2, P3, P4, P5, M_Rdata_ram, M_DataRdy, done_port, Mout_oe_ram, Mout_we_ram, Mout_addr_ram, Mout_Wdata_ram, Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] P0;
  input [31:0] P1;
  input [31:0] P2;
  input [31:0] P3;
  input [31:0] P4;
  input [31:0] P5;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  
  _alu _alu_i0 (.done_port(done_port), .Mout_oe_ram(Mout_oe_ram), .Mout_we_ram(Mout_we_ram), .Mout_addr_ram(Mout_addr_ram), .Mout_Wdata_ram(Mout_Wdata_ram), .Mout_data_ram_size(Mout_data_ram_size), .clock(clock), .reset(reset), .start_port(start_port), .P0(P0), .P1(P1), .P2(P2), .P3(P3), .P4(P4), .P5(P5), .M_Rdata_ram(M_Rdata_ram), .M_DataRdy(M_DataRdy), .Min_oe_ram({1'b0, 1'b0}), .Min_we_ram({1'b0, 1'b0}), .Min_addr_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .Min_Wdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .Min_data_ram_size({6'b000000, 6'b000000}));

endmodule


