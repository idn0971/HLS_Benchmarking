// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.6 - Revision 5e5e306b86383a7d85274d64977a3d71fdcff4fe-master - Date 2020-06-09T15:06:58
// bambu executed with: bambu --compiler=I386_CLANG6 --simulate --simulator=VERILATOR ../cpu.c 
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
module ARRAY_1D_STD_BRAM_NN_SDS_BASE(clock, reset, in1, in2, in3, out1, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, Sout_Rdata_ram, S_data_ram_size, Sin_DataRdy, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2, BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2, BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2, BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2, BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2, BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2, BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2, BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2, MEMORY_INIT_file="array.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, READ_ONLY_MEMORY=0, USE_SPARSE_MEMORY=1, HIGH_LATENCY=0, BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2, BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2, BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2, BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2, BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2, BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  
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
  parameter n_byte_data = BRAM_BITSIZE/8;
  parameter n_bytes = n_elements*n_byte_data;
  parameter n_byte_on_databus = BRAM_BITSIZE/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes%(n_byte_on_databus) == 0 ? 0 : 1);
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : $clog2(n_mem_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : $clog2(n_byte_on_databus);
  `else
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : log2(n_mem_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  wire [max_n_writes-1:0] bram_write_temp;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a_temp;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_writes-1:0] din_value_aggregated_temp;
  reg [data_size*max_n_reads-1:0] dout_a =0;
  reg [data_size*max_n_reads-1:0] dout_a_registered =0;
  reg [data_size-1:0] dout_a_registered_0 =0;
  reg [data_size-1:0] dout_a_registered_1 =0;
  wire [nbit_addr*max_n_rw-1:0] tmp_addr;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_mem_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_mem_elements-1);
  end
  
  generate
    if(HIGH_LATENCY==2)
    begin
      (* syn_keep=1 *)reg [nbit_read_addr*max_n_rw-1:0] memory_addr_a_reg =0;
      (* syn_keep=1 *)reg [data_size*max_n_writes-1:0] din_value_aggregated_reg =0;
      (* syn_keep=1 *)reg [max_n_writes-1:0] bram_write_reg =0;
      always @ (posedge clock)
      begin
         memory_addr_a_reg <= memory_addr_a;
         bram_write_reg <= bram_write;
         din_value_aggregated_reg <= din_value_aggregated;
      end
      assign memory_addr_a_temp = memory_addr_a_reg;
      assign bram_write_temp = bram_write_reg;
      assign din_value_aggregated_temp = din_value_aggregated_reg;
    end
    else
    begin
      assign memory_addr_a_temp = memory_addr_a;
      assign bram_write_temp = bram_write;
      assign din_value_aggregated_temp = din_value_aggregated;
    end
  endgenerate
  
  generate
  genvar ind2;
  for (ind2=0; ind2<max_n_rw; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*nbit_addr-1:ind2*nbit_addr] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_mem_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11, i12;
    if(n_mem_elements==1)
    begin : single_element
      always @(posedge clock)
      begin
        for (index2=0; index2<max_n_reads; index2=index2+1)
        begin : L12_single_read
          if(HIGH_LATENCY==0)
          begin
            dout_a[data_size*index2+:data_size] <= memory[memory_addr_a_temp[nbit_read_addr*index2+:nbit_read_addr]];
          end
          else
          begin
            dout_a_registered[data_size*index2+:data_size] <= memory[memory_addr_a_temp[nbit_read_addr*index2+:nbit_read_addr]];
            dout_a[data_size*index2+:data_size] <= dout_a_registered[data_size*index2+:data_size];
          end
        end
        for (index2=0; index2<max_n_writes; index2=index2+1)
        begin : L12_single_write
          if(READ_ONLY_MEMORY==0)
          begin
            if(bram_write_temp[index2])
              memory[memory_addr_a_temp[nbit_read_addr*index2+:nbit_read_addr]] <= din_value_aggregated_temp[data_size*index2+:data_size];
          end
        end
      end
    end
    else
    begin : multiple_elements
      if(max_n_rw ==2)
      begin
        always @(posedge clock)
        begin
          if(READ_ONLY_MEMORY==0)
          begin
            if(bram_write_temp[0])
              memory[memory_addr_a_temp[nbit_read_addr*(0+1)-1:nbit_read_addr*0]] <= din_value_aggregated_temp[data_size*0+:data_size];
          end
          if(HIGH_LATENCY==0)
          begin
            dout_a[data_size*(0+1)-1:data_size*0] <= memory[memory_addr_a_temp[nbit_read_addr*(0+1)-1:nbit_read_addr*0]];
          end
          else
          begin
            dout_a_registered_0 <= memory[memory_addr_a_temp[nbit_read_addr*(0+1)-1:nbit_read_addr*0]];
            dout_a[data_size*(0+1)-1:data_size*0] <= dout_a_registered_0;
          end
        end
        always @(posedge clock)
        begin
          if(READ_ONLY_MEMORY==0)
          begin
            if(bram_write_temp[1])
              memory[memory_addr_a_temp[nbit_read_addr*(1+1)-1:nbit_read_addr*1]] <= din_value_aggregated_temp[data_size*1+:data_size];
          end
          if(HIGH_LATENCY==0)
          begin
            dout_a[data_size*(1+1)-1:data_size*1] <= memory[memory_addr_a_temp[nbit_read_addr*(1+1)-1:nbit_read_addr*1]];
          end
          else
          begin
            dout_a_registered_1 <= memory[memory_addr_a_temp[nbit_read_addr*(1+1)-1:nbit_read_addr*1]];
            dout_a[data_size*(1+1)-1:data_size*1] <= dout_a_registered_1;
          end
        end
      end
      else
      begin
        //not supported
      end
    end    
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = sel_STORE[i21] || proxy_sel_STORE[i21];
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_NN_SDS(clock, reset, in1, in2, in3, in4, out1, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, Sout_Rdata_ram, S_data_ram_size, Sin_DataRdy, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_in4=1, PORTSIZE_in4=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2, BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2, BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2, BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2, BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2, BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2, BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2, BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2, MEMORY_INIT_file="array.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, READ_ONLY_MEMORY=0, USE_SPARSE_MEMORY=1, BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2, BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2, BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2, BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2, BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2, BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  ARRAY_1D_STD_BRAM_NN_SDS_BASE #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .MEMORY_INIT_file(MEMORY_INIT_file), .n_elements(n_elements), .data_size(data_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .READ_ONLY_MEMORY(READ_ONLY_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .HIGH_LATENCY(0), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1)) ARRAY_1D_STD_BRAM_NN_instance (.out1(out1), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .proxy_out1(proxy_out1), .clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .sel_LOAD(sel_LOAD & in4), .sel_STORE(sel_STORE & in4), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size ), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_DISTRAM_NN_SDS(clock, reset, in1, in2, in3, in4, out1, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, Sout_Rdata_ram, S_data_ram_size, Sin_DataRdy, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_in4=1, PORTSIZE_in4=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2, BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2, BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2, BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2, BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2, BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2, BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2, BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2, MEMORY_INIT_file="array.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, READ_ONLY_MEMORY=0, USE_SPARSE_MEMORY=1, BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2, BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2, BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2, BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2, BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2, BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
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
  parameter n_byte_data = BRAM_BITSIZE/8;
  parameter n_bytes = n_elements*n_byte_data;
  parameter n_byte_on_databus = BRAM_BITSIZE/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes % (n_byte_on_databus) == 0 ? 0 : 1);
  parameter nbit_addr = BITSIZE_in2 > BITSIZE_proxy_in2 ? BITSIZE_in2 : BITSIZE_proxy_in2;
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : $clog2(n_mem_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : $clog2(n_byte_on_databus);
  `else
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : log2(n_mem_elements);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr-1:0] memory_addr_a_0;
  wire [nbit_read_addr-1:0] memory_addr_a_1;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_reads-1:0] dout_a;
  wire [nbit_addr*max_n_rw-1:0] tmp_addr;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_elements-1);
  end
  
  generate
  genvar ind2;
  for (ind2=0; ind2<max_n_rw; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*nbit_addr-1:ind2*nbit_addr] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6)*nbit_addr+nbit_addr-1:i6*nbit_addr];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*nbit_addr-1:i6*nbit_addr]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_mem_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11;
    for (i11=0; i11<max_n_reads; i11=i11+1)
    begin : asynchronous_read
      assign dout_a[data_size*i11+:data_size] = memory[memory_addr_a[nbit_read_addr*i11+:nbit_read_addr]];
    end
  endgenerate
  
  assign memory_addr_a_0 = memory_addr_a[nbit_read_addr*0+:nbit_read_addr];
  assign memory_addr_a_1 = memory_addr_a[nbit_read_addr*1+:nbit_read_addr];
  
  generate if(READ_ONLY_MEMORY==0)
    always @(posedge clock)
    begin
      if(bram_write[0])
        memory[memory_addr_a_0] <= din_value_aggregated[data_size*0+:data_size];
      if(bram_write[1])
        memory[memory_addr_a_1] <= din_value_aggregated[data_size*1+:data_size];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = int_sel_STORE[i21] || proxy_sel_STORE[i21];
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  
  assign Sout_DataRdy = Sin_DataRdy;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_extract_bit_expr_FU(in1, in2, out1);
  parameter BITSIZE_in1=1, BITSIZE_in2=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output out1;
  assign out1 = (in1 >> in2)&1;
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
module read_cond_FU(in1, out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
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
module ASSIGN_UNSIGNED_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
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
module ui_view_convert_expr_FU(in1, out1);
  parameter BITSIZE_in1=1, BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
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
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ADDRESS_DECODING_LOGIC_NN(clock, reset, in1, in2, in3, out1, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, Sout_Rdata_ram, S_data_ram_size, Sin_DataRdy, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1, dout_a, dout_b, memory_addr_a, memory_addr_b, din_value_aggregated_swapped, be_swapped, bram_write);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2, BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2, BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2, BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2, BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2, BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2, BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2, BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2, BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, USE_SPARSE_MEMORY=1, HIGH_LATENCY=0, BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2, BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2, BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2, BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2, BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2, BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2, BITSIZE_dout_a=1, PORTSIZE_dout_a=2, BITSIZE_dout_b=1, PORTSIZE_dout_b=2, BITSIZE_memory_addr_a=1, PORTSIZE_memory_addr_a=2, BITSIZE_memory_addr_b=1, PORTSIZE_memory_addr_b=2, BITSIZE_din_value_aggregated_swapped=1, PORTSIZE_din_value_aggregated_swapped=2, BITSIZE_be_swapped=1, PORTSIZE_be_swapped=2, BITSIZE_bram_write=1, PORTSIZE_bram_write=2, nbit_read_addr=32, n_byte_on_databus=4, n_mem_elements=4, max_n_reads=2, max_n_writes=2, max_n_rw=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  input [(PORTSIZE_dout_a*BITSIZE_dout_a)+(-1):0] dout_a;
  input [(PORTSIZE_dout_b*BITSIZE_dout_b)+(-1):0] dout_b;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  output [(PORTSIZE_memory_addr_a*BITSIZE_memory_addr_a)+(-1):0] memory_addr_a;
  output [(PORTSIZE_memory_addr_b*BITSIZE_memory_addr_b)+(-1):0] memory_addr_b;
  output [(PORTSIZE_din_value_aggregated_swapped*BITSIZE_din_value_aggregated_swapped)+(-1):0] din_value_aggregated_swapped;
  output [(PORTSIZE_be_swapped*BITSIZE_be_swapped)+(-1):0] be_swapped;
  output [PORTSIZE_bram_write-1:0] bram_write;
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
    parameter nbit_addr = BITSIZE_S_addr_ram/*n_bytes ==  1 ? 1 : $clog2(n_bytes)*/;
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 1 : $clog2(n_byte_on_databus);
    parameter nbits_address_space_rangesize = $clog2(address_space_rangesize);
  `else
    parameter nbit_addr = BITSIZE_S_addr_ram/*n_bytes ==  1 ? 1 : log2(n_bytes)*/;
    parameter nbits_address_space_rangesize = log2(address_space_rangesize);
    parameter nbits_byte_offset = n_byte_on_databus==1 ? 1 : log2(n_byte_on_databus);
  `endif
   parameter memory_bitsize = 2*BRAM_BITSIZE;
  
  function [n_byte_on_databus*max_n_writes-1:0] CONV;
    input [n_byte_on_databus*max_n_writes-1:0] po2;
  begin
    case (po2)
      1:CONV=(1<<1)-1;
      2:CONV=(1<<2)-1;
      4:CONV=(1<<4)-1;
      8:CONV=(1<<8)-1;
      16:CONV=(1<<16)-1;
      32:CONV=(1<<32)-1;
      default:CONV=-1;
    endcase
  end
  endfunction
  
  wire [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] tmp_addr;
  wire [n_byte_on_databus*max_n_writes-1:0] conv_in;
  wire [n_byte_on_databus*max_n_writes-1:0] conv_out;
  wire [PORTSIZE_S_addr_ram-1:0] cs;
  wire [PORTSIZE_S_oe_ram-1:0] oe_ram_cs;
  wire [PORTSIZE_S_we_ram-1:0] we_ram_cs;
  wire [nbit_addr*max_n_rw-1:0] relative_addr;
  wire [memory_bitsize*max_n_writes-1:0] din_value_aggregated;
  wire [memory_bitsize*PORTSIZE_S_Wdata_ram-1:0] S_Wdata_ram_int;
  wire [memory_bitsize*max_n_reads-1:0] out1_shifted;
  wire [memory_bitsize*max_n_reads-1:0] dout;
  wire [nbits_byte_offset*max_n_rw-1:0] byte_offset;
  wire [n_byte_on_databus*max_n_writes-1:0] be;
  
  reg [PORTSIZE_S_we_ram-1:0] we_ram_cs_delayed =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed_registered =0;
  reg [PORTSIZE_S_oe_ram-1:0] oe_ram_cs_delayed_registered1 =0;
  reg [max_n_reads-1:0] delayed_swapped_bit =0;
  reg [max_n_reads-1:0] delayed_swapped_bit_registered =0;
  reg [max_n_reads-1:0] delayed_swapped_bit_registered1 =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset_registered =0;
  reg [nbits_byte_offset*max_n_reads-1:0] delayed_byte_offset_registered1 =0;
  
  generate
  genvar ind2;
  for (ind2=0; ind2<PORTSIZE_in2; ind2=ind2+1)
    begin : Lind2
      assign tmp_addr[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2] = (proxy_sel_LOAD[ind2]||proxy_sel_STORE[ind2]) ? proxy_in2[(ind2+1)*BITSIZE_proxy_in2-1:ind2*BITSIZE_proxy_in2] : in2[(ind2+1)*BITSIZE_in2-1:ind2*BITSIZE_in2];
    end
  endgenerate
  
  generate
  genvar i2;
    for (i2=0;i2<max_n_reads;i2=i2+1)
    begin : L_copy
        assign dout[(memory_bitsize/2)+memory_bitsize*i2-1:memory_bitsize*i2] = delayed_swapped_bit[i2] ? dout_a[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2] : dout_b[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2];
        assign dout[memory_bitsize*(i2+1)-1:memory_bitsize*i2+(memory_bitsize/2)] = delayed_swapped_bit[i2] ? dout_b[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2] : dout_a[(memory_bitsize/2)*(i2+1)-1:(memory_bitsize/2)*i2];
        always @(posedge clock)
        begin
          if(HIGH_LATENCY == 0)
            delayed_swapped_bit[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
          else if(HIGH_LATENCY == 1)
          begin
            delayed_swapped_bit_registered[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
            delayed_swapped_bit[i2] <= delayed_swapped_bit_registered[i2];
          end
          else
          begin
            delayed_swapped_bit_registered1[i2] <= !relative_addr[nbits_byte_offset+i2*nbit_addr-1];
            delayed_swapped_bit_registered[i2] <= delayed_swapped_bit_registered1[i2];
            delayed_swapped_bit[i2] <= delayed_swapped_bit_registered[i2];
          end
        end
    end
  endgenerate
  
  generate
  genvar i3;
    for (i3=0; i3<PORTSIZE_S_addr_ram; i3=i3+1)
    begin : L3
      if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0)
        assign cs[i3] = (S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram] >= (address_space_begin)) && (S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram] < (address_space_begin+address_space_rangesize));
      else if(PRIVATE_MEMORY==0)
        assign cs[i3] = S_addr_ram[(i3+1)*BITSIZE_S_addr_ram-1:i3*BITSIZE_S_addr_ram+nbits_address_space_rangesize] == address_space_begin[nbit_addr-1:nbits_address_space_rangesize];
      else
        assign cs[i3] = 1'b0;
    end
  endgenerate
  
  generate
  genvar i4;
    for (i4=0; i4<PORTSIZE_S_oe_ram; i4=i4+1)
    begin : L4
      assign oe_ram_cs[i4] = S_oe_ram[i4] & cs[i4];
    end
  endgenerate
  
  generate
  genvar i5;
    for (i5=0; i5<PORTSIZE_S_we_ram; i5=i5+1)
    begin : L5
      assign we_ram_cs[i5] = S_we_ram[i5] & cs[i5];
    end
  endgenerate
  
  generate
  genvar i6;
    for (i6=0; i6<max_n_rw; i6=i6+1)
    begin : L6
      if(PRIVATE_MEMORY==0 && USE_SPARSE_MEMORY==0 && i6< PORTSIZE_S_addr_ram)
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = ((i6 < max_n_writes && (sel_STORE[i6]==1'b1 || proxy_sel_STORE[i6]==1'b1)) || (i6 < max_n_reads && (sel_LOAD[i6]==1'b1 || proxy_sel_LOAD[i6]==1'b1))) ? tmp_addr[(i6+1)*BITSIZE_in2-1:i6*BITSIZE_in2]-address_space_begin: S_addr_ram[(i6+1)*BITSIZE_S_addr_ram-1:i6*BITSIZE_S_addr_ram]-address_space_begin;
      else if(PRIVATE_MEMORY==0 && i6< PORTSIZE_S_addr_ram)
        assign relative_addr[(i6)*nbit_addr+nbits_address_space_rangesize-1:i6*nbit_addr] = ((i6 < max_n_writes && (sel_STORE[i6]==1'b1 || proxy_sel_STORE[i6]==1'b1)) || (i6 < max_n_reads && (sel_LOAD[i6]==1'b1 || proxy_sel_LOAD[i6]==1'b1))) ? tmp_addr[(i6)*BITSIZE_in2+nbits_address_space_rangesize-1:i6*BITSIZE_in2] : S_addr_ram[(i6)*BITSIZE_S_addr_ram+nbits_address_space_rangesize-1:i6*BITSIZE_S_addr_ram];
      else if(USE_SPARSE_MEMORY==1)
        assign relative_addr[(i6)*nbit_addr+nbits_address_space_rangesize-1:i6*nbit_addr] = tmp_addr[(i6)*BITSIZE_in2+nbits_address_space_rangesize-1:i6*BITSIZE_in2];
      else
        assign relative_addr[(i6+1)*nbit_addr-1:i6*nbit_addr] = tmp_addr[(i6+1)*BITSIZE_in2-1:i6*BITSIZE_in2]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7;
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_A
      if (n_mem_elements==1)
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = !relative_addr[nbits_byte_offset+i7*nbit_addr-1] ? relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr] : (relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr-1]+ 1'b1) >> 1;
    end
  endgenerate
  
  generate
    for (i7=0; i7<max_n_rw; i7=i7+1)
    begin : L7_B
      if (n_mem_elements==1)
        assign memory_addr_b[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_b[(i7+1)*nbit_read_addr-1:i7*nbit_read_addr] = !relative_addr[nbits_byte_offset+i7*nbit_addr-1] ? (relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr-1] + 1'b1) >> 1 : relative_addr[nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr:nbits_byte_offset+i7*nbit_addr];
    end
  endgenerate
  
  generate
  genvar i8;
    for (i8=0; i8<max_n_rw; i8=i8+1)
    begin : L8
      if (n_byte_on_databus==2)
        assign byte_offset[(i8+1)*nbits_byte_offset-1:i8*nbits_byte_offset] = {nbits_byte_offset{1'b0}};
      else
        assign byte_offset[(i8+1)*nbits_byte_offset-1:i8*nbits_byte_offset] = {1'b0, relative_addr[nbits_byte_offset+i8*nbit_addr-2:i8*nbit_addr]};
    end
  endgenerate
  
  generate
  genvar i9, i10;
    for (i9=0; i9<max_n_writes; i9=i9+1)
    begin : byte_enable
      if(PRIVATE_MEMORY==0 && i9 < PORTSIZE_S_data_ram_size)
      begin
        assign conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = proxy_sel_STORE[i9] ? proxy_in3[BITSIZE_proxy_in3+BITSIZE_proxy_in3*i9-1:3+BITSIZE_proxy_in3*i9] : (sel_STORE[i9] ? in3[BITSIZE_in3+BITSIZE_in3*i9-1:3+BITSIZE_in3*i9] : S_data_ram_size[BITSIZE_S_data_ram_size+BITSIZE_S_data_ram_size*i9-1:3+BITSIZE_S_data_ram_size*i9]);
        assign conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = CONV(conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus]);
        assign be[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] << byte_offset[(i9+1)*nbits_byte_offset-1:i9*nbits_byte_offset];
      end
      else
      begin
        assign conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = proxy_sel_STORE[i9] ? proxy_in3[BITSIZE_proxy_in3+BITSIZE_proxy_in3*i9-1:3+BITSIZE_proxy_in3*i9] : in3[BITSIZE_in3+BITSIZE_in3*i9-1:3+BITSIZE_in3*i9];
        assign conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = CONV(conv_in[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus]);
        assign be[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] = conv_out[(i9+1)*n_byte_on_databus-1:i9*n_byte_on_databus] << byte_offset[(i9+1)*nbits_byte_offset-1:i9*nbits_byte_offset];
      end
    end
  endgenerate
  
  generate
    for (i9=0; i9<max_n_writes; i9=i9+1)
    begin : L9_swapped
      for (i10=0; i10<n_byte_on_databus/2; i10=i10+1)
      begin  : byte_enable_swapped
        assign be_swapped[i10+i9*n_byte_on_databus] = !relative_addr[nbits_byte_offset+i9*nbit_addr-1] ? be[i10+i9*n_byte_on_databus] : be[i10+i9*n_byte_on_databus+n_byte_on_databus/2];
        assign be_swapped[i10+i9*n_byte_on_databus+n_byte_on_databus/2] =  !relative_addr[nbits_byte_offset+i9*nbit_addr-1] ? be[i10+i9*n_byte_on_databus+n_byte_on_databus/2] : be[i10+i9*n_byte_on_databus];
      end
    end
  endgenerate
    
  generate
  genvar i13;
    for (i13=0; i13<PORTSIZE_S_Wdata_ram; i13=i13+1)
    begin : L13
      if (BITSIZE_S_Wdata_ram < memory_bitsize)
        assign S_Wdata_ram_int[memory_bitsize*(i13+1)-1:memory_bitsize*i13] = {{memory_bitsize-BITSIZE_S_Wdata_ram{1'b0}}, S_Wdata_ram[(i13+1)*BITSIZE_S_Wdata_ram-1:BITSIZE_S_Wdata_ram*i13]};
      else
        assign S_Wdata_ram_int[memory_bitsize*(i13+1)-1:memory_bitsize*i13] = S_Wdata_ram[memory_bitsize+BITSIZE_S_Wdata_ram*i13-1:BITSIZE_S_Wdata_ram*i13];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      if(PRIVATE_MEMORY==0 && i14 < PORTSIZE_S_Wdata_ram)
        assign din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : (sel_STORE[i14] ? in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : S_Wdata_ram_int[memory_bitsize*(i14+1)-1:memory_bitsize*i14] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8);
      else
        assign din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize] = proxy_sel_STORE[i14] ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8 : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1] << byte_offset[(i14+1)*nbits_byte_offset-1:i14*nbits_byte_offset]*8;
    end
  endgenerate
  
  generate
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14_swapped
      assign din_value_aggregated_swapped[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize] = !relative_addr[nbits_byte_offset+i14*nbit_addr-1] ? din_value_aggregated[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize] : din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2];
      assign din_value_aggregated_swapped[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2] = !relative_addr[nbits_byte_offset+i14*nbit_addr-1] ?  din_value_aggregated[(i14+1)*memory_bitsize-1:i14*memory_bitsize+memory_bitsize/2] : din_value_aggregated[(i14)*memory_bitsize+memory_bitsize/2-1:i14*memory_bitsize];
    end
  endgenerate
  
  generate
  genvar i15;
    for (i15=0; i15<max_n_reads; i15=i15+1)
    begin : L15
      assign out1_shifted[(i15+1)*memory_bitsize-1:i15*memory_bitsize] = dout[(i15+1)*memory_bitsize-1:i15*memory_bitsize] >> delayed_byte_offset[(i15+1)*nbits_byte_offset-1:i15*nbits_byte_offset]*8;
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = out1_shifted[i20*memory_bitsize+BITSIZE_out1-1:i20*memory_bitsize];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = out1_shifted[i20*memory_bitsize+BITSIZE_proxy_out1-1:i20*memory_bitsize];
    end
  endgenerate
  
  generate
  genvar i16;
    for (i16=0; i16<PORTSIZE_S_oe_ram; i16=i16+1)
    begin : L16
      always @(posedge clock )
      begin
        if(reset == 1'b0)
          begin
            oe_ram_cs_delayed[i16] <= 1'b0;
            if(HIGH_LATENCY != 0) oe_ram_cs_delayed_registered[i16] <= 1'b0;
            if(HIGH_LATENCY == 2) oe_ram_cs_delayed_registered1[i16] <= 1'b0;
          end
        else
          if(HIGH_LATENCY == 0)
          begin
            oe_ram_cs_delayed[i16] <= oe_ram_cs[i16] & (!oe_ram_cs_delayed[i16] | BUS_PIPELINED);
          end
          else if(HIGH_LATENCY == 1)
          begin
            oe_ram_cs_delayed_registered[i16] <= oe_ram_cs[i16] & ((!oe_ram_cs_delayed_registered[i16] & !oe_ram_cs_delayed[i16]) | BUS_PIPELINED);
            oe_ram_cs_delayed[i16] <= oe_ram_cs_delayed_registered[i16];
          end
          else
          begin
            oe_ram_cs_delayed_registered1[i16] <= oe_ram_cs[i16] & ((!oe_ram_cs_delayed_registered1[i16] & !oe_ram_cs_delayed_registered[i16] & !oe_ram_cs_delayed[i16]) | BUS_PIPELINED);
            oe_ram_cs_delayed_registered[i16] <= oe_ram_cs_delayed_registered1[i16];
            oe_ram_cs_delayed[i16] <= oe_ram_cs_delayed_registered[i16];
          end
        end
      end
  endgenerate
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY == 0)
      delayed_byte_offset <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
    else if(HIGH_LATENCY == 1)
    begin
      delayed_byte_offset_registered <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
      delayed_byte_offset <= delayed_byte_offset_registered;
    end
    else
    begin
      delayed_byte_offset_registered1 <= byte_offset[nbits_byte_offset*max_n_reads-1:0];
      delayed_byte_offset_registered <= delayed_byte_offset_registered1;
      delayed_byte_offset <= delayed_byte_offset_registered;
    end
  end
  
  
  generate
  genvar i17;
    for (i17=0; i17<PORTSIZE_S_we_ram; i17=i17+1)
    begin : L17
      always @(posedge clock )
      begin
        if(reset == 1'b0)
          we_ram_cs_delayed[i17] <= 1'b0;
        else
          we_ram_cs_delayed[i17] <= we_ram_cs[i17] & !we_ram_cs_delayed[i17];
      end
    end
  endgenerate
  
  generate
  genvar i18;
    for (i18=0; i18<PORTSIZE_Sout_Rdata_ram; i18=i18+1)
    begin : L18
      if(PRIVATE_MEMORY==1)
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
      else if (BITSIZE_Sout_Rdata_ram <= memory_bitsize)
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = oe_ram_cs_delayed[i18] ? out1_shifted[BITSIZE_Sout_Rdata_ram+i18*memory_bitsize-1:i18*memory_bitsize] : Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
      else
        assign Sout_Rdata_ram[(i18+1)*BITSIZE_Sout_Rdata_ram-1:i18*BITSIZE_Sout_Rdata_ram] = oe_ram_cs_delayed[i18] ? {{BITSIZE_S_Wdata_ram-memory_bitsize{1'b0}}, out1_shifted[(i18+1)*memory_bitsize-1:i18*memory_bitsize]} : Sin_Rdata_ram[(i18+1)*BITSIZE_Sin_Rdata_ram-1:i18*BITSIZE_Sin_Rdata_ram];
    end
  endgenerate
  
  generate
  genvar i19;
    for (i19=0; i19<PORTSIZE_Sout_DataRdy; i19=i19+1)
    begin : L19
      if(PRIVATE_MEMORY==0)
        assign Sout_DataRdy[i19] = (i19 < PORTSIZE_S_oe_ram && oe_ram_cs_delayed[i19]) | Sin_DataRdy[i19] | (i19 < PORTSIZE_S_we_ram && we_ram_cs_delayed[i19]);
      else
        assign Sout_DataRdy[i19] = Sin_DataRdy[i19];
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<PORTSIZE_bram_write; i21=i21+1)
    begin : L21
      if(i21 < PORTSIZE_S_we_ram)
        assign bram_write[i21] = (sel_STORE[i21] || proxy_sel_STORE[i21] || we_ram_cs[i21]);
      else
        assign bram_write[i21] = (sel_STORE[i21] || proxy_sel_STORE[i21]);
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BRAM_MEMORY_CORE_SMALL(clock, bram_write0, bram_write1, memory_addr_a, memory_addr_b, din_value_aggregated, be, dout_a, dout_b);
  parameter BITSIZE_dout_a=1, BITSIZE_dout_b=1, BITSIZE_memory_addr_a=1, BITSIZE_memory_addr_b=1, BITSIZE_din_value_aggregated=1, BITSIZE_be=1, MEMORY_INIT_file="array.mem", BRAM_BITSIZE=32, n_byte_on_databus=4, n_mem_elements=4, n_bytes=4, HIGH_LATENCY=0;
  // IN
  input clock;
  input bram_write0;
  input bram_write1;
  input [BITSIZE_memory_addr_a-1:0] memory_addr_a;
  input [BITSIZE_memory_addr_b-1:0] memory_addr_b;
  input [BITSIZE_din_value_aggregated-1:0] din_value_aggregated;
  input [BITSIZE_be-1:0] be;
  // OUT
  output [BITSIZE_dout_a-1:0] dout_a;
  output [BITSIZE_dout_b-1:0] dout_b;
  
  reg bram_write01 =0;
  reg bram_write11 =0;
  reg [BITSIZE_memory_addr_a-1:0] memory_addr_a1 =0;
  reg [BITSIZE_memory_addr_b-1:0] memory_addr_b1 =0;
  reg [BITSIZE_be-1:0] be1 =0;
  reg [BITSIZE_din_value_aggregated-1:0] din_value_aggregated1 =0;
  reg [(n_byte_on_databus)*8-1:0] dout_a_tmp =0;
  reg [(n_byte_on_databus)*8-1:0] dout_b_tmp =0;
  reg [(n_byte_on_databus)*8-1:0] dout_a_registered =0;
  reg [(n_byte_on_databus)*8-1:0] dout_b_registered =0;
  reg [(n_byte_on_databus)*8-1:0] memory [n_mem_elements-1:0]/* synthesis syn_ramstyle = "no_rw_check" */ ;
  
  generate
    if(HIGH_LATENCY==2)
    begin
      always @ (posedge clock)
      begin
         memory_addr_a1 <= memory_addr_a;
         memory_addr_b1 <= memory_addr_b;
         bram_write01 <= bram_write0;
         bram_write11 <= bram_write1;
         be1 <= be;
         din_value_aggregated1 <= din_value_aggregated;
      end
    end
  endgenerate
  
  assign dout_a = dout_a_tmp;
  assign dout_b = dout_b_tmp;
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_mem_elements-1);
  end
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY == 0||HIGH_LATENCY == 1)
    begin
      if (bram_write0)
      begin : L11_write
        integer i11;
        for (i11=0; i11<n_byte_on_databus; i11=i11+1)
        begin
          if(be[i11])
            memory[memory_addr_a][i11*8+:8] <= din_value_aggregated[i11*8+:8];
        end
      end
    end
    else
    begin
      if (bram_write01)
      begin : L11_write1
        integer i11;
        for (i11=0; i11<n_byte_on_databus; i11=i11+1)
        begin
          if(be1[i11])
            memory[memory_addr_a1][i11*8+:8] <= din_value_aggregated1[i11*8+:8];
        end
      end
    end
    if(HIGH_LATENCY == 0)
      dout_a_tmp <= memory[memory_addr_a];
    else if(HIGH_LATENCY == 1)
    begin
      dout_a_registered <= memory[memory_addr_a];
      dout_a_tmp <= dout_a_registered;
    end
    else
    begin
      dout_a_registered <= memory[memory_addr_a1];
      dout_a_tmp <= dout_a_registered;
    end
    if(HIGH_LATENCY == 0||HIGH_LATENCY == 1)
    begin
      if (bram_write1)
      begin : L22_write
        integer i22;
        for (i22=0; i22<n_byte_on_databus; i22=i22+1)
        begin
          if(be[i22+n_byte_on_databus])
            memory[memory_addr_b][i22*8+:8] <= din_value_aggregated[(i22+n_byte_on_databus)*8+:8];
        end
      end
    end
    else
    begin
      if (bram_write11)
      begin : L22_write1
        integer i22;
        for (i22=0; i22<n_byte_on_databus; i22=i22+1)
        begin
          if(be1[i22+n_byte_on_databus])
            memory[memory_addr_b1][i22*8+:8] <= din_value_aggregated1[(i22+n_byte_on_databus)*8+:8];
        end
      end
    end
    if(HIGH_LATENCY == 0)
      dout_b_tmp <= memory[memory_addr_b];
    else if(HIGH_LATENCY == 1)
    begin
      dout_b_registered <= memory[memory_addr_b];
      dout_b_tmp <= dout_b_registered;
    end
    else
    begin
      dout_b_registered <= memory[memory_addr_b1];
      dout_b_tmp <= dout_b_registered;
    end
  end

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module TRUE_DUAL_PORT_BYTE_ENABLING_RAM(clock, bram_write0, bram_write1, memory_addr_a, memory_addr_b, din_value_aggregated, be, dout_a, dout_b);
  parameter BITSIZE_dout_a=1, BITSIZE_dout_b=1, BITSIZE_memory_addr_a=1, BITSIZE_memory_addr_b=1, BITSIZE_din_value_aggregated=1, BITSIZE_be=1, MEMORY_INIT_file="array.mem", BRAM_BITSIZE=32, n_byte_on_databus=4, n_mem_elements=4, HIGH_LATENCY=0;
  // IN
  input clock;
  input bram_write0;
  input bram_write1;
  input [BITSIZE_memory_addr_a-1:0] memory_addr_a;
  input [BITSIZE_memory_addr_b-1:0] memory_addr_b;
  input [BITSIZE_din_value_aggregated-1:0] din_value_aggregated;
  input [BITSIZE_be-1:0] be;
  // OUT
  output [BITSIZE_dout_a-1:0] dout_a;
  output [BITSIZE_dout_b-1:0] dout_b;
  
  wire [n_byte_on_databus-1:0] we_a;
  wire [n_byte_on_databus-1:0] we_b;
  reg [n_byte_on_databus-1:0] we_a1 =0;
  reg [n_byte_on_databus-1:0] we_b1 =0;
  reg [BITSIZE_din_value_aggregated-1:0] din_value_aggregated1 =0;
  
  reg [BITSIZE_dout_a-1:0] dout_a =0;
  reg [BITSIZE_dout_a-1:0] dout_a_registered =0;
  reg [BITSIZE_dout_b-1:0] dout_b =0;
  reg [BITSIZE_dout_b-1:0] dout_b_registered =0;
  reg [BITSIZE_memory_addr_a-1:0] memory_addr_a1 =0;
  reg [BITSIZE_memory_addr_b-1:0] memory_addr_b1 =0;
  reg [BRAM_BITSIZE-1:0] memory [0:n_mem_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file, memory, 0, n_mem_elements-1);
  end
  
  always @(posedge clock)
  begin
    if(HIGH_LATENCY==0)
    begin
      dout_a <= memory[memory_addr_a];
    end
    else if(HIGH_LATENCY==1)
    begin
      dout_a_registered <= memory[memory_addr_a];
      dout_a <= dout_a_registered;
    end
    else
    begin
      memory_addr_a1 <= memory_addr_a;
      we_a1 <= we_a;
      din_value_aggregated1 <= din_value_aggregated;
      dout_a_registered <= memory[memory_addr_a1];
      dout_a <= dout_a_registered;
    end
  end
  
  generate
  genvar i11;
    for (i11=0; i11<n_byte_on_databus; i11=i11+1)
    begin : L11_write_a
      always @(posedge clock)
      begin
        if(HIGH_LATENCY==0||HIGH_LATENCY==1)
        begin
          if(we_a[i11])
            memory[memory_addr_a][(i11+1)*8-1:i11*8] <= din_value_aggregated[(i11+1)*8-1:i11*8];
        end
        else
        begin
          if(we_a1[i11])
            memory[memory_addr_a1][(i11+1)*8-1:i11*8] <= din_value_aggregated1[(i11+1)*8-1:i11*8];
        end
      end
    end
  endgenerate
  
    always @(posedge clock)
    begin
      if(HIGH_LATENCY==0)
      begin
        dout_b <= memory[memory_addr_b];
      end
      else if(HIGH_LATENCY==1)
      begin
        dout_b_registered <= memory[memory_addr_b];
        dout_b <= dout_b_registered;
      end
      else
      begin
        memory_addr_b1 <= memory_addr_b;
        we_b1 <= we_b;
        dout_b_registered <= memory[memory_addr_b1];
        dout_b <= dout_b_registered;
      end
    end
    for (i11=0; i11<n_byte_on_databus; i11=i11+1)
    begin : L11_write_b
      always @(posedge clock)
      begin
        if(HIGH_LATENCY==0||HIGH_LATENCY==1)
        begin
          if(we_b[i11])
            memory[memory_addr_b][(i11+1)*8-1:i11*8] <= din_value_aggregated[(i11+1+n_byte_on_databus)*8-1:(i11+n_byte_on_databus)*8];
        end
        else
        begin
          if(we_b1[i11])
            memory[memory_addr_b1][(i11+1)*8-1:i11*8] <= din_value_aggregated1[(i11+1+n_byte_on_databus)*8-1:(i11+n_byte_on_databus)*8];
        end
      end
    end
  
  generate
  genvar i2_a;
    for (i2_a=0; i2_a<n_byte_on_databus; i2_a=i2_a+1)
    begin  : write_enable_a
      assign we_a[i2_a] = (bram_write0) && be[i2_a];
    end
  endgenerate
  
  generate
  genvar i2_b;
    for (i2_b=0; i2_b<n_byte_on_databus; i2_b=i2_b+1)
    begin  : write_enable_b
      assign we_b[i2_b] = (bram_write1) && be[i2_b+n_byte_on_databus];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BRAM_MEMORY_NN_CORE(clock, bram_write, memory_addr_a, din_value_aggregated_swapped, be_swapped, dout_a);
  parameter BITSIZE_bram_write=1, PORTSIZE_bram_write=2, BITSIZE_dout_a=1, PORTSIZE_dout_a=2, BITSIZE_memory_addr_a=1, PORTSIZE_memory_addr_a=2, BITSIZE_din_value_aggregated_swapped=1, PORTSIZE_din_value_aggregated_swapped=2, BITSIZE_be_swapped=1, PORTSIZE_be_swapped=2, MEMORY_INIT_file="array.mem", BRAM_BITSIZE=32, n_bytes=32, n_byte_on_databus=4, n_mem_elements=4, max_n_reads=2, max_n_writes=2, memory_offset=16, n_byte_on_databus_offset=2, HIGH_LATENCY=0;
  // IN
  input clock;
  input [PORTSIZE_bram_write-1:0] bram_write;
  input [(PORTSIZE_memory_addr_a*BITSIZE_memory_addr_a)+(-1):0] memory_addr_a;
  input [(PORTSIZE_din_value_aggregated_swapped*BITSIZE_din_value_aggregated_swapped)+(-1):0] din_value_aggregated_swapped;
  input [(PORTSIZE_be_swapped*BITSIZE_be_swapped)+(-1):0] be_swapped;
  // OUT
  output [(PORTSIZE_dout_a*BITSIZE_dout_a)+(-1):0] dout_a;
  
  generate
  if(n_mem_elements == 1)
  begin
    BRAM_MEMORY_CORE_SMALL #(.BITSIZE_memory_addr_a(BITSIZE_memory_addr_a), .BITSIZE_memory_addr_b(BITSIZE_memory_addr_a), .BITSIZE_din_value_aggregated((n_byte_on_databus)*8), .BITSIZE_be(n_byte_on_databus), .BITSIZE_dout_a((n_byte_on_databus/2)*8), .BITSIZE_dout_b((n_byte_on_databus/2)*8), .MEMORY_INIT_file(MEMORY_INIT_file), .BRAM_BITSIZE(BRAM_BITSIZE), .n_byte_on_databus(n_byte_on_databus/2), .n_mem_elements(n_mem_elements), .n_bytes(n_bytes), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_instance_small (.clock(clock), .bram_write0(bram_write[0]), .bram_write1(bram_write[1]), .memory_addr_a(memory_addr_a[BITSIZE_memory_addr_a-1:0]), .memory_addr_b(memory_addr_a[2*BITSIZE_memory_addr_a-1:BITSIZE_memory_addr_a]), .din_value_aggregated({din_value_aggregated_swapped[2*BRAM_BITSIZE+(n_byte_on_databus/2)*8+memory_offset-1:2*BRAM_BITSIZE+memory_offset],din_value_aggregated_swapped[(n_byte_on_databus/2)*8+memory_offset-1:memory_offset]}), .be({be_swapped[n_byte_on_databus+n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus+n_byte_on_databus_offset],be_swapped[n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus_offset]}), .dout_a(dout_a[BRAM_BITSIZE-1:0]), .dout_b(dout_a[2*BRAM_BITSIZE-1:BRAM_BITSIZE]));
  end
  else
  begin
    TRUE_DUAL_PORT_BYTE_ENABLING_RAM #(.BITSIZE_memory_addr_a(BITSIZE_memory_addr_a), .BITSIZE_memory_addr_b(BITSIZE_memory_addr_a), .BITSIZE_din_value_aggregated((n_byte_on_databus)*8), .BITSIZE_be(n_byte_on_databus), .BITSIZE_dout_a((n_byte_on_databus/2)*8), .BITSIZE_dout_b((n_byte_on_databus/2)*8), .MEMORY_INIT_file(MEMORY_INIT_file), .BRAM_BITSIZE(BRAM_BITSIZE), .n_byte_on_databus(n_byte_on_databus/2), .n_mem_elements(n_mem_elements), .HIGH_LATENCY(HIGH_LATENCY)) TRUE_DUAL_PORT_BYTE_ENABLING_RAM_instance (.clock(clock), .bram_write0(bram_write[0]), .bram_write1(bram_write[1]), .memory_addr_a(memory_addr_a[BITSIZE_memory_addr_a-1:0]), .memory_addr_b(memory_addr_a[2*BITSIZE_memory_addr_a-1:BITSIZE_memory_addr_a]), .din_value_aggregated({din_value_aggregated_swapped[2*BRAM_BITSIZE+(n_byte_on_databus/2)*8+memory_offset-1:2*BRAM_BITSIZE+memory_offset],din_value_aggregated_swapped[(n_byte_on_databus/2)*8+memory_offset-1:memory_offset]}), .be({be_swapped[n_byte_on_databus+n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus+n_byte_on_databus_offset],be_swapped[n_byte_on_databus/2+n_byte_on_databus_offset-1:n_byte_on_databus_offset]}), .dout_a(dout_a[BRAM_BITSIZE-1:0]), .dout_b(dout_a[2*BRAM_BITSIZE-1:BRAM_BITSIZE]));
  end
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_NN_SP(clock, reset, in1, in2, in3, out1, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, Sout_Rdata_ram, S_data_ram_size, Sin_DataRdy, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2, BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2, BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2, BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2, BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2, BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2, BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2, BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2, MEMORY_INIT_file_a="array_a.mem", MEMORY_INIT_file_b="array_b.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, USE_SPARSE_MEMORY=1, HIGH_LATENCY=0, BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2, BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2, BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2, BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2, BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2, BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
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
  parameter n_byte_data = data_size/8;
  parameter n_bytes = n_elements*n_byte_data;
  parameter memory_bitsize = 2*BRAM_BITSIZE;
  parameter n_byte_on_databus = memory_bitsize/8;
  parameter n_mem_elements = n_bytes/(n_byte_on_databus) + (n_bytes%(n_byte_on_databus) == 0 ? 0 : 1);
  `ifdef _SIM_HAVE_CLOG2
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : $clog2(n_mem_elements);
  `else
    parameter nbit_read_addr = n_mem_elements == 1 ? 1 : log2(n_mem_elements);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_S_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_S_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_S_oe_ram ? PORTSIZE_sel_LOAD : PORTSIZE_S_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_a;
  wire [nbit_read_addr*max_n_rw-1:0] memory_addr_b;
  wire [n_byte_on_databus*max_n_writes-1:0] be_swapped;
  
  wire [memory_bitsize*max_n_writes-1:0] din_value_aggregated_swapped;
  wire [(memory_bitsize/2)*max_n_reads-1:0] dout_a;
  wire [(memory_bitsize/2)*max_n_reads-1:0] dout_b;
  
  
  BRAM_MEMORY_NN_CORE #(.PORTSIZE_bram_write(max_n_writes), .BITSIZE_bram_write(1), .BITSIZE_dout_a(memory_bitsize/2), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .MEMORY_INIT_file(MEMORY_INIT_file_a), .BRAM_BITSIZE(BRAM_BITSIZE), .n_bytes(n_bytes), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .memory_offset(0), .n_byte_on_databus_offset(0), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_NN_instance_a(.clock(clock), .bram_write(bram_write), .memory_addr_a(memory_addr_a), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .dout_a(dout_a));
  
  generate
    if (n_bytes > BRAM_BITSIZE/8)
    begin : SECOND_MEMORY
      BRAM_MEMORY_NN_CORE #(.PORTSIZE_bram_write(max_n_writes), .BITSIZE_bram_write(1), .BITSIZE_dout_a((memory_bitsize/2)), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .MEMORY_INIT_file(MEMORY_INIT_file_b), .BRAM_BITSIZE(BRAM_BITSIZE), .n_bytes(n_bytes), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .memory_offset(memory_bitsize/2), .n_byte_on_databus_offset(n_byte_on_databus/2), .HIGH_LATENCY(HIGH_LATENCY)) BRAM_MEMORY_NN_instance_b(.clock(clock), .bram_write(bram_write), .memory_addr_a(memory_addr_b), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .dout_a(dout_b));
    end
  else
    assign dout_b = {(memory_bitsize/2)*max_n_reads{1'b0}};
  endgenerate
  
  ADDRESS_DECODING_LOGIC_NN #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .HIGH_LATENCY(HIGH_LATENCY), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1), .BITSIZE_dout_a(memory_bitsize/2), .PORTSIZE_dout_a(max_n_reads), .BITSIZE_dout_b(memory_bitsize/2), .PORTSIZE_dout_b(max_n_reads), .BITSIZE_memory_addr_a(nbit_read_addr), .PORTSIZE_memory_addr_a(max_n_rw), .BITSIZE_memory_addr_b(nbit_read_addr), .PORTSIZE_memory_addr_b(max_n_rw), .BITSIZE_din_value_aggregated_swapped(memory_bitsize), .PORTSIZE_din_value_aggregated_swapped(max_n_writes), .BITSIZE_be_swapped(n_byte_on_databus), .PORTSIZE_be_swapped(max_n_writes), .BITSIZE_bram_write(1), .PORTSIZE_bram_write(max_n_writes), .nbit_read_addr(nbit_read_addr), .n_byte_on_databus(n_byte_on_databus), .n_mem_elements(n_mem_elements), .max_n_reads(max_n_reads), .max_n_writes(max_n_writes), .max_n_rw(max_n_rw)) ADDRESS_DECODING_LOGIC_NN_instance (.clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .out1(out1), .sel_LOAD(sel_LOAD), .sel_STORE(sel_STORE), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .Sout_Rdata_ram(Sout_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .Sout_DataRdy(Sout_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE), .proxy_out1(proxy_out1), .dout_a(dout_a), .dout_b(dout_b), .memory_addr_a(memory_addr_a), .memory_addr_b(memory_addr_b), .din_value_aggregated_swapped(din_value_aggregated_swapped), .be_swapped(be_swapped), .bram_write(bram_write));
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2020 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_BRAM_NN(clock, reset, in1, in2, in3, in4, out1, sel_LOAD, sel_STORE, S_oe_ram, S_we_ram, S_addr_ram, S_Wdata_ram, Sin_Rdata_ram, Sout_Rdata_ram, S_data_ram_size, Sin_DataRdy, Sout_DataRdy, proxy_in1, proxy_in2, proxy_in3, proxy_sel_LOAD, proxy_sel_STORE, proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2, BITSIZE_in2=1, PORTSIZE_in2=2, BITSIZE_in3=1, PORTSIZE_in3=2, BITSIZE_in4=1, PORTSIZE_in4=2, BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2, BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2, BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2, BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2, BITSIZE_out1=1, PORTSIZE_out1=2, BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2, BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2, BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2, BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2, BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2, BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2, BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2, MEMORY_INIT_file_a="array_a.mem", MEMORY_INIT_file_b="array_b.mem", n_elements=1, data_size=32, address_space_begin=0, address_space_rangesize=4, BUS_PIPELINED=1, BRAM_BITSIZE=32, PRIVATE_MEMORY=0, USE_SPARSE_MEMORY=1, BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2, BITSIZE_proxy_in2=1, PORTSIZE_proxy_in2=2, BITSIZE_proxy_in3=1, PORTSIZE_proxy_in3=2, BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2, BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2, BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1):0] proxy_in2;
  input [(PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1):0] proxy_in3;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  ARRAY_1D_STD_BRAM_NN_SP #(.BITSIZE_in1(BITSIZE_in1), .PORTSIZE_in1(PORTSIZE_in1), .BITSIZE_in2(BITSIZE_in2), .PORTSIZE_in2(PORTSIZE_in2), .BITSIZE_in3(BITSIZE_in3), .PORTSIZE_in3(PORTSIZE_in3), .BITSIZE_sel_LOAD(BITSIZE_sel_LOAD), .PORTSIZE_sel_LOAD(PORTSIZE_sel_LOAD), .BITSIZE_sel_STORE(BITSIZE_sel_STORE), .PORTSIZE_sel_STORE(PORTSIZE_sel_STORE), .BITSIZE_S_oe_ram(BITSIZE_S_oe_ram), .PORTSIZE_S_oe_ram(PORTSIZE_S_oe_ram), .BITSIZE_S_we_ram(BITSIZE_S_we_ram), .PORTSIZE_S_we_ram(PORTSIZE_S_we_ram), .BITSIZE_out1(BITSIZE_out1), .PORTSIZE_out1(PORTSIZE_out1), .BITSIZE_S_addr_ram(BITSIZE_S_addr_ram), .PORTSIZE_S_addr_ram(PORTSIZE_S_addr_ram), .BITSIZE_S_Wdata_ram(BITSIZE_S_Wdata_ram), .PORTSIZE_S_Wdata_ram(PORTSIZE_S_Wdata_ram), .BITSIZE_Sin_Rdata_ram(BITSIZE_Sin_Rdata_ram), .PORTSIZE_Sin_Rdata_ram(PORTSIZE_Sin_Rdata_ram), .BITSIZE_Sout_Rdata_ram(BITSIZE_Sout_Rdata_ram), .PORTSIZE_Sout_Rdata_ram(PORTSIZE_Sout_Rdata_ram), .BITSIZE_S_data_ram_size(BITSIZE_S_data_ram_size), .PORTSIZE_S_data_ram_size(PORTSIZE_S_data_ram_size), .BITSIZE_Sin_DataRdy(BITSIZE_Sin_DataRdy), .PORTSIZE_Sin_DataRdy(PORTSIZE_Sin_DataRdy), .BITSIZE_Sout_DataRdy(BITSIZE_Sout_DataRdy), .PORTSIZE_Sout_DataRdy(PORTSIZE_Sout_DataRdy), .MEMORY_INIT_file_a(MEMORY_INIT_file_a), .MEMORY_INIT_file_b(MEMORY_INIT_file_b), .n_elements(n_elements), .data_size(data_size), .address_space_begin(address_space_begin), .address_space_rangesize(address_space_rangesize), .BUS_PIPELINED(BUS_PIPELINED), .BRAM_BITSIZE(BRAM_BITSIZE), .PRIVATE_MEMORY(PRIVATE_MEMORY), .USE_SPARSE_MEMORY(USE_SPARSE_MEMORY), .BITSIZE_proxy_in1(BITSIZE_proxy_in1), .PORTSIZE_proxy_in1(PORTSIZE_proxy_in1), .BITSIZE_proxy_in2(BITSIZE_proxy_in2), .PORTSIZE_proxy_in2(PORTSIZE_proxy_in2), .BITSIZE_proxy_in3(BITSIZE_proxy_in3), .PORTSIZE_proxy_in3(PORTSIZE_proxy_in3), .BITSIZE_proxy_sel_LOAD(BITSIZE_proxy_sel_LOAD), .PORTSIZE_proxy_sel_LOAD(PORTSIZE_proxy_sel_LOAD), .BITSIZE_proxy_sel_STORE(BITSIZE_proxy_sel_STORE), .PORTSIZE_proxy_sel_STORE(PORTSIZE_proxy_sel_STORE), .BITSIZE_proxy_out1(BITSIZE_proxy_out1), .PORTSIZE_proxy_out1(PORTSIZE_proxy_out1), .HIGH_LATENCY(0)) ARRAY_1D_STD_BRAM_NN_instance (.out1(out1), .Sout_Rdata_ram(Sout_Rdata_ram), .Sout_DataRdy(Sout_DataRdy), .proxy_out1(proxy_out1), .clock(clock), .reset(reset), .in1(in1), .in2(in2), .in3(in3), .sel_LOAD(sel_LOAD & in4), .sel_STORE(sel_STORE & in4), .S_oe_ram(S_oe_ram), .S_we_ram(S_we_ram), .S_addr_ram(S_addr_ram), .S_Wdata_ram(S_Wdata_ram), .Sin_Rdata_ram(Sin_Rdata_ram), .S_data_ram_size(S_data_ram_size), .Sin_DataRdy(Sin_DataRdy), .proxy_in1(proxy_in1), .proxy_in2(proxy_in2), .proxy_in3(proxy_in3), .proxy_sel_LOAD(proxy_sel_LOAD), .proxy_sel_STORE(proxy_sel_STORE));
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

// Datapath RTL description for aluDecode
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_aluDecode(clock, reset, in_port_opcode, in_port_funct3, in_port_funct7, return_port, fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE, fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE, selector_MUX_9_gimple_return_FU_5_i0_0_0_0, selector_MUX_9_gimple_return_FU_5_i0_0_0_1, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, OUT_MULTIIF_aluDecode_419512_421844);
  parameter MEM_var_419652_419512=4096, MEM_var_419678_419512=4096;
  // IN
  input clock;
  input reset;
  input [31:0] in_port_opcode;
  input [31:0] in_port_funct3;
  input [31:0] in_port_funct7;
  input fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  input fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE;
  input selector_MUX_9_gimple_return_FU_5_i0_0_0_0;
  input selector_MUX_9_gimple_return_FU_5_i0_0_0_1;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_2;
  // OUT
  output [31:0] return_port;
  output [1:0] OUT_MULTIIF_aluDecode_419512_421844;
  // Component and signal declarations
  wire null_out_signal_array_419652_0_Sout_DataRdy_0;
  wire null_out_signal_array_419652_0_Sout_DataRdy_1;
  wire [31:0] null_out_signal_array_419652_0_Sout_Rdata_ram_0;
  wire [31:0] null_out_signal_array_419652_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_419652_0_out1_1;
  wire [31:0] null_out_signal_array_419652_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_419652_0_proxy_out1_1;
  wire null_out_signal_array_419678_0_Sout_DataRdy_0;
  wire null_out_signal_array_419678_0_Sout_DataRdy_1;
  wire [31:0] null_out_signal_array_419678_0_Sout_Rdata_ram_0;
  wire [31:0] null_out_signal_array_419678_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_419678_0_out1_1;
  wire [31:0] null_out_signal_array_419678_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_419678_0_proxy_out1_1;
  wire [31:0] out_ARRAY_1D_STD_BRAM_NN_0_i0_array_419652_0;
  wire [31:0] out_ARRAY_1D_STD_BRAM_NN_1_i0_array_419678_0;
  wire [31:0] out_MUX_9_gimple_return_FU_5_i0_0_0_0;
  wire [31:0] out_MUX_9_gimple_return_FU_5_i0_0_0_1;
  wire [13:0] out_addr_expr_FU_22_i0_fu_aluDecode_419512_421691;
  wire [13:0] out_addr_expr_FU_28_i0_fu_aluDecode_419512_421684;
  wire out_const_0;
  wire [6:0] out_const_1;
  wire [18:0] out_const_10;
  wire [20:0] out_const_11;
  wire [22:0] out_const_12;
  wire [28:0] out_const_13;
  wire [29:0] out_const_14;
  wire [54:0] out_const_15;
  wire [4:0] out_const_16;
  wire [4:0] out_const_17;
  wire [4:0] out_const_18;
  wire [2:0] out_const_19;
  wire out_const_2;
  wire [1:0] out_const_20;
  wire [2:0] out_const_21;
  wire [3:0] out_const_22;
  wire [2:0] out_const_23;
  wire [3:0] out_const_24;
  wire [3:0] out_const_25;
  wire [4:0] out_const_26;
  wire [12:0] out_const_27;
  wire [12:0] out_const_28;
  wire [1:0] out_const_3;
  wire [2:0] out_const_4;
  wire [3:0] out_const_5;
  wire [4:0] out_const_6;
  wire [5:0] out_const_7;
  wire [7:0] out_const_8;
  wire [16:0] out_const_9;
  wire [2:0] out_conv_in_port_funct3_32_3;
  wire [6:0] out_conv_in_port_opcode_32_7;
  wire [5:0] out_conv_out_const_1_7_6;
  wire [31:0] out_conv_out_const_27_13_32;
  wire [31:0] out_conv_out_const_28_13_32;
  wire [31:0] out_conv_out_reg_1_reg_1_5_32;
  wire out_lut_expr_FU_13_i0_fu_aluDecode_419512_421575;
  wire out_lut_expr_FU_14_i0_fu_aluDecode_419512_421915;
  wire out_lut_expr_FU_15_i0_fu_aluDecode_419512_421578;
  wire out_lut_expr_FU_16_i0_fu_aluDecode_419512_421581;
  wire out_lut_expr_FU_17_i0_fu_aluDecode_419512_421584;
  wire out_lut_expr_FU_18_i0_fu_aluDecode_419512_421587;
  wire out_lut_expr_FU_19_i0_fu_aluDecode_419512_421590;
  wire out_lut_expr_FU_20_i0_fu_aluDecode_419512_421593;
  wire out_lut_expr_FU_21_i0_fu_aluDecode_419512_421596;
  wire out_lut_expr_FU_26_i0_fu_aluDecode_419512_421677;
  wire out_lut_expr_FU_27_i0_fu_aluDecode_419512_421680;
  wire out_lut_expr_FU_29_i0_fu_aluDecode_419512_421847;
  wire out_lut_expr_FU_30_i0_fu_aluDecode_419512_421850;
  wire out_lut_expr_FU_31_i0_fu_aluDecode_419512_422074;
  wire out_lut_expr_FU_32_i0_fu_aluDecode_419512_421862;
  wire out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884;
  wire [1:0] out_multi_read_cond_FU_33_i0_fu_aluDecode_419512_421844;
  wire [12:0] out_reg_0_reg_0;
  wire [4:0] out_reg_1_reg_1;
  wire [12:0] out_reg_2_reg_2;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i0_fu_aluDecode_419512_419592;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i10_fu_aluDecode_419512_421863;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i11_fu_aluDecode_419512_421867;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i1_fu_aluDecode_419512_419594;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i2_fu_aluDecode_419512_421820;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i3_fu_aluDecode_419512_421823;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i4_fu_aluDecode_419512_421826;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i5_fu_aluDecode_419512_421829;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i6_fu_aluDecode_419512_421832;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i7_fu_aluDecode_419512_421835;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i8_fu_aluDecode_419512_421838;
  wire [4:0] out_ui_cond_expr_FU_8_8_8_8_34_i9_fu_aluDecode_419512_421841;
  wire out_ui_eq_expr_FU_32_0_32_35_i0_fu_aluDecode_419512_421562;
  wire out_ui_eq_expr_FU_32_0_32_36_i0_fu_aluDecode_419512_421565;
  wire out_ui_eq_expr_FU_32_0_32_37_i0_fu_aluDecode_419512_421568;
  wire out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893;
  wire out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897;
  wire out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901;
  wire out_ui_extract_bit_expr_FU_23_i0_fu_aluDecode_419512_422015;
  wire out_ui_extract_bit_expr_FU_24_i0_fu_aluDecode_419512_422018;
  wire out_ui_extract_bit_expr_FU_25_i0_fu_aluDecode_419512_422021;
  wire out_ui_extract_bit_expr_FU_4_i0_fu_aluDecode_419512_421874;
  wire out_ui_extract_bit_expr_FU_6_i0_fu_aluDecode_419512_421877;
  wire out_ui_extract_bit_expr_FU_7_i0_fu_aluDecode_419512_421881;
  wire out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889;
  wire [4:0] out_ui_lshift_expr_FU_8_0_8_38_i0_fu_aluDecode_419512_421693;
  wire [12:0] out_ui_pointer_plus_expr_FU_16_16_16_39_i0_fu_aluDecode_419512_419646;
  wire [12:0] out_ui_pointer_plus_expr_FU_16_16_16_39_i1_fu_aluDecode_419512_419673;
  
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_9_gimple_return_FU_5_i0_0_0_0 (.out1(out_MUX_9_gimple_return_FU_5_i0_0_0_0), .sel(selector_MUX_9_gimple_return_FU_5_i0_0_0_0), .in1(out_conv_out_reg_1_reg_1_5_32), .in2(out_ARRAY_1D_STD_BRAM_NN_0_i0_array_419652_0));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_9_gimple_return_FU_5_i0_0_0_1 (.out1(out_MUX_9_gimple_return_FU_5_i0_0_0_1), .sel(selector_MUX_9_gimple_return_FU_5_i0_0_0_1), .in1(out_ARRAY_1D_STD_BRAM_NN_1_i0_array_419678_0), .in2(out_MUX_9_gimple_return_FU_5_i0_0_0_0));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(32), .PORTSIZE_in1(2), .BITSIZE_in2(13), .PORTSIZE_in2(2), .BITSIZE_in3(6), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(32), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(13), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(32), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(32), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(32), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(6), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file_a("array_ref_419652.mem"), .MEMORY_INIT_file_b("0_array_ref_419652.mem"), .n_elements(8), .data_size(32), .address_space_begin(MEM_var_419652_419512), .address_space_rangesize(4096), .BUS_PIPELINED(1), .BRAM_BITSIZE(32), .PRIVATE_MEMORY(1), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(32), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(13), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(6), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(32), .PORTSIZE_proxy_out1(2)) array_419652_0 (.out1({null_out_signal_array_419652_0_out1_1, out_ARRAY_1D_STD_BRAM_NN_0_i0_array_419652_0}), .Sout_Rdata_ram({null_out_signal_array_419652_0_Sout_Rdata_ram_1, null_out_signal_array_419652_0_Sout_Rdata_ram_0}), .Sout_DataRdy({null_out_signal_array_419652_0_Sout_DataRdy_1, null_out_signal_array_419652_0_Sout_DataRdy_0}), .proxy_out1({null_out_signal_array_419652_0_proxy_out1_1, null_out_signal_array_419652_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .in2({13'b0000000000000, out_reg_0_reg_0}), .in3({6'b000000, out_conv_out_const_1_7_6}), .in4({1'b0, out_const_2}), .sel_LOAD({1'b0, fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD}), .sel_STORE({1'b0, fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE}), .S_oe_ram({1'b0, 1'b0}), .S_we_ram({1'b0, 1'b0}), .S_addr_ram({13'b0000000000000, 13'b0000000000000}), .S_Wdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .Sin_Rdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .S_data_ram_size({6'b000000, 6'b000000}), .Sin_DataRdy({1'b0, 1'b0}), .proxy_in1({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in2({13'b0000000000000, 13'b0000000000000}), .proxy_in3({6'b000000, 6'b000000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  ARRAY_1D_STD_BRAM_NN #(.BITSIZE_in1(32), .PORTSIZE_in1(2), .BITSIZE_in2(13), .PORTSIZE_in2(2), .BITSIZE_in3(6), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(32), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(13), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(32), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(32), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(32), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(6), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file_a("array_ref_419678.mem"), .MEMORY_INIT_file_b("0_array_ref_419678.mem"), .n_elements(8), .data_size(32), .address_space_begin(MEM_var_419678_419512), .address_space_rangesize(4096), .BUS_PIPELINED(1), .BRAM_BITSIZE(32), .PRIVATE_MEMORY(1), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(32), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(13), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(6), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(32), .PORTSIZE_proxy_out1(2)) array_419678_0 (.out1({null_out_signal_array_419678_0_out1_1, out_ARRAY_1D_STD_BRAM_NN_1_i0_array_419678_0}), .Sout_Rdata_ram({null_out_signal_array_419678_0_Sout_Rdata_ram_1, null_out_signal_array_419678_0_Sout_Rdata_ram_0}), .Sout_DataRdy({null_out_signal_array_419678_0_Sout_DataRdy_1, null_out_signal_array_419678_0_Sout_DataRdy_0}), .proxy_out1({null_out_signal_array_419678_0_proxy_out1_1, null_out_signal_array_419678_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .in2({13'b0000000000000, out_reg_2_reg_2}), .in3({6'b000000, out_conv_out_const_1_7_6}), .in4({1'b0, out_const_2}), .sel_LOAD({1'b0, fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD}), .sel_STORE({1'b0, fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE}), .S_oe_ram({1'b0, 1'b0}), .S_we_ram({1'b0, 1'b0}), .S_addr_ram({13'b0000000000000, 13'b0000000000000}), .S_Wdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .Sin_Rdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .S_data_ram_size({6'b000000, 6'b000000}), .Sin_DataRdy({1'b0, 1'b0}), .proxy_in1({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in2({13'b0000000000000, 13'b0000000000000}), .proxy_in3({6'b000000, 6'b000000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  constant_value #(.BITSIZE_out1(1), .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(7), .value(7'b0100000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(19), .value(19'b1000000000000000000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(21), .value(21'b100000000000000000000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(23), .value(23'b10000000000000000000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(29), .value(29'b10000000000000000000000000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(30), .value(30'b100000000000000000000000000000)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(55), .value(55'b1000000000000000000000000000000000000000000000000000000)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(5), .value(5'b10001)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(5), .value(5'b10010)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(5), .value(5'b10011)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(3), .value(3'b101)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(1), .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(2), .value(2'b11)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(3), .value(3'b110)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(4), .value(4'b1101)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(3), .value(3'b111)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(4), .value(4'b1110)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(4), .value(4'b1111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(5), .value(5'b11111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(13), .value(MEM_var_419652_419512)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(13), .value(MEM_var_419678_419512)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(2), .value(2'b10)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(3), .value(3'b100)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(4), .value(4'b1000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(5), .value(5'b10000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6), .value(6'b100000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(8), .value(8'b10000000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(17), .value(17'b10000000000000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(3)) conv_in_port_funct3_32_3 (.out1(out_conv_in_port_funct3_32_3), .in1(in_port_funct3));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(7)) conv_in_port_opcode_32_7 (.out1(out_conv_in_port_opcode_32_7), .in1(in_port_opcode));
  UUdata_converter_FU #(.BITSIZE_in1(7), .BITSIZE_out1(6)) conv_out_const_1_7_6 (.out1(out_conv_out_const_1_7_6), .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(13), .BITSIZE_out1(32)) conv_out_const_27_13_32 (.out1(out_conv_out_const_27_13_32), .in1(out_const_27));
  UUdata_converter_FU #(.BITSIZE_in1(13), .BITSIZE_out1(32)) conv_out_const_28_13_32 (.out1(out_conv_out_const_28_13_32), .in1(out_const_28));
  UUdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(32)) conv_out_reg_1_reg_1_5_32 (.out1(out_conv_out_reg_1_reg_1_5_32), .in1(out_reg_1_reg_1));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(3), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_419592 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i0_fu_aluDecode_419512_419592), .in1(out_lut_expr_FU_26_i0_fu_aluDecode_419512_421677), .in2(out_const_23), .in3(out_const_26));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_419594 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i1_fu_aluDecode_419512_419594), .in1(out_lut_expr_FU_27_i0_fu_aluDecode_419512_421680), .in2(out_const_2), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i0_fu_aluDecode_419512_419592));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(14), .BITSIZE_in2(5), .BITSIZE_out1(13), .LSB_PARAMETER(0)) fu_aluDecode_419512_419646 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_39_i0_fu_aluDecode_419512_419646), .in1(out_addr_expr_FU_28_i0_fu_aluDecode_419512_421684), .in2(out_ui_lshift_expr_FU_8_0_8_38_i0_fu_aluDecode_419512_421693));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(14), .BITSIZE_in2(5), .BITSIZE_out1(13), .LSB_PARAMETER(0)) fu_aluDecode_419512_419673 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_39_i1_fu_aluDecode_419512_419673), .in1(out_addr_expr_FU_22_i0_fu_aluDecode_419512_421691), .in2(out_ui_lshift_expr_FU_8_0_8_38_i0_fu_aluDecode_419512_421693));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_aluDecode_419512_421562 (.out1(out_ui_eq_expr_FU_32_0_32_35_i0_fu_aluDecode_419512_421562), .in1(in_port_funct7), .in2(out_const_0));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(6), .BITSIZE_out1(1)) fu_aluDecode_419512_421565 (.out1(out_ui_eq_expr_FU_32_0_32_36_i0_fu_aluDecode_419512_421565), .in1(in_port_funct7), .in2(out_const_7));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_aluDecode_419512_421568 (.out1(out_ui_eq_expr_FU_32_0_32_37_i0_fu_aluDecode_419512_421568), .in1(in_port_funct7), .in2(out_const_2));
  lut_expr_FU #(.BITSIZE_in1(19), .BITSIZE_out1(1)) fu_aluDecode_419512_421575 (.out1(out_lut_expr_FU_13_i0_fu_aluDecode_419512_421575), .in1(out_const_10), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(23), .BITSIZE_out1(1)) fu_aluDecode_419512_421578 (.out1(out_lut_expr_FU_15_i0_fu_aluDecode_419512_421578), .in1(out_const_12), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_14_i0_fu_aluDecode_419512_421915), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(19), .BITSIZE_out1(1)) fu_aluDecode_419512_421581 (.out1(out_lut_expr_FU_16_i0_fu_aluDecode_419512_421581), .in1(out_const_10), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_14_i0_fu_aluDecode_419512_421915), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17), .BITSIZE_out1(1)) fu_aluDecode_419512_421584 (.out1(out_lut_expr_FU_17_i0_fu_aluDecode_419512_421584), .in1(out_const_9), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(21), .BITSIZE_out1(1)) fu_aluDecode_419512_421587 (.out1(out_lut_expr_FU_18_i0_fu_aluDecode_419512_421587), .in1(out_const_11), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(30), .BITSIZE_out1(1)) fu_aluDecode_419512_421590 (.out1(out_lut_expr_FU_19_i0_fu_aluDecode_419512_421590), .in1(out_const_14), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_14_i0_fu_aluDecode_419512_421915), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29), .BITSIZE_out1(1)) fu_aluDecode_419512_421593 (.out1(out_lut_expr_FU_20_i0_fu_aluDecode_419512_421593), .in1(out_const_13), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_14_i0_fu_aluDecode_419512_421915), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(29), .BITSIZE_out1(1)) fu_aluDecode_419512_421596 (.out1(out_lut_expr_FU_21_i0_fu_aluDecode_419512_421596), .in1(out_const_13), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(6), .BITSIZE_out1(1)) fu_aluDecode_419512_421677 (.out1(out_lut_expr_FU_26_i0_fu_aluDecode_419512_421677), .in1(out_const_7), .in2(out_ui_extract_bit_expr_FU_23_i0_fu_aluDecode_419512_422015), .in3(out_ui_extract_bit_expr_FU_24_i0_fu_aluDecode_419512_422018), .in4(out_ui_extract_bit_expr_FU_25_i0_fu_aluDecode_419512_422021), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_aluDecode_419512_421680 (.out1(out_lut_expr_FU_27_i0_fu_aluDecode_419512_421680), .in1(out_const_2), .in2(out_ui_extract_bit_expr_FU_23_i0_fu_aluDecode_419512_422015), .in3(out_ui_extract_bit_expr_FU_24_i0_fu_aluDecode_419512_422018), .in4(out_ui_extract_bit_expr_FU_25_i0_fu_aluDecode_419512_422021), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(14)) fu_aluDecode_419512_421684 (.out1(out_addr_expr_FU_28_i0_fu_aluDecode_419512_421684), .in1(out_conv_out_const_27_13_32));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(14)) fu_aluDecode_419512_421691 (.out1(out_addr_expr_FU_22_i0_fu_aluDecode_419512_421691), .in1(out_conv_out_const_28_13_32));
  ui_lshift_expr_FU #(.BITSIZE_in1(3), .BITSIZE_in2(2), .BITSIZE_out1(5), .PRECISION(32)) fu_aluDecode_419512_421693 (.out1(out_ui_lshift_expr_FU_8_0_8_38_i0_fu_aluDecode_419512_421693), .in1(out_conv_in_port_funct3_32_3), .in2(out_const_3));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(4), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421820 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i2_fu_aluDecode_419512_421820), .in1(out_lut_expr_FU_13_i0_fu_aluDecode_419512_421575), .in2(out_const_24), .in3(out_const_26));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(4), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421823 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i3_fu_aluDecode_419512_421823), .in1(out_lut_expr_FU_15_i0_fu_aluDecode_419512_421578), .in2(out_const_24), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i2_fu_aluDecode_419512_421820));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(4), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421826 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i4_fu_aluDecode_419512_421826), .in1(out_lut_expr_FU_16_i0_fu_aluDecode_419512_421581), .in2(out_const_25), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i3_fu_aluDecode_419512_421823));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(5), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421829 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i5_fu_aluDecode_419512_421829), .in1(out_lut_expr_FU_17_i0_fu_aluDecode_419512_421584), .in2(out_const_6), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i4_fu_aluDecode_419512_421826));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(5), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421832 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i6_fu_aluDecode_419512_421832), .in1(out_lut_expr_FU_18_i0_fu_aluDecode_419512_421587), .in2(out_const_16), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i5_fu_aluDecode_419512_421829));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(5), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421835 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i7_fu_aluDecode_419512_421835), .in1(out_lut_expr_FU_19_i0_fu_aluDecode_419512_421590), .in2(out_const_17), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i6_fu_aluDecode_419512_421832));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(5), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421838 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i8_fu_aluDecode_419512_421838), .in1(out_lut_expr_FU_20_i0_fu_aluDecode_419512_421593), .in2(out_const_18), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i7_fu_aluDecode_419512_421835));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(4), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421841 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i9_fu_aluDecode_419512_421841), .in1(out_ui_eq_expr_FU_32_0_32_37_i0_fu_aluDecode_419512_421568), .in2(out_const_22), .in3(out_const_26));
  multi_read_cond_FU #(.BITSIZE_in1(1), .PORTSIZE_in1(2), .BITSIZE_out1(2)) fu_aluDecode_419512_421844 (.out1(out_multi_read_cond_FU_33_i0_fu_aluDecode_419512_421844), .in1({out_lut_expr_FU_30_i0_fu_aluDecode_419512_421850, out_lut_expr_FU_21_i0_fu_aluDecode_419512_421596}));
  lut_expr_FU #(.BITSIZE_in1(55), .BITSIZE_out1(1)) fu_aluDecode_419512_421847 (.out1(out_lut_expr_FU_29_i0_fu_aluDecode_419512_421847), .in1(out_const_15), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_ui_eq_expr_FU_32_0_32_36_i0_fu_aluDecode_419512_421565), .in7(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(55), .BITSIZE_out1(1)) fu_aluDecode_419512_421850 (.out1(out_lut_expr_FU_30_i0_fu_aluDecode_419512_421850), .in1(out_const_15), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_ui_eq_expr_FU_32_0_32_35_i0_fu_aluDecode_419512_421562), .in7(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5), .BITSIZE_out1(1)) fu_aluDecode_419512_421862 (.out1(out_lut_expr_FU_32_i0_fu_aluDecode_419512_421862), .in1(out_const_6), .in2(out_ui_eq_expr_FU_32_0_32_36_i0_fu_aluDecode_419512_421565), .in3(out_ui_eq_expr_FU_32_0_32_35_i0_fu_aluDecode_419512_421562), .in4(out_lut_expr_FU_31_i0_fu_aluDecode_419512_422074), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(5), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421863 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i10_fu_aluDecode_419512_421863), .in1(out_lut_expr_FU_29_i0_fu_aluDecode_419512_421847), .in2(out_ui_cond_expr_FU_8_8_8_8_34_i1_fu_aluDecode_419512_419594), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i8_fu_aluDecode_419512_421838));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(5), .BITSIZE_in3(5), .BITSIZE_out1(5)) fu_aluDecode_419512_421867 (.out1(out_ui_cond_expr_FU_8_8_8_8_34_i11_fu_aluDecode_419512_421867), .in1(out_lut_expr_FU_32_i0_fu_aluDecode_419512_421862), .in2(out_ui_cond_expr_FU_8_8_8_8_34_i9_fu_aluDecode_419512_421841), .in3(out_ui_cond_expr_FU_8_8_8_8_34_i10_fu_aluDecode_419512_421863));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(7), .BITSIZE_in2(1)) fu_aluDecode_419512_421874 (.out1(out_ui_extract_bit_expr_FU_4_i0_fu_aluDecode_419512_421874), .in1(out_conv_in_port_opcode_32_7), .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(7), .BITSIZE_in2(1)) fu_aluDecode_419512_421877 (.out1(out_ui_extract_bit_expr_FU_6_i0_fu_aluDecode_419512_421877), .in1(out_conv_in_port_opcode_32_7), .in2(out_const_2));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(7), .BITSIZE_in2(2)) fu_aluDecode_419512_421881 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu_aluDecode_419512_421881), .in1(out_conv_in_port_opcode_32_7), .in2(out_const_3));
  lut_expr_FU #(.BITSIZE_in1(4), .BITSIZE_out1(1)) fu_aluDecode_419512_421884 (.out1(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in1(out_const_5), .in2(out_ui_extract_bit_expr_FU_4_i0_fu_aluDecode_419512_421874), .in3(out_ui_extract_bit_expr_FU_6_i0_fu_aluDecode_419512_421877), .in4(out_ui_extract_bit_expr_FU_7_i0_fu_aluDecode_419512_421881), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(7), .BITSIZE_in2(2)) fu_aluDecode_419512_421889 (.out1(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in1(out_conv_in_port_opcode_32_7), .in2(out_const_20));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(7), .BITSIZE_in2(3)) fu_aluDecode_419512_421893 (.out1(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in1(out_conv_in_port_opcode_32_7), .in2(out_const_4));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(7), .BITSIZE_in2(3)) fu_aluDecode_419512_421897 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in1(out_conv_in_port_opcode_32_7), .in2(out_const_19));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(7), .BITSIZE_in2(3)) fu_aluDecode_419512_421901 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in1(out_conv_in_port_opcode_32_7), .in2(out_const_21));
  lut_expr_FU #(.BITSIZE_in1(8), .BITSIZE_out1(1)) fu_aluDecode_419512_421915 (.out1(out_lut_expr_FU_14_i0_fu_aluDecode_419512_421915), .in1(out_const_8), .in2(out_ui_extract_bit_expr_FU_4_i0_fu_aluDecode_419512_421874), .in3(out_ui_extract_bit_expr_FU_6_i0_fu_aluDecode_419512_421877), .in4(out_ui_extract_bit_expr_FU_7_i0_fu_aluDecode_419512_421881), .in5(1'b0), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(3), .BITSIZE_in2(1)) fu_aluDecode_419512_422015 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu_aluDecode_419512_422015), .in1(out_conv_in_port_funct3_32_3), .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(3), .BITSIZE_in2(1)) fu_aluDecode_419512_422018 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu_aluDecode_419512_422018), .in1(out_conv_in_port_funct3_32_3), .in2(out_const_2));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(3), .BITSIZE_in2(2)) fu_aluDecode_419512_422021 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu_aluDecode_419512_422021), .in1(out_conv_in_port_funct3_32_3), .in2(out_const_3));
  lut_expr_FU #(.BITSIZE_in1(23), .BITSIZE_out1(1)) fu_aluDecode_419512_422074 (.out1(out_lut_expr_FU_31_i0_fu_aluDecode_419512_422074), .in1(out_const_12), .in2(out_ui_extract_bit_expr_FU_9_i0_fu_aluDecode_419512_421889), .in3(out_ui_extract_bit_expr_FU_10_i0_fu_aluDecode_419512_421893), .in4(out_ui_extract_bit_expr_FU_11_i0_fu_aluDecode_419512_421897), .in5(out_ui_extract_bit_expr_FU_12_i0_fu_aluDecode_419512_421901), .in6(out_lut_expr_FU_8_i0_fu_aluDecode_419512_421884), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  register_STD #(.BITSIZE_in1(13), .BITSIZE_out1(13)) reg_0 (.out1(out_reg_0_reg_0), .clock(clock), .reset(reset), .in1(out_ui_pointer_plus_expr_FU_16_16_16_39_i0_fu_aluDecode_419512_419646), .wenable(wrenable_reg_0));
  register_STD #(.BITSIZE_in1(5), .BITSIZE_out1(5)) reg_1 (.out1(out_reg_1_reg_1), .clock(clock), .reset(reset), .in1(out_ui_cond_expr_FU_8_8_8_8_34_i11_fu_aluDecode_419512_421867), .wenable(wrenable_reg_1));
  register_STD #(.BITSIZE_in1(13), .BITSIZE_out1(13)) reg_2 (.out1(out_reg_2_reg_2), .clock(clock), .reset(reset), .in1(out_ui_pointer_plus_expr_FU_16_16_16_39_i1_fu_aluDecode_419512_419673), .wenable(wrenable_reg_2));
  // io-signal post fix
  assign return_port = out_MUX_9_gimple_return_FU_5_i0_0_0_1;
  assign OUT_MULTIIF_aluDecode_419512_421844 = out_multi_read_cond_FU_33_i0_fu_aluDecode_419512_421844;

endmodule

// FSM based controller description for aluDecode
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_aluDecode(done_port, fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE, fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE, selector_MUX_9_gimple_return_FU_5_i0_0_0_0, selector_MUX_9_gimple_return_FU_5_i0_0_0_1, wrenable_reg_0, wrenable_reg_1, wrenable_reg_2, OUT_MULTIIF_aluDecode_419512_421844, clock, reset, start_port);
  // IN
  input [1:0] OUT_MULTIIF_aluDecode_419512_421844;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  output fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE;
  output selector_MUX_9_gimple_return_FU_5_i0_0_0_0;
  output selector_MUX_9_gimple_return_FU_5_i0_0_0_1;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_2;
  parameter [5:0] S_4 = 6'b010000,
    S_2 = 6'b000100,
    S_3 = 6'b001000,
    S_5 = 6'b100000,
    S_0 = 6'b000001,
    S_1 = 6'b000010;
  reg [5:0] _present_state, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE;
  reg selector_MUX_9_gimple_return_FU_5_i0_0_0_0;
  reg selector_MUX_9_gimple_return_FU_5_i0_0_0_1;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_2;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_4;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE = 1'b0;
    selector_MUX_9_gimple_return_FU_5_i0_0_0_0 = 1'b0;
    selector_MUX_9_gimple_return_FU_5_i0_0_0_1 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_2 = 1'b0;
    case (_present_state)
      S_4 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          if (OUT_MULTIIF_aluDecode_419512_421844[0] == 1'b1)
            begin
              _next_state = S_0;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_1 = 1'b0;
            end
          else if (OUT_MULTIIF_aluDecode_419512_421844[1] == 1'b1)
            begin
              _next_state = S_2;
              wrenable_reg_1 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
          else
            begin
              _next_state = S_5;
              done_port = 1'b1;
              wrenable_reg_0 = 1'b0;
              wrenable_reg_2 = 1'b0;
            end
        end
        else
        begin
          selector_MUX_9_gimple_return_FU_5_i0_0_0_0 = 1'bX;
          selector_MUX_9_gimple_return_FU_5_i0_0_0_1 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_2 = 1'bX;
          _next_state = S_4;
        end
      S_2 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD = 1'b1;
          _next_state = S_3;
          done_port = 1'b1;
        end
      S_3 :
        begin
          _next_state = S_4;
        end
      S_5 :
        begin
          selector_MUX_9_gimple_return_FU_5_i0_0_0_0 = 1'b1;
          _next_state = S_4;
        end
      S_0 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD = 1'b1;
          _next_state = S_1;
          done_port = 1'b1;
        end
      S_1 :
        begin
          selector_MUX_9_gimple_return_FU_5_i0_0_0_1 = 1'b1;
          _next_state = S_4;
        end
      default :
        begin
          _next_state = S_4;
          selector_MUX_9_gimple_return_FU_5_i0_0_0_0 = 1'bX;
          selector_MUX_9_gimple_return_FU_5_i0_0_0_1 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_2 = 1'bX;
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

// Top component for aluDecode
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module aluDecode(clock, reset, start_port, done_port, opcode, funct3, funct7, return_port);
  parameter MEM_var_419652_419512=4096, MEM_var_419678_419512=4096;
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] opcode;
  input [31:0] funct3;
  input [31:0] funct7;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire [1:0] OUT_MULTIIF_aluDecode_419512_421844;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE;
  wire selector_MUX_9_gimple_return_FU_5_i0_0_0_0;
  wire selector_MUX_9_gimple_return_FU_5_i0_0_0_1;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_2;
  
  controller_aluDecode Controller_i (.done_port(done_delayed_REG_signal_in), .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE), .fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE), .selector_MUX_9_gimple_return_FU_5_i0_0_0_0(selector_MUX_9_gimple_return_FU_5_i0_0_0_0), .selector_MUX_9_gimple_return_FU_5_i0_0_0_1(selector_MUX_9_gimple_return_FU_5_i0_0_0_1), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2), .OUT_MULTIIF_aluDecode_419512_421844(OUT_MULTIIF_aluDecode_419512_421844), .clock(clock), .reset(reset), .start_port(start_port));
  datapath_aluDecode #(.MEM_var_419652_419512(MEM_var_419652_419512), .MEM_var_419678_419512(MEM_var_419678_419512)) Datapath_i (.return_port(return_port), .OUT_MULTIIF_aluDecode_419512_421844(OUT_MULTIIF_aluDecode_419512_421844), .clock(clock), .reset(reset), .in_port_opcode(opcode), .in_port_funct3(funct3), .in_port_funct7(funct7), .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_0_i0_STORE), .fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_1_i0_STORE), .selector_MUX_9_gimple_return_FU_5_i0_0_0_0(selector_MUX_9_gimple_return_FU_5_i0_0_0_0), .selector_MUX_9_gimple_return_FU_5_i0_0_0_1(selector_MUX_9_gimple_return_FU_5_i0_0_0_1), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_2(wrenable_reg_2));
  flipflop_AR #(.BITSIZE_in1(1), .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out), .clock(clock), .reset(reset), .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

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

// Datapath RTL description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_main(clock, reset, return_port, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE, selector_IN_UNBOUNDED_main_419532_420319, selector_MUX_168_reg_0_0_0_0, selector_MUX_173_reg_13_0_0_0, selector_MUX_187_reg_26_0_0_0, selector_MUX_187_reg_26_0_0_1, selector_MUX_187_reg_26_0_0_2, selector_MUX_187_reg_26_0_0_3, selector_MUX_187_reg_26_0_0_4, selector_MUX_187_reg_26_0_1_0, selector_MUX_187_reg_26_0_1_1, selector_MUX_187_reg_26_0_1_2, selector_MUX_187_reg_26_0_2_0, selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0, selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0, selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0, selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0, wrenable_reg_0, wrenable_reg_1, wrenable_reg_10, wrenable_reg_11, wrenable_reg_12, wrenable_reg_13, wrenable_reg_14, wrenable_reg_15, wrenable_reg_16, wrenable_reg_17, wrenable_reg_18, wrenable_reg_19, wrenable_reg_2, wrenable_reg_20, wrenable_reg_21, wrenable_reg_22, wrenable_reg_23, wrenable_reg_24, wrenable_reg_25, wrenable_reg_26, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, wrenable_reg_7, wrenable_reg_8, wrenable_reg_9, OUT_CONDITION_main_419532_420274, OUT_CONDITION_main_419532_421537, OUT_MULTIIF_main_419532_421597, OUT_UNBOUNDED_main_419532_420319);
  parameter MEM_var_419652_419512=4096, MEM_var_419678_419512=4096, MEM_var_420284_419532=4096, MEM_var_420408_419532=4096;
  // IN
  input clock;
  input reset;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD;
  input fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  input selector_IN_UNBOUNDED_main_419532_420319;
  input selector_MUX_168_reg_0_0_0_0;
  input selector_MUX_173_reg_13_0_0_0;
  input selector_MUX_187_reg_26_0_0_0;
  input selector_MUX_187_reg_26_0_0_1;
  input selector_MUX_187_reg_26_0_0_2;
  input selector_MUX_187_reg_26_0_0_3;
  input selector_MUX_187_reg_26_0_0_4;
  input selector_MUX_187_reg_26_0_1_0;
  input selector_MUX_187_reg_26_0_1_1;
  input selector_MUX_187_reg_26_0_1_2;
  input selector_MUX_187_reg_26_0_2_0;
  input selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0;
  input selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0;
  input selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0;
  input selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_3;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [31:0] return_port;
  output OUT_CONDITION_main_419532_420274;
  output OUT_CONDITION_main_419532_421537;
  output [12:0] OUT_MULTIIF_main_419532_421597;
  output OUT_UNBOUNDED_main_419532_420319;
  // Component and signal declarations
  wire null_out_signal_array_420284_0_Sout_DataRdy_0;
  wire null_out_signal_array_420284_0_Sout_DataRdy_1;
  wire [31:0] null_out_signal_array_420284_0_Sout_Rdata_ram_0;
  wire [31:0] null_out_signal_array_420284_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_420284_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_420284_0_proxy_out1_1;
  wire null_out_signal_array_420408_0_Sout_DataRdy_0;
  wire null_out_signal_array_420408_0_Sout_DataRdy_1;
  wire [31:0] null_out_signal_array_420408_0_Sout_Rdata_ram_0;
  wire [31:0] null_out_signal_array_420408_0_Sout_Rdata_ram_1;
  wire [31:0] null_out_signal_array_420408_0_out1_1;
  wire [31:0] null_out_signal_array_420408_0_proxy_out1_0;
  wire [31:0] null_out_signal_array_420408_0_proxy_out1_1;
  wire [31:0] out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0;
  wire [31:0] out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0;
  wire [31:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_420408_0;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_20_i0_fu_main_419532_422120;
  wire [31:0] out_ASSIGN_UNSIGNED_FU_21_i0_fu_main_419532_422122;
  wire [31:0] out_IUdata_converter_FU_18_i0_fu_main_419532_421717;
  wire [31:0] out_IUdata_converter_FU_19_i0_fu_main_419532_421766;
  wire [31:0] out_IUdata_converter_FU_57_i0_fu_main_419532_421697;
  wire [5:0] out_MUX_168_reg_0_0_0_0;
  wire [31:0] out_MUX_173_reg_13_0_0_0;
  wire [31:0] out_MUX_187_reg_26_0_0_0;
  wire [31:0] out_MUX_187_reg_26_0_0_1;
  wire [31:0] out_MUX_187_reg_26_0_0_2;
  wire [31:0] out_MUX_187_reg_26_0_0_3;
  wire [31:0] out_MUX_187_reg_26_0_0_4;
  wire [31:0] out_MUX_187_reg_26_0_1_0;
  wire [31:0] out_MUX_187_reg_26_0_1_1;
  wire [31:0] out_MUX_187_reg_26_0_1_2;
  wire [31:0] out_MUX_187_reg_26_0_2_0;
  wire [12:0] out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0;
  wire [31:0] out_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0;
  wire [31:0] out_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0;
  wire [12:0] out_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0;
  wire signed [31:0] out_UIdata_converter_FU_17_i0_fu_main_419532_421714;
  wire signed [31:0] out_UIdata_converter_FU_46_i0_fu_main_419532_421751;
  wire signed [31:0] out_UIdata_converter_FU_47_i0_fu_main_419532_421742;
  wire out_UUdata_converter_FU_53_i0_fu_main_419532_420389;
  wire out_UUdata_converter_FU_54_i0_fu_main_419532_420386;
  wire out_UUdata_converter_FU_55_i0_fu_main_419532_420384;
  wire out_UUdata_converter_FU_56_i0_fu_main_419532_420381;
  wire [12:0] out_addr_expr_FU_4_i0_fu_main_419532_420297;
  wire [12:0] out_addr_expr_FU_52_i0_fu_main_419532_421709;
  wire [31:0] out_aluDecode_91_i0_fu_main_419532_420319;
  wire out_const_0;
  wire [31:0] out_const_1;
  wire [7:0] out_const_10;
  wire [8:0] out_const_11;
  wire [9:0] out_const_12;
  wire [10:0] out_const_13;
  wire [11:0] out_const_14;
  wire [12:0] out_const_15;
  wire [13:0] out_const_16;
  wire [14:0] out_const_17;
  wire [15:0] out_const_18;
  wire [63:0] out_const_19;
  wire [6:0] out_const_2;
  wire [2:0] out_const_20;
  wire [4:0] out_const_21;
  wire [1:0] out_const_22;
  wire [3:0] out_const_23;
  wire [4:0] out_const_24;
  wire [2:0] out_const_25;
  wire [3:0] out_const_26;
  wire [26:0] out_const_27;
  wire [4:0] out_const_28;
  wire [6:0] out_const_29;
  wire out_const_3;
  wire [12:0] out_const_30;
  wire [12:0] out_const_31;
  wire [1:0] out_const_4;
  wire [2:0] out_const_5;
  wire [3:0] out_const_6;
  wire [4:0] out_const_7;
  wire [5:0] out_const_8;
  wire [6:0] out_const_9;
  wire [30:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_420408_0_32_31;
  wire [4:0] out_conv_out_aluDecode_91_i0_fu_main_419532_420319_32_5;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [5:0] out_conv_out_const_2_7_6;
  wire [31:0] out_conv_out_const_30_13_32;
  wire [31:0] out_conv_out_const_31_13_32;
  wire [31:0] out_conv_out_reg_4_reg_4_5_32;
  wire [31:0] out_conv_out_reg_5_reg_5_3_32;
  wire [31:0] out_conv_out_reg_6_reg_6_7_32;
  wire [5:0] out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_0_1_6;
  wire [31:0] out_conv_out_u_assign_conn_obj_2_ASSIGN_UNSIGNED_FU_u_assign_1_1_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_2_1_32;
  wire [31:0] out_conv_out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_3_1_32;
  wire out_lt_expr_FU_32_32_32_60_i0_fu_main_419532_421744;
  wire out_lut_expr_FU_13_i0_fu_main_419532_421705;
  wire out_lut_expr_FU_27_i0_fu_main_419532_421600;
  wire out_lut_expr_FU_28_i0_fu_main_419532_421603;
  wire out_lut_expr_FU_29_i0_fu_main_419532_421606;
  wire out_lut_expr_FU_30_i0_fu_main_419532_421609;
  wire out_lut_expr_FU_31_i0_fu_main_419532_421612;
  wire out_lut_expr_FU_32_i0_fu_main_419532_421615;
  wire out_lut_expr_FU_33_i0_fu_main_419532_421618;
  wire out_lut_expr_FU_34_i0_fu_main_419532_421621;
  wire out_lut_expr_FU_35_i0_fu_main_419532_421624;
  wire out_lut_expr_FU_36_i0_fu_main_419532_421627;
  wire out_lut_expr_FU_37_i0_fu_main_419532_421630;
  wire out_lut_expr_FU_38_i0_fu_main_419532_421633;
  wire out_lut_expr_FU_39_i0_fu_main_419532_421636;
  wire out_lut_expr_FU_40_i0_fu_main_419532_421639;
  wire out_lut_expr_FU_41_i0_fu_main_419532_421642;
  wire out_lut_expr_FU_42_i0_fu_main_419532_421645;
  wire out_lut_expr_FU_43_i0_fu_main_419532_422082;
  wire out_lut_expr_FU_44_i0_fu_main_419532_422085;
  wire out_lut_expr_FU_45_i0_fu_main_419532_422100;
  wire [12:0] out_multi_read_cond_FU_48_i0_fu_main_419532_421597;
  wire out_read_cond_FU_14_i0_fu_main_419532_420274;
  wire out_read_cond_FU_58_i0_fu_main_419532_421537;
  wire [5:0] out_reg_0_reg_0;
  wire out_reg_10_reg_10;
  wire [31:0] out_reg_11_reg_11;
  wire [29:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire [4:0] out_reg_19_reg_19;
  wire [12:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [29:0] out_reg_22_reg_22;
  wire [1:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [31:0] out_reg_26_reg_26;
  wire [12:0] out_reg_2_reg_2;
  wire [12:0] out_reg_3_reg_3;
  wire [4:0] out_reg_4_reg_4;
  wire [2:0] out_reg_5_reg_5;
  wire [6:0] out_reg_6_reg_6;
  wire [12:0] out_reg_7_reg_7;
  wire [12:0] out_reg_8_reg_8;
  wire [6:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_61_i0_fu_main_419532_420308;
  wire signed [5:0] out_rshift_expr_FU_32_0_32_62_i0_fu_main_419532_420315;
  wire signed [31:0] out_rshift_expr_FU_32_32_32_63_i0_fu_main_419532_420376;
  wire [0:0] out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_0;
  wire [0:0] out_u_assign_conn_obj_2_ASSIGN_UNSIGNED_FU_u_assign_1;
  wire [0:0] out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_2;
  wire [0:0] out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_3;
  wire [31:0] out_ui_bit_and_expr_FU_32_32_32_64_i0_fu_main_419532_420397;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_65_i0_fu_main_419532_420310;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_65_i1_fu_main_419532_420312;
  wire [4:0] out_ui_bit_and_expr_FU_8_0_8_65_i2_fu_main_419532_420314;
  wire [2:0] out_ui_bit_and_expr_FU_8_0_8_66_i0_fu_main_419532_420317;
  wire [6:0] out_ui_bit_and_expr_FU_8_0_8_67_i0_fu_main_419532_420318;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_68_i0_fu_main_419532_421796;
  wire [31:0] out_ui_bit_ior_concat_expr_FU_69_i0_fu_main_419532_420362;
  wire [31:0] out_ui_bit_ior_expr_FU_32_32_32_70_i0_fu_main_419532_420395;
  wire [31:0] out_ui_bit_xor_expr_FU_32_32_32_71_i0_fu_main_419532_420393;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_72_i0_fu_main_419532_422077;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_72_i1_fu_main_419532_422101;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_72_i2_fu_main_419532_422107;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_72_i3_fu_main_419532_422110;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_72_i4_fu_main_419532_422113;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_72_i5_fu_main_419532_422116;
  wire out_ui_eq_expr_FU_32_0_32_73_i0_fu_main_419532_421758;
  wire out_ui_extract_bit_expr_FU_10_i0_fu_main_419532_422518;
  wire out_ui_extract_bit_expr_FU_11_i0_fu_main_419532_422545;
  wire out_ui_extract_bit_expr_FU_12_i0_fu_main_419532_422572;
  wire out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129;
  wire out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132;
  wire out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135;
  wire out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138;
  wire out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141;
  wire out_ui_extract_bit_expr_FU_7_i0_fu_main_419532_422437;
  wire out_ui_extract_bit_expr_FU_8_i0_fu_main_419532_422464;
  wire out_ui_extract_bit_expr_FU_9_i0_fu_main_419532_422491;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_74_i0_fu_main_419532_420307;
  wire [13:0] out_ui_lshift_expr_FU_32_0_32_75_i0_fu_main_419532_421711;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_75_i1_fu_main_419532_421792;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_75_i2_fu_main_419532_421807;
  wire [31:0] out_ui_lshift_expr_FU_32_32_32_76_i0_ui_lshift_expr_FU_32_32_32_76_i0;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_77_i0_fu_main_419532_421699;
  wire [6:0] out_ui_lshift_expr_FU_8_0_8_77_i1_fu_main_419532_421731;
  wire [6:0] out_ui_lshift_expr_FU_8_0_8_77_i2_fu_main_419532_421733;
  wire [6:0] out_ui_lshift_expr_FU_8_0_8_77_i3_fu_main_419532_421753;
  wire out_ui_lt_expr_FU_32_32_32_78_i0_fu_main_419532_421747;
  wire [31:0] out_ui_minus_expr_FU_32_32_32_79_i0_fu_main_419532_420399;
  wire [31:0] out_ui_mult_expr_FU_32_32_32_0_80_i0_fu_main_419532_420364;
  wire [29:0] out_ui_plus_expr_FU_32_0_32_81_i0_fu_main_419532_421804;
  wire [29:0] out_ui_plus_expr_FU_32_32_32_82_i0_fu_main_419532_421789;
  wire [31:0] out_ui_plus_expr_FU_32_32_32_82_i1_ui_plus_expr_FU_32_32_32_82_i1;
  wire [5:0] out_ui_plus_expr_FU_8_0_8_83_i0_fu_main_419532_420272;
  wire [12:0] out_ui_pointer_plus_expr_FU_16_16_16_84_i0_fu_main_419532_420270;
  wire [12:0] out_ui_pointer_plus_expr_FU_16_16_16_84_i1_fu_main_419532_420305;
  wire [12:0] out_ui_pointer_plus_expr_FU_16_16_16_84_i2_fu_main_419532_420320;
  wire [12:0] out_ui_pointer_plus_expr_FU_16_16_16_84_i3_fu_main_419532_420322;
  wire [12:0] out_ui_pointer_plus_expr_FU_16_16_16_84_i4_fu_main_419532_420333;
  wire [5:0] out_ui_rshift_expr_FU_32_0_32_85_i0_fu_main_419532_420309;
  wire [5:0] out_ui_rshift_expr_FU_32_0_32_86_i0_fu_main_419532_420311;
  wire [5:0] out_ui_rshift_expr_FU_32_0_32_87_i0_fu_main_419532_420313;
  wire [3:0] out_ui_rshift_expr_FU_32_0_32_88_i0_fu_main_419532_420316;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_89_i0_fu_main_419532_421782;
  wire [29:0] out_ui_rshift_expr_FU_32_0_32_89_i1_fu_main_419532_421801;
  wire [31:0] out_ui_rshift_expr_FU_32_32_32_90_i0_ui_rshift_expr_FU_32_32_32_90_i0;
  wire [12:0] out_ui_view_convert_expr_FU_50_i0_fu_main_419532_420293;
  wire [12:0] out_ui_view_convert_expr_FU_51_i0_fu_main_419532_420290;
  wire [31:0] out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_4;
  wire [31:0] out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_5;
  wire s_done_fu_main_419532_420319;
  
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_0 (.out1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_0), .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_1 (.out1(out_u_assign_conn_obj_2_ASSIGN_UNSIGNED_FU_u_assign_1), .in1(out_const_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_2 (.out1(out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_2), .in1(out_UUdata_converter_FU_56_i0_fu_main_419532_420381));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) ASSIGN_UNSIGNED_FU_u_assign_3 (.out1(out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_3), .in1(out_UUdata_converter_FU_54_i0_fu_main_419532_420386));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_4 (.out1(out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_4), .in1(out_const_1));
  ASSIGN_VECTOR_BOOL_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) ASSIGN_VECTOR_BOOL_FU_vb_assign_5 (.out1(out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_5), .in1(out_reg_26_reg_26));
  MUX_GATE #(.BITSIZE_in1(6), .BITSIZE_in2(6), .BITSIZE_out1(6)) MUX_168_reg_0_0_0_0 (.out1(out_MUX_168_reg_0_0_0_0), .sel(selector_MUX_168_reg_0_0_0_0), .in1(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_0_1_6), .in2(out_ui_plus_expr_FU_8_0_8_83_i0_fu_main_419532_420272));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_173_reg_13_0_0_0 (.out1(out_MUX_173_reg_13_0_0_0), .sel(selector_MUX_173_reg_13_0_0_0), .in1(out_conv_out_u_assign_conn_obj_2_ASSIGN_UNSIGNED_FU_u_assign_1_1_32), .in2(out_ui_lshift_expr_FU_32_0_32_75_i2_fu_main_419532_421807));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_0_0 (.out1(out_MUX_187_reg_26_0_0_0), .sel(selector_MUX_187_reg_26_0_0_0), .in1(out_IUdata_converter_FU_57_i0_fu_main_419532_421697), .in2(out_conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_2_1_32));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_0_1 (.out1(out_MUX_187_reg_26_0_0_1), .sel(selector_MUX_187_reg_26_0_0_1), .in1(out_conv_out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_3_1_32), .in2(out_ui_bit_ior_concat_expr_FU_69_i0_fu_main_419532_420362));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_0_2 (.out1(out_MUX_187_reg_26_0_0_2), .sel(selector_MUX_187_reg_26_0_0_2), .in1(out_ui_cond_expr_FU_32_32_32_32_72_i5_fu_main_419532_422116), .in2(out_ui_lshift_expr_FU_32_32_32_76_i0_ui_lshift_expr_FU_32_32_32_76_i0));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_0_3 (.out1(out_MUX_187_reg_26_0_0_3), .sel(selector_MUX_187_reg_26_0_0_3), .in1(out_ui_minus_expr_FU_32_32_32_79_i0_fu_main_419532_420399), .in2(out_ui_mult_expr_FU_32_32_32_0_80_i0_fu_main_419532_420364));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_0_4 (.out1(out_MUX_187_reg_26_0_0_4), .sel(selector_MUX_187_reg_26_0_0_4), .in1(out_ui_plus_expr_FU_32_32_32_82_i1_ui_plus_expr_FU_32_32_32_82_i1), .in2(out_ui_rshift_expr_FU_32_32_32_90_i0_ui_rshift_expr_FU_32_32_32_90_i0));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_1_0 (.out1(out_MUX_187_reg_26_0_1_0), .sel(selector_MUX_187_reg_26_0_1_0), .in1(out_MUX_187_reg_26_0_0_0), .in2(out_MUX_187_reg_26_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_1_1 (.out1(out_MUX_187_reg_26_0_1_1), .sel(selector_MUX_187_reg_26_0_1_1), .in1(out_MUX_187_reg_26_0_0_2), .in2(out_MUX_187_reg_26_0_0_3));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_1_2 (.out1(out_MUX_187_reg_26_0_1_2), .sel(selector_MUX_187_reg_26_0_1_2), .in1(out_MUX_187_reg_26_0_0_4), .in2(out_MUX_187_reg_26_0_1_0));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_187_reg_26_0_2_0 (.out1(out_MUX_187_reg_26_0_2_0), .sel(selector_MUX_187_reg_26_0_2_0), .in1(out_MUX_187_reg_26_0_1_1), .in2(out_MUX_187_reg_26_0_1_2));
  MUX_GATE #(.BITSIZE_in1(13), .BITSIZE_in2(13), .BITSIZE_out1(13)) MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0 (.out1(out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0), .sel(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0), .in1(out_reg_7_reg_7), .in2(out_ui_pointer_plus_expr_FU_16_16_16_84_i4_fu_main_419532_420333));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0 (.out1(out_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0), .sel(selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0), .in1(out_conv_out_reg_4_reg_4_5_32), .in2(out_reg_17_reg_17));
  MUX_GATE #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0 (.out1(out_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0), .sel(selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0), .in1(out_conv_out_reg_4_reg_4_5_32), .in2(out_reg_17_reg_17));
  MUX_GATE #(.BITSIZE_in1(13), .BITSIZE_in2(13), .BITSIZE_out1(13)) MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0 (.out1(out_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0), .sel(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0), .in1(out_reg_8_reg_8), .in2(out_ui_pointer_plus_expr_FU_16_16_16_84_i0_fu_main_419532_420270));
  ARRAY_1D_STD_BRAM_NN_SDS #(.BITSIZE_in1(32), .PORTSIZE_in1(2), .BITSIZE_in2(13), .PORTSIZE_in2(2), .BITSIZE_in3(6), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(32), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(13), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(32), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(32), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(32), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(6), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file("array_ref_420284.mem"), .n_elements(32), .data_size(32), .address_space_begin(MEM_var_420284_419532), .address_space_rangesize(4096), .BUS_PIPELINED(1), .BRAM_BITSIZE(32), .PRIVATE_MEMORY(1), .READ_ONLY_MEMORY(0), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(32), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(13), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(6), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(32), .PORTSIZE_proxy_out1(2)) array_420284_0 (.out1({out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0, out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0}), .Sout_Rdata_ram({null_out_signal_array_420284_0_Sout_Rdata_ram_1, null_out_signal_array_420284_0_Sout_Rdata_ram_0}), .Sout_DataRdy({null_out_signal_array_420284_0_Sout_DataRdy_1, null_out_signal_array_420284_0_Sout_DataRdy_0}), .proxy_out1({null_out_signal_array_420284_0_proxy_out1_1, null_out_signal_array_420284_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({out_vb_assign_conn_obj_1_ASSIGN_VECTOR_BOOL_FU_vb_assign_4, out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_5}), .in2({out_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0, out_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0}), .in3({out_conv_out_const_2_7_6, out_conv_out_const_2_7_6}), .in4({out_const_3, out_const_3}), .sel_LOAD({fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD}), .sel_STORE({fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE}), .S_oe_ram({1'b0, 1'b0}), .S_we_ram({1'b0, 1'b0}), .S_addr_ram({13'b0000000000000, 13'b0000000000000}), .S_Wdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .Sin_Rdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .S_data_ram_size({6'b000000, 6'b000000}), .Sin_DataRdy({1'b0, 1'b0}), .proxy_in1({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in2({13'b0000000000000, 13'b0000000000000}), .proxy_in3({6'b000000, 6'b000000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(32), .PORTSIZE_in1(2), .BITSIZE_in2(13), .PORTSIZE_in2(2), .BITSIZE_in3(6), .PORTSIZE_in3(2), .BITSIZE_in4(1), .PORTSIZE_in4(2), .BITSIZE_sel_LOAD(1), .PORTSIZE_sel_LOAD(2), .BITSIZE_sel_STORE(1), .PORTSIZE_sel_STORE(2), .BITSIZE_S_oe_ram(1), .PORTSIZE_S_oe_ram(2), .BITSIZE_S_we_ram(1), .PORTSIZE_S_we_ram(2), .BITSIZE_out1(32), .PORTSIZE_out1(2), .BITSIZE_S_addr_ram(13), .PORTSIZE_S_addr_ram(2), .BITSIZE_S_Wdata_ram(32), .PORTSIZE_S_Wdata_ram(2), .BITSIZE_Sin_Rdata_ram(32), .PORTSIZE_Sin_Rdata_ram(2), .BITSIZE_Sout_Rdata_ram(32), .PORTSIZE_Sout_Rdata_ram(2), .BITSIZE_S_data_ram_size(6), .PORTSIZE_S_data_ram_size(2), .BITSIZE_Sin_DataRdy(1), .PORTSIZE_Sin_DataRdy(2), .BITSIZE_Sout_DataRdy(1), .PORTSIZE_Sout_DataRdy(2), .MEMORY_INIT_file("array_ref_420408.mem"), .n_elements(1024), .data_size(32), .address_space_begin(MEM_var_420408_419532), .address_space_rangesize(4096), .BUS_PIPELINED(1), .BRAM_BITSIZE(32), .PRIVATE_MEMORY(1), .READ_ONLY_MEMORY(1), .USE_SPARSE_MEMORY(1), .BITSIZE_proxy_in1(32), .PORTSIZE_proxy_in1(2), .BITSIZE_proxy_in2(13), .PORTSIZE_proxy_in2(2), .BITSIZE_proxy_in3(6), .PORTSIZE_proxy_in3(2), .BITSIZE_proxy_sel_LOAD(1), .PORTSIZE_proxy_sel_LOAD(2), .BITSIZE_proxy_sel_STORE(1), .PORTSIZE_proxy_sel_STORE(2), .BITSIZE_proxy_out1(32), .PORTSIZE_proxy_out1(2)) array_420408_0 (.out1({null_out_signal_array_420408_0_out1_1, out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_420408_0}), .Sout_Rdata_ram({null_out_signal_array_420408_0_Sout_Rdata_ram_1, null_out_signal_array_420408_0_Sout_Rdata_ram_0}), .Sout_DataRdy({null_out_signal_array_420408_0_Sout_DataRdy_1, null_out_signal_array_420408_0_Sout_DataRdy_0}), .proxy_out1({null_out_signal_array_420408_0_proxy_out1_1, null_out_signal_array_420408_0_proxy_out1_0}), .clock(clock), .reset(reset), .in1({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .in2({13'b0000000000000, out_ui_pointer_plus_expr_FU_16_16_16_84_i1_fu_main_419532_420305}), .in3({6'b000000, out_conv_out_const_2_7_6}), .in4({1'b0, out_const_3}), .sel_LOAD({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD}), .sel_STORE({1'b0, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE}), .S_oe_ram({1'b0, 1'b0}), .S_we_ram({1'b0, 1'b0}), .S_addr_ram({13'b0000000000000, 13'b0000000000000}), .S_Wdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .Sin_Rdata_ram({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .S_data_ram_size({6'b000000, 6'b000000}), .Sin_DataRdy({1'b0, 1'b0}), .proxy_in1({32'b00000000000000000000000000000000, 32'b00000000000000000000000000000000}), .proxy_in2({13'b0000000000000, 13'b0000000000000}), .proxy_in3({6'b000000, 6'b000000}), .proxy_sel_LOAD({1'b0, 1'b0}), .proxy_sel_STORE({1'b0, 1'b0}));
  constant_value #(.BITSIZE_out1(1), .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(32), .value(32'b00000000000000000000000000000000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(8), .value(8'b10000000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(9), .value(9'b100000000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(10), .value(10'b1000000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(11), .value(11'b10000000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(12), .value(12'b100000000000)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(13), .value(13'b1000000000000)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(14), .value(14'b10000000000000)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(15), .value(15'b100000000000000)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(16), .value(16'b1000000000000000)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(64), .value(64'b1000000000000000000000000000000001111111111111111111111111111111)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(7), .value(7'b0100000)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(3), .value(3'b101)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(5), .value(5'b10100)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(2), .value(2'b11)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(4), .value(4'b1100)) const_23 (.out1(out_const_23));
  constant_value #(.BITSIZE_out1(5), .value(5'b11001)) const_24 (.out1(out_const_24));
  constant_value #(.BITSIZE_out1(3), .value(3'b111)) const_25 (.out1(out_const_25));
  constant_value #(.BITSIZE_out1(4), .value(4'b1111)) const_26 (.out1(out_const_26));
  constant_value #(.BITSIZE_out1(27), .value(27'b111101100000000000000000000)) const_27 (.out1(out_const_27));
  constant_value #(.BITSIZE_out1(5), .value(5'b11111)) const_28 (.out1(out_const_28));
  constant_value #(.BITSIZE_out1(7), .value(7'b1111111)) const_29 (.out1(out_const_29));
  constant_value #(.BITSIZE_out1(1), .value(1'b1)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(13), .value(MEM_var_420284_419532)) const_30 (.out1(out_const_30));
  constant_value #(.BITSIZE_out1(13), .value(MEM_var_420408_419532)) const_31 (.out1(out_const_31));
  constant_value #(.BITSIZE_out1(2), .value(2'b10)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3), .value(3'b100)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4), .value(4'b1000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(5), .value(5'b10000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(6), .value(6'b100000)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(7), .value(7'b1000000)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(31)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_420408_0_32_31 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_420408_0_32_31), .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_420408_0));
  UUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(5)) conv_out_aluDecode_91_i0_fu_main_419532_420319_32_5 (.out1(out_conv_out_aluDecode_91_i0_fu_main_419532_420319_32_5), .in1(out_aluDecode_91_i0_fu_main_419532_420319));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32), .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(7), .BITSIZE_out1(6)) conv_out_const_2_7_6 (.out1(out_conv_out_const_2_7_6), .in1(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(13), .BITSIZE_out1(32)) conv_out_const_30_13_32 (.out1(out_conv_out_const_30_13_32), .in1(out_const_30));
  UUdata_converter_FU #(.BITSIZE_in1(13), .BITSIZE_out1(32)) conv_out_const_31_13_32 (.out1(out_conv_out_const_31_13_32), .in1(out_const_31));
  UUdata_converter_FU #(.BITSIZE_in1(5), .BITSIZE_out1(32)) conv_out_reg_4_reg_4_5_32 (.out1(out_conv_out_reg_4_reg_4_5_32), .in1(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(3), .BITSIZE_out1(32)) conv_out_reg_5_reg_5_3_32 (.out1(out_conv_out_reg_5_reg_5_3_32), .in1(out_reg_5_reg_5));
  UUdata_converter_FU #(.BITSIZE_in1(7), .BITSIZE_out1(32)) conv_out_reg_6_reg_6_7_32 (.out1(out_conv_out_reg_6_reg_6_7_32), .in1(out_reg_6_reg_6));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(6)) conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_0_1_6 (.out1(out_conv_out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_0_1_6), .in1(out_u_assign_conn_obj_0_ASSIGN_UNSIGNED_FU_u_assign_0));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_2_ASSIGN_UNSIGNED_FU_u_assign_1_1_32 (.out1(out_conv_out_u_assign_conn_obj_2_ASSIGN_UNSIGNED_FU_u_assign_1_1_32), .in1(out_u_assign_conn_obj_2_ASSIGN_UNSIGNED_FU_u_assign_1));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_2_1_32 (.out1(out_conv_out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_2_1_32), .in1(out_u_assign_conn_obj_3_ASSIGN_UNSIGNED_FU_u_assign_2));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(32)) conv_out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_3_1_32 (.out1(out_conv_out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_3_1_32), .in1(out_u_assign_conn_obj_4_ASSIGN_UNSIGNED_FU_u_assign_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(13), .BITSIZE_in2(8), .BITSIZE_out1(13), .LSB_PARAMETER(2)) fu_main_419532_420270 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_84_i0_fu_main_419532_420270), .in1(out_reg_1_reg_1), .in2(out_ui_lshift_expr_FU_8_0_8_77_i0_fu_main_419532_421699));
  ui_plus_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(1), .BITSIZE_out1(6)) fu_main_419532_420272 (.out1(out_ui_plus_expr_FU_8_0_8_83_i0_fu_main_419532_420272), .in1(out_reg_0_reg_0), .in2(out_const_3));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_419532_420274 (.out1(out_read_cond_FU_14_i0_fu_main_419532_420274), .in1(out_lut_expr_FU_13_i0_fu_main_419532_421705));
  ui_view_convert_expr_FU #(.BITSIZE_in1(13), .BITSIZE_out1(13)) fu_main_419532_420290 (.out1(out_ui_view_convert_expr_FU_51_i0_fu_main_419532_420290), .in1(out_ui_view_convert_expr_FU_50_i0_fu_main_419532_420293));
  ui_view_convert_expr_FU #(.BITSIZE_in1(13), .BITSIZE_out1(13)) fu_main_419532_420293 (.out1(out_ui_view_convert_expr_FU_50_i0_fu_main_419532_420293), .in1(out_addr_expr_FU_4_i0_fu_main_419532_420297));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(13)) fu_main_419532_420297 (.out1(out_addr_expr_FU_4_i0_fu_main_419532_420297), .in1(out_conv_out_const_30_13_32));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(13), .BITSIZE_in2(14), .BITSIZE_out1(13), .LSB_PARAMETER(2)) fu_main_419532_420305 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_84_i1_fu_main_419532_420305), .in1(out_reg_3_reg_3), .in2(out_ui_lshift_expr_FU_32_0_32_75_i0_fu_main_419532_421711));
  ui_lshift_expr_FU #(.BITSIZE_in1(31), .BITSIZE_in2(1), .BITSIZE_out1(32), .PRECISION(32)) fu_main_419532_420307 (.out1(out_ui_lshift_expr_FU_32_0_32_74_i0_fu_main_419532_420307), .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_420408_0_32_31), .in2(out_const_3));
  rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(31), .PRECISION(32)) fu_main_419532_420308 (.out1(out_rshift_expr_FU_32_0_32_61_i0_fu_main_419532_420308), .in1(out_UIdata_converter_FU_17_i0_fu_main_419532_421714), .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(6), .PRECISION(32)) fu_main_419532_420309 (.out1(out_ui_rshift_expr_FU_32_0_32_85_i0_fu_main_419532_420309), .in1(out_IUdata_converter_FU_18_i0_fu_main_419532_421717), .in2(out_const_26));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(5), .BITSIZE_out1(5)) fu_main_419532_420310 (.out1(out_ui_bit_and_expr_FU_8_0_8_65_i0_fu_main_419532_420310), .in1(out_ui_rshift_expr_FU_32_0_32_85_i0_fu_main_419532_420309), .in2(out_const_28));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(6), .PRECISION(32)) fu_main_419532_420311 (.out1(out_ui_rshift_expr_FU_32_0_32_86_i0_fu_main_419532_420311), .in1(out_IUdata_converter_FU_18_i0_fu_main_419532_421717), .in2(out_const_21));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(5), .BITSIZE_out1(5)) fu_main_419532_420312 (.out1(out_ui_bit_and_expr_FU_8_0_8_65_i1_fu_main_419532_420312), .in1(out_ui_rshift_expr_FU_32_0_32_86_i0_fu_main_419532_420311), .in2(out_const_28));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(3), .BITSIZE_out1(6), .PRECISION(32)) fu_main_419532_420313 (.out1(out_ui_rshift_expr_FU_32_0_32_87_i0_fu_main_419532_420313), .in1(out_IUdata_converter_FU_18_i0_fu_main_419532_421717), .in2(out_const_25));
  ui_bit_and_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(5), .BITSIZE_out1(5)) fu_main_419532_420314 (.out1(out_ui_bit_and_expr_FU_8_0_8_65_i2_fu_main_419532_420314), .in1(out_ui_rshift_expr_FU_32_0_32_87_i0_fu_main_419532_420313), .in2(out_const_28));
  rshift_expr_FU #(.BITSIZE_in1(31), .BITSIZE_in2(5), .BITSIZE_out1(6), .PRECISION(32)) fu_main_419532_420315 (.out1(out_rshift_expr_FU_32_0_32_62_i0_fu_main_419532_420315), .in1(out_rshift_expr_FU_32_0_32_61_i0_fu_main_419532_420308), .in2(out_const_24));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(4), .BITSIZE_out1(4), .PRECISION(32)) fu_main_419532_420316 (.out1(out_ui_rshift_expr_FU_32_0_32_88_i0_fu_main_419532_420316), .in1(out_IUdata_converter_FU_18_i0_fu_main_419532_421717), .in2(out_const_23));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4), .BITSIZE_in2(3), .BITSIZE_out1(3)) fu_main_419532_420317 (.out1(out_ui_bit_and_expr_FU_8_0_8_66_i0_fu_main_419532_420317), .in1(out_ui_rshift_expr_FU_32_0_32_88_i0_fu_main_419532_420316), .in2(out_const_25));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(7), .BITSIZE_out1(7)) fu_main_419532_420318 (.out1(out_ui_bit_and_expr_FU_8_0_8_67_i0_fu_main_419532_420318), .in1(out_IUdata_converter_FU_18_i0_fu_main_419532_421717), .in2(out_const_29));
  aluDecode #(.MEM_var_419652_419512(MEM_var_419652_419512), .MEM_var_419678_419512(MEM_var_419678_419512)) fu_main_419532_420319 (.done_port(s_done_fu_main_419532_420319), .return_port(out_aluDecode_91_i0_fu_main_419532_420319), .clock(clock), .reset(reset), .start_port(selector_IN_UNBOUNDED_main_419532_420319), .opcode(out_conv_out_reg_6_reg_6_7_32), .funct3(out_conv_out_reg_5_reg_5_3_32), .funct7(out_reg_11_reg_11));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(13), .BITSIZE_in2(7), .BITSIZE_out1(13), .LSB_PARAMETER(2)) fu_main_419532_420320 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_84_i2_fu_main_419532_420320), .in1(out_reg_2_reg_2), .in2(out_ui_lshift_expr_FU_8_0_8_77_i1_fu_main_419532_421731));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(13), .BITSIZE_in2(7), .BITSIZE_out1(13), .LSB_PARAMETER(2)) fu_main_419532_420322 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_84_i3_fu_main_419532_420322), .in1(out_reg_2_reg_2), .in2(out_ui_lshift_expr_FU_8_0_8_77_i2_fu_main_419532_421733));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(13), .BITSIZE_in2(7), .BITSIZE_out1(13), .LSB_PARAMETER(2)) fu_main_419532_420333 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_84_i4_fu_main_419532_420333), .in1(out_reg_2_reg_2), .in2(out_reg_9_reg_9));
  ui_bit_ior_concat_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_in3(2), .BITSIZE_out1(32), .OFFSET_PARAMETER(2)) fu_main_419532_420362 (.out1(out_ui_bit_ior_concat_expr_FU_69_i0_fu_main_419532_420362), .in1(out_ui_lshift_expr_FU_32_0_32_75_i1_fu_main_419532_421792), .in2(out_reg_23_reg_23), .in3(out_const_4));
  ui_mult_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PIPE_PARAMETER(0)) fu_main_419532_420364 (.out1(out_ui_mult_expr_FU_32_32_32_0_80_i0_fu_main_419532_420364), .clock(clock), .in1(out_reg_25_reg_25), .in2(out_reg_24_reg_24));
  rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(5), .BITSIZE_out1(32), .PRECISION(32)) fu_main_419532_420376 (.out1(out_rshift_expr_FU_32_32_32_63_i0_fu_main_419532_420376), .in1(out_reg_21_reg_21), .in2(out_reg_4_reg_4));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_main_419532_420381 (.out1(out_UUdata_converter_FU_56_i0_fu_main_419532_420381), .in1(out_UUdata_converter_FU_55_i0_fu_main_419532_420384));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_main_419532_420384 (.out1(out_UUdata_converter_FU_55_i0_fu_main_419532_420384), .in1(out_ui_lt_expr_FU_32_32_32_78_i0_fu_main_419532_421747));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_main_419532_420386 (.out1(out_UUdata_converter_FU_54_i0_fu_main_419532_420386), .in1(out_UUdata_converter_FU_53_i0_fu_main_419532_420389));
  UUdata_converter_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_main_419532_420389 (.out1(out_UUdata_converter_FU_53_i0_fu_main_419532_420389), .in1(out_lt_expr_FU_32_32_32_60_i0_fu_main_419532_421744));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_main_419532_420393 (.out1(out_ui_bit_xor_expr_FU_32_32_32_71_i0_fu_main_419532_420393), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0), .in2(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_main_419532_420395 (.out1(out_ui_bit_ior_expr_FU_32_32_32_70_i0_fu_main_419532_420395), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0), .in2(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_main_419532_420397 (.out1(out_ui_bit_and_expr_FU_32_32_32_64_i0_fu_main_419532_420397), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0), .in2(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0));
  ui_minus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) fu_main_419532_420399 (.out1(out_ui_minus_expr_FU_32_32_32_79_i0_fu_main_419532_420399), .in1(out_reg_18_reg_18), .in2(out_reg_17_reg_17));
  read_cond_FU #(.BITSIZE_in1(1)) fu_main_419532_421537 (.out1(out_read_cond_FU_58_i0_fu_main_419532_421537), .in1(out_reg_10_reg_10));
  multi_read_cond_FU #(.BITSIZE_in1(1), .PORTSIZE_in1(13), .BITSIZE_out1(13)) fu_main_419532_421597 (.out1(out_multi_read_cond_FU_48_i0_fu_main_419532_421597), .in1({out_lut_expr_FU_27_i0_fu_main_419532_421600, out_lut_expr_FU_28_i0_fu_main_419532_421603, out_lut_expr_FU_32_i0_fu_main_419532_421615, out_lut_expr_FU_33_i0_fu_main_419532_421618, out_lut_expr_FU_34_i0_fu_main_419532_421621, out_lut_expr_FU_35_i0_fu_main_419532_421624, out_lut_expr_FU_36_i0_fu_main_419532_421627, out_lut_expr_FU_37_i0_fu_main_419532_421630, out_lut_expr_FU_38_i0_fu_main_419532_421633, out_lut_expr_FU_39_i0_fu_main_419532_421636, out_lut_expr_FU_40_i0_fu_main_419532_421639, out_lut_expr_FU_42_i0_fu_main_419532_421645, out_lut_expr_FU_43_i0_fu_main_419532_422082}));
  lut_expr_FU #(.BITSIZE_in1(1), .BITSIZE_out1(1)) fu_main_419532_421600 (.out1(out_lut_expr_FU_27_i0_fu_main_419532_421600), .in1(out_const_3), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(2), .BITSIZE_out1(1)) fu_main_419532_421603 (.out1(out_lut_expr_FU_28_i0_fu_main_419532_421603), .in1(out_const_4), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(3), .BITSIZE_out1(1)) fu_main_419532_421606 (.out1(out_lut_expr_FU_29_i0_fu_main_419532_421606), .in1(out_const_5), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4), .BITSIZE_out1(1)) fu_main_419532_421609 (.out1(out_lut_expr_FU_30_i0_fu_main_419532_421609), .in1(out_const_6), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5), .BITSIZE_out1(1)) fu_main_419532_421612 (.out1(out_lut_expr_FU_31_i0_fu_main_419532_421612), .in1(out_const_7), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(6), .BITSIZE_out1(1)) fu_main_419532_421615 (.out1(out_lut_expr_FU_32_i0_fu_main_419532_421615), .in1(out_const_8), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(7), .BITSIZE_out1(1)) fu_main_419532_421618 (.out1(out_lut_expr_FU_33_i0_fu_main_419532_421618), .in1(out_const_9), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(8), .BITSIZE_out1(1)) fu_main_419532_421621 (.out1(out_lut_expr_FU_34_i0_fu_main_419532_421621), .in1(out_const_10), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(9), .BITSIZE_out1(1)) fu_main_419532_421624 (.out1(out_lut_expr_FU_35_i0_fu_main_419532_421624), .in1(out_const_11), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(10), .BITSIZE_out1(1)) fu_main_419532_421627 (.out1(out_lut_expr_FU_36_i0_fu_main_419532_421627), .in1(out_const_12), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(11), .BITSIZE_out1(1)) fu_main_419532_421630 (.out1(out_lut_expr_FU_37_i0_fu_main_419532_421630), .in1(out_const_13), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(12), .BITSIZE_out1(1)) fu_main_419532_421633 (.out1(out_lut_expr_FU_38_i0_fu_main_419532_421633), .in1(out_const_14), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(13), .BITSIZE_out1(1)) fu_main_419532_421636 (.out1(out_lut_expr_FU_39_i0_fu_main_419532_421636), .in1(out_const_15), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(14), .BITSIZE_out1(1)) fu_main_419532_421639 (.out1(out_lut_expr_FU_40_i0_fu_main_419532_421639), .in1(out_const_16), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(15), .BITSIZE_out1(1)) fu_main_419532_421642 (.out1(out_lut_expr_FU_41_i0_fu_main_419532_421642), .in1(out_const_17), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(16), .BITSIZE_out1(1)) fu_main_419532_421645 (.out1(out_lut_expr_FU_42_i0_fu_main_419532_421645), .in1(out_const_18), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  IUdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_419532_421697 (.out1(out_IUdata_converter_FU_57_i0_fu_main_419532_421697), .in1(out_rshift_expr_FU_32_32_32_63_i0_fu_main_419532_420376));
  ui_lshift_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(2), .BITSIZE_out1(8), .PRECISION(32)) fu_main_419532_421699 (.out1(out_ui_lshift_expr_FU_8_0_8_77_i0_fu_main_419532_421699), .in1(out_reg_0_reg_0), .in2(out_const_4));
  lut_expr_FU #(.BITSIZE_in1(64), .BITSIZE_out1(1)) fu_main_419532_421705 (.out1(out_lut_expr_FU_13_i0_fu_main_419532_421705), .in1(out_const_19), .in2(out_ui_extract_bit_expr_FU_7_i0_fu_main_419532_422437), .in3(out_ui_extract_bit_expr_FU_8_i0_fu_main_419532_422464), .in4(out_ui_extract_bit_expr_FU_9_i0_fu_main_419532_422491), .in5(out_ui_extract_bit_expr_FU_10_i0_fu_main_419532_422518), .in6(out_ui_extract_bit_expr_FU_11_i0_fu_main_419532_422545), .in7(out_ui_extract_bit_expr_FU_12_i0_fu_main_419532_422572), .in8(1'b0), .in9(1'b0));
  addr_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(13)) fu_main_419532_421709 (.out1(out_addr_expr_FU_52_i0_fu_main_419532_421709), .in1(out_conv_out_const_31_13_32));
  ui_lshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(14), .PRECISION(32)) fu_main_419532_421711 (.out1(out_ui_lshift_expr_FU_32_0_32_75_i0_fu_main_419532_421711), .in1(out_reg_13_reg_13), .in2(out_const_4));
  UIdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_419532_421714 (.out1(out_UIdata_converter_FU_17_i0_fu_main_419532_421714), .in1(out_ui_lshift_expr_FU_32_0_32_74_i0_fu_main_419532_420307));
  IUdata_converter_FU #(.BITSIZE_in1(31), .BITSIZE_out1(32)) fu_main_419532_421717 (.out1(out_IUdata_converter_FU_18_i0_fu_main_419532_421717), .in1(out_rshift_expr_FU_32_0_32_61_i0_fu_main_419532_420308));
  ui_lshift_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(2), .BITSIZE_out1(7), .PRECISION(32)) fu_main_419532_421731 (.out1(out_ui_lshift_expr_FU_8_0_8_77_i1_fu_main_419532_421731), .in1(out_ui_bit_and_expr_FU_8_0_8_65_i0_fu_main_419532_420310), .in2(out_const_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(2), .BITSIZE_out1(7), .PRECISION(32)) fu_main_419532_421733 (.out1(out_ui_lshift_expr_FU_8_0_8_77_i2_fu_main_419532_421733), .in1(out_ui_bit_and_expr_FU_8_0_8_65_i1_fu_main_419532_420312), .in2(out_const_4));
  UIdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_419532_421742 (.out1(out_UIdata_converter_FU_47_i0_fu_main_419532_421742), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0));
  lt_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(1)) fu_main_419532_421744 (.out1(out_lt_expr_FU_32_32_32_60_i0_fu_main_419532_421744), .in1(out_reg_21_reg_21), .in2(out_reg_20_reg_20));
  ui_lt_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(1)) fu_main_419532_421747 (.out1(out_ui_lt_expr_FU_32_32_32_78_i0_fu_main_419532_421747), .in1(out_reg_18_reg_18), .in2(out_reg_17_reg_17));
  UIdata_converter_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_419532_421751 (.out1(out_UIdata_converter_FU_46_i0_fu_main_419532_421751), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(2), .BITSIZE_out1(7), .PRECISION(32)) fu_main_419532_421753 (.out1(out_ui_lshift_expr_FU_8_0_8_77_i3_fu_main_419532_421753), .in1(out_ui_bit_and_expr_FU_8_0_8_65_i2_fu_main_419532_420314), .in2(out_const_4));
  ui_eq_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(1), .BITSIZE_out1(1)) fu_main_419532_421758 (.out1(out_ui_eq_expr_FU_32_0_32_73_i0_fu_main_419532_421758), .in1(out_IUdata_converter_FU_18_i0_fu_main_419532_421717), .in2(out_const_0));
  IUdata_converter_FU #(.BITSIZE_in1(6), .BITSIZE_out1(32)) fu_main_419532_421766 (.out1(out_IUdata_converter_FU_19_i0_fu_main_419532_421766), .in1(out_rshift_expr_FU_32_0_32_62_i0_fu_main_419532_420315));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(30), .PRECISION(32)) fu_main_419532_421782 (.out1(out_ui_rshift_expr_FU_32_0_32_89_i0_fu_main_419532_421782), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0), .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(30), .BITSIZE_in2(30), .BITSIZE_out1(30)) fu_main_419532_421789 (.out1(out_ui_plus_expr_FU_32_32_32_82_i0_fu_main_419532_421789), .in1(out_reg_22_reg_22), .in2(out_reg_12_reg_12));
  ui_lshift_expr_FU #(.BITSIZE_in1(30), .BITSIZE_in2(2), .BITSIZE_out1(32), .PRECISION(32)) fu_main_419532_421792 (.out1(out_ui_lshift_expr_FU_32_0_32_75_i1_fu_main_419532_421792), .in1(out_ui_plus_expr_FU_32_32_32_82_i0_fu_main_419532_421789), .in2(out_const_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(2)) fu_main_419532_421796 (.out1(out_ui_bit_and_expr_FU_8_0_8_68_i0_fu_main_419532_421796), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0), .in2(out_const_22));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(2), .BITSIZE_out1(30), .PRECISION(32)) fu_main_419532_421801 (.out1(out_ui_rshift_expr_FU_32_0_32_89_i1_fu_main_419532_421801), .in1(out_reg_13_reg_13), .in2(out_const_4));
  ui_plus_expr_FU #(.BITSIZE_in1(30), .BITSIZE_in2(1), .BITSIZE_out1(30)) fu_main_419532_421804 (.out1(out_ui_plus_expr_FU_32_0_32_81_i0_fu_main_419532_421804), .in1(out_ui_rshift_expr_FU_32_0_32_89_i1_fu_main_419532_421801), .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(30), .BITSIZE_in2(2), .BITSIZE_out1(32), .PRECISION(32)) fu_main_419532_421807 (.out1(out_ui_lshift_expr_FU_32_0_32_75_i2_fu_main_419532_421807), .in1(out_ui_plus_expr_FU_32_0_32_81_i0_fu_main_419532_421804), .in2(out_const_4));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(1), .BITSIZE_out1(32)) fu_main_419532_422077 (.out1(out_ui_cond_expr_FU_32_32_32_32_72_i0_fu_main_419532_422077), .in1(out_lut_expr_FU_41_i0_fu_main_419532_421642), .in2(out_reg_17_reg_17), .in3(out_const_0));
  lut_expr_FU #(.BITSIZE_in1(9), .BITSIZE_out1(1)) fu_main_419532_422082 (.out1(out_lut_expr_FU_43_i0_fu_main_419532_422082), .in1(out_const_11), .in2(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in3(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in4(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in5(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(10), .BITSIZE_out1(1)) fu_main_419532_422085 (.out1(out_lut_expr_FU_44_i0_fu_main_419532_422085), .in1(out_const_12), .in2(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in3(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in4(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in5(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in6(1'b0), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(27), .BITSIZE_out1(1)) fu_main_419532_422100 (.out1(out_lut_expr_FU_45_i0_fu_main_419532_422100), .in1(out_const_27), .in2(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in3(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in4(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in5(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in6(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in7(1'b0), .in8(1'b0), .in9(1'b0));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(1), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_main_419532_422101 (.out1(out_ui_cond_expr_FU_32_32_32_32_72_i1_fu_main_419532_422101), .in1(out_lut_expr_FU_45_i0_fu_main_419532_422100), .in2(out_const_0), .in3(out_ui_cond_expr_FU_32_32_32_32_72_i0_fu_main_419532_422077));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_main_419532_422107 (.out1(out_ui_cond_expr_FU_32_32_32_32_72_i2_fu_main_419532_422107), .in1(out_lut_expr_FU_29_i0_fu_main_419532_421606), .in2(out_reg_16_reg_16), .in3(out_ui_cond_expr_FU_32_32_32_32_72_i1_fu_main_419532_422101));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_main_419532_422110 (.out1(out_ui_cond_expr_FU_32_32_32_32_72_i3_fu_main_419532_422110), .in1(out_lut_expr_FU_30_i0_fu_main_419532_421609), .in2(out_reg_15_reg_15), .in3(out_ui_cond_expr_FU_32_32_32_32_72_i2_fu_main_419532_422107));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_main_419532_422113 (.out1(out_ui_cond_expr_FU_32_32_32_32_72_i4_fu_main_419532_422113), .in1(out_lut_expr_FU_31_i0_fu_main_419532_421612), .in2(out_reg_14_reg_14), .in3(out_ui_cond_expr_FU_32_32_32_32_72_i3_fu_main_419532_422110));
  ui_cond_expr_FU #(.BITSIZE_in1(1), .BITSIZE_in2(32), .BITSIZE_in3(32), .BITSIZE_out1(32)) fu_main_419532_422116 (.out1(out_ui_cond_expr_FU_32_32_32_32_72_i5_fu_main_419532_422116), .in1(out_lut_expr_FU_44_i0_fu_main_419532_422085), .in2(out_reg_13_reg_13), .in3(out_ui_cond_expr_FU_32_32_32_32_72_i4_fu_main_419532_422113));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_419532_422120 (.out1(out_ASSIGN_UNSIGNED_FU_20_i0_fu_main_419532_422120), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0));
  ASSIGN_UNSIGNED_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) fu_main_419532_422122 (.out1(out_ASSIGN_UNSIGNED_FU_21_i0_fu_main_419532_422122), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(1)) fu_main_419532_422129 (.out1(out_ui_extract_bit_expr_FU_22_i0_fu_main_419532_422129), .in1(out_reg_19_reg_19), .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(1)) fu_main_419532_422132 (.out1(out_ui_extract_bit_expr_FU_23_i0_fu_main_419532_422132), .in1(out_reg_19_reg_19), .in2(out_const_3));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(2)) fu_main_419532_422135 (.out1(out_ui_extract_bit_expr_FU_24_i0_fu_main_419532_422135), .in1(out_reg_19_reg_19), .in2(out_const_4));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(2)) fu_main_419532_422138 (.out1(out_ui_extract_bit_expr_FU_25_i0_fu_main_419532_422138), .in1(out_reg_19_reg_19), .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(5), .BITSIZE_in2(3)) fu_main_419532_422141 (.out1(out_ui_extract_bit_expr_FU_26_i0_fu_main_419532_422141), .in1(out_reg_19_reg_19), .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(1)) fu_main_419532_422437 (.out1(out_ui_extract_bit_expr_FU_7_i0_fu_main_419532_422437), .in1(out_reg_0_reg_0), .in2(out_const_0));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(1)) fu_main_419532_422464 (.out1(out_ui_extract_bit_expr_FU_8_i0_fu_main_419532_422464), .in1(out_reg_0_reg_0), .in2(out_const_3));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(2)) fu_main_419532_422491 (.out1(out_ui_extract_bit_expr_FU_9_i0_fu_main_419532_422491), .in1(out_reg_0_reg_0), .in2(out_const_4));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(2)) fu_main_419532_422518 (.out1(out_ui_extract_bit_expr_FU_10_i0_fu_main_419532_422518), .in1(out_reg_0_reg_0), .in2(out_const_22));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(3)) fu_main_419532_422545 (.out1(out_ui_extract_bit_expr_FU_11_i0_fu_main_419532_422545), .in1(out_reg_0_reg_0), .in2(out_const_5));
  ui_extract_bit_expr_FU #(.BITSIZE_in1(6), .BITSIZE_in2(3)) fu_main_419532_422572 (.out1(out_ui_extract_bit_expr_FU_12_i0_fu_main_419532_422572), .in1(out_reg_0_reg_0), .in2(out_const_20));
  register_SE #(.BITSIZE_in1(6), .BITSIZE_out1(6)) reg_0 (.out1(out_reg_0_reg_0), .clock(clock), .reset(reset), .in1(out_MUX_168_reg_0_0_0_0), .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(13), .BITSIZE_out1(13)) reg_1 (.out1(out_reg_1_reg_1), .clock(clock), .reset(reset), .in1(out_ui_view_convert_expr_FU_51_i0_fu_main_419532_420290), .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(1), .BITSIZE_out1(1)) reg_10 (.out1(out_reg_10_reg_10), .clock(clock), .reset(reset), .in1(out_ui_eq_expr_FU_32_0_32_73_i0_fu_main_419532_421758), .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_11 (.out1(out_reg_11_reg_11), .clock(clock), .reset(reset), .in1(out_IUdata_converter_FU_19_i0_fu_main_419532_421766), .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(30), .BITSIZE_out1(30)) reg_12 (.out1(out_reg_12_reg_12), .clock(clock), .reset(reset), .in1(out_ui_rshift_expr_FU_32_0_32_89_i1_fu_main_419532_421801), .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13), .clock(clock), .reset(reset), .in1(out_MUX_173_reg_13_0_0_0), .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14), .clock(clock), .reset(reset), .in1(out_ui_bit_xor_expr_FU_32_32_32_71_i0_fu_main_419532_420393), .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15), .clock(clock), .reset(reset), .in1(out_ui_bit_ior_expr_FU_32_32_32_70_i0_fu_main_419532_420395), .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16), .clock(clock), .reset(reset), .in1(out_ui_bit_and_expr_FU_32_32_32_64_i0_fu_main_419532_420397), .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17), .clock(clock), .reset(reset), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_array_420284_0), .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18), .clock(clock), .reset(reset), .in1(out_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_array_420284_0), .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(5), .BITSIZE_out1(5)) reg_19 (.out1(out_reg_19_reg_19), .clock(clock), .reset(reset), .in1(out_conv_out_aluDecode_91_i0_fu_main_419532_420319_32_5), .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(13), .BITSIZE_out1(13)) reg_2 (.out1(out_reg_2_reg_2), .clock(clock), .reset(reset), .in1(out_addr_expr_FU_4_i0_fu_main_419532_420297), .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20), .clock(clock), .reset(reset), .in1(out_UIdata_converter_FU_47_i0_fu_main_419532_421742), .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21), .clock(clock), .reset(reset), .in1(out_UIdata_converter_FU_46_i0_fu_main_419532_421751), .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(30), .BITSIZE_out1(30)) reg_22 (.out1(out_reg_22_reg_22), .clock(clock), .reset(reset), .in1(out_ui_rshift_expr_FU_32_0_32_89_i0_fu_main_419532_421782), .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(2), .BITSIZE_out1(2)) reg_23 (.out1(out_reg_23_reg_23), .clock(clock), .reset(reset), .in1(out_ui_bit_and_expr_FU_8_0_8_68_i0_fu_main_419532_421796), .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24), .clock(clock), .reset(reset), .in1(out_ASSIGN_UNSIGNED_FU_20_i0_fu_main_419532_422120), .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25), .clock(clock), .reset(reset), .in1(out_ASSIGN_UNSIGNED_FU_21_i0_fu_main_419532_422122), .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(32), .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26), .clock(clock), .reset(reset), .in1(out_MUX_187_reg_26_0_2_0), .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(13), .BITSIZE_out1(13)) reg_3 (.out1(out_reg_3_reg_3), .clock(clock), .reset(reset), .in1(out_addr_expr_FU_52_i0_fu_main_419532_421709), .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(5), .BITSIZE_out1(5)) reg_4 (.out1(out_reg_4_reg_4), .clock(clock), .reset(reset), .in1(out_ui_bit_and_expr_FU_8_0_8_65_i1_fu_main_419532_420312), .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(3), .BITSIZE_out1(3)) reg_5 (.out1(out_reg_5_reg_5), .clock(clock), .reset(reset), .in1(out_ui_bit_and_expr_FU_8_0_8_66_i0_fu_main_419532_420317), .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(7), .BITSIZE_out1(7)) reg_6 (.out1(out_reg_6_reg_6), .clock(clock), .reset(reset), .in1(out_ui_bit_and_expr_FU_8_0_8_67_i0_fu_main_419532_420318), .wenable(wrenable_reg_6));
  register_STD #(.BITSIZE_in1(13), .BITSIZE_out1(13)) reg_7 (.out1(out_reg_7_reg_7), .clock(clock), .reset(reset), .in1(out_ui_pointer_plus_expr_FU_16_16_16_84_i2_fu_main_419532_420320), .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(13), .BITSIZE_out1(13)) reg_8 (.out1(out_reg_8_reg_8), .clock(clock), .reset(reset), .in1(out_ui_pointer_plus_expr_FU_16_16_16_84_i3_fu_main_419532_420322), .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(7), .BITSIZE_out1(7)) reg_9 (.out1(out_reg_9_reg_9), .clock(clock), .reset(reset), .in1(out_ui_lshift_expr_FU_8_0_8_77_i3_fu_main_419532_421753), .wenable(wrenable_reg_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PRECISION(32)) ui_lshift_expr_FU_32_32_32_76_i0 (.out1(out_ui_lshift_expr_FU_32_32_32_76_i0_ui_lshift_expr_FU_32_32_32_76_i0), .in1(out_reg_18_reg_18), .in2(out_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0));
  ui_plus_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32)) ui_plus_expr_FU_32_32_32_82_i1 (.out1(out_ui_plus_expr_FU_32_32_32_82_i1_ui_plus_expr_FU_32_32_32_82_i1), .in1(out_reg_17_reg_17), .in2(out_reg_18_reg_18));
  ui_rshift_expr_FU #(.BITSIZE_in1(32), .BITSIZE_in2(32), .BITSIZE_out1(32), .PRECISION(32)) ui_rshift_expr_FU_32_32_32_90_i0 (.out1(out_ui_rshift_expr_FU_32_32_32_90_i0_ui_rshift_expr_FU_32_32_32_90_i0), .in1(out_reg_18_reg_18), .in2(out_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0));
  // io-signal post fix
  assign return_port = out_conv_out_const_0_1_32;
  assign OUT_CONDITION_main_419532_420274 = out_read_cond_FU_14_i0_fu_main_419532_420274;
  assign OUT_CONDITION_main_419532_421537 = out_read_cond_FU_58_i0_fu_main_419532_421537;
  assign OUT_MULTIIF_main_419532_421597 = out_multi_read_cond_FU_48_i0_fu_main_419532_421597;
  assign OUT_UNBOUNDED_main_419532_420319 = s_done_fu_main_419532_420319;

endmodule

// FSM based controller description for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_main(done_port, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD, fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE, selector_IN_UNBOUNDED_main_419532_420319, selector_MUX_168_reg_0_0_0_0, selector_MUX_173_reg_13_0_0_0, selector_MUX_187_reg_26_0_0_0, selector_MUX_187_reg_26_0_0_1, selector_MUX_187_reg_26_0_0_2, selector_MUX_187_reg_26_0_0_3, selector_MUX_187_reg_26_0_0_4, selector_MUX_187_reg_26_0_1_0, selector_MUX_187_reg_26_0_1_1, selector_MUX_187_reg_26_0_1_2, selector_MUX_187_reg_26_0_2_0, selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0, selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0, selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0, selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0, wrenable_reg_0, wrenable_reg_1, wrenable_reg_10, wrenable_reg_11, wrenable_reg_12, wrenable_reg_13, wrenable_reg_14, wrenable_reg_15, wrenable_reg_16, wrenable_reg_17, wrenable_reg_18, wrenable_reg_19, wrenable_reg_2, wrenable_reg_20, wrenable_reg_21, wrenable_reg_22, wrenable_reg_23, wrenable_reg_24, wrenable_reg_25, wrenable_reg_26, wrenable_reg_3, wrenable_reg_4, wrenable_reg_5, wrenable_reg_6, wrenable_reg_7, wrenable_reg_8, wrenable_reg_9, OUT_CONDITION_main_419532_420274, OUT_CONDITION_main_419532_421537, OUT_MULTIIF_main_419532_421597, OUT_UNBOUNDED_main_419532_420319, clock, reset, start_port);
  // IN
  input OUT_CONDITION_main_419532_420274;
  input OUT_CONDITION_main_419532_421537;
  input [12:0] OUT_MULTIIF_main_419532_421597;
  input OUT_UNBOUNDED_main_419532_420319;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD;
  output fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  output selector_IN_UNBOUNDED_main_419532_420319;
  output selector_MUX_168_reg_0_0_0_0;
  output selector_MUX_173_reg_13_0_0_0;
  output selector_MUX_187_reg_26_0_0_0;
  output selector_MUX_187_reg_26_0_0_1;
  output selector_MUX_187_reg_26_0_0_2;
  output selector_MUX_187_reg_26_0_0_3;
  output selector_MUX_187_reg_26_0_0_4;
  output selector_MUX_187_reg_26_0_1_0;
  output selector_MUX_187_reg_26_0_1_1;
  output selector_MUX_187_reg_26_0_1_2;
  output selector_MUX_187_reg_26_0_2_0;
  output selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0;
  output selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0;
  output selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0;
  output selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_3;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [21:0] S_6 = 22'b0000000000000001000000,
    S_0 = 22'b0000000000000000000001,
    S_1 = 22'b0000000000000000000010,
    S_2 = 22'b0000000000000000000100,
    S_3 = 22'b0000000000000000001000,
    S_4 = 22'b0000000000000000010000,
    S_5 = 22'b0000000000000000100000,
    S_19 = 22'b0010000000000000000000,
    S_18 = 22'b0001000000000000000000,
    S_17 = 22'b0000100000000000000000,
    S_16 = 22'b0000010000000000000000,
    S_15 = 22'b0000001000000000000000,
    S_14 = 22'b0000000100000000000000,
    S_13 = 22'b0000000010000000000000,
    S_12 = 22'b0000000001000000000000,
    S_11 = 22'b0000000000100000000000,
    S_10 = 22'b0000000000010000000000,
    S_9 = 22'b0000000000001000000000,
    S_8 = 22'b0000000000000100000000,
    S_7 = 22'b0000000000000010000000,
    S_20 = 22'b0100000000000000000000,
    S_21 = 22'b1000000000000000000000;
  reg [21:0] _present_state, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  reg selector_IN_UNBOUNDED_main_419532_420319;
  reg selector_MUX_168_reg_0_0_0_0;
  reg selector_MUX_173_reg_13_0_0_0;
  reg selector_MUX_187_reg_26_0_0_0;
  reg selector_MUX_187_reg_26_0_0_1;
  reg selector_MUX_187_reg_26_0_0_2;
  reg selector_MUX_187_reg_26_0_0_3;
  reg selector_MUX_187_reg_26_0_0_4;
  reg selector_MUX_187_reg_26_0_1_0;
  reg selector_MUX_187_reg_26_0_1_1;
  reg selector_MUX_187_reg_26_0_1_2;
  reg selector_MUX_187_reg_26_0_2_0;
  reg selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0;
  reg selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0;
  reg selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0;
  reg selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_3;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_6;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE = 1'b0;
    selector_IN_UNBOUNDED_main_419532_420319 = 1'b0;
    selector_MUX_168_reg_0_0_0_0 = 1'b0;
    selector_MUX_173_reg_13_0_0_0 = 1'b0;
    selector_MUX_187_reg_26_0_0_0 = 1'b0;
    selector_MUX_187_reg_26_0_0_1 = 1'b0;
    selector_MUX_187_reg_26_0_0_2 = 1'b0;
    selector_MUX_187_reg_26_0_0_3 = 1'b0;
    selector_MUX_187_reg_26_0_0_4 = 1'b0;
    selector_MUX_187_reg_26_0_1_0 = 1'b0;
    selector_MUX_187_reg_26_0_1_1 = 1'b0;
    selector_MUX_187_reg_26_0_1_2 = 1'b0;
    selector_MUX_187_reg_26_0_2_0 = 1'b0;
    selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0 = 1'b0;
    selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0 = 1'b0;
    selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0 = 1'b0;
    selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_6 :
        if(start_port == 1'b1)
        begin
          selector_MUX_168_reg_0_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_3 = 1'b1;
          _next_state = S_0;
        end
        else
        begin
          selector_MUX_168_reg_0_0_0_0 = 1'bX;
          selector_MUX_173_reg_13_0_0_0 = 1'bX;
          selector_MUX_187_reg_26_0_0_0 = 1'bX;
          selector_MUX_187_reg_26_0_0_1 = 1'bX;
          selector_MUX_187_reg_26_0_0_2 = 1'bX;
          selector_MUX_187_reg_26_0_0_3 = 1'bX;
          selector_MUX_187_reg_26_0_0_4 = 1'bX;
          selector_MUX_187_reg_26_0_1_0 = 1'bX;
          selector_MUX_187_reg_26_0_1_1 = 1'bX;
          selector_MUX_187_reg_26_0_1_2 = 1'bX;
          selector_MUX_187_reg_26_0_2_0 = 1'bX;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0 = 1'bX;
          selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0 = 1'bX;
          selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0 = 1'bX;
          selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_10 = 1'bX;
          wrenable_reg_11 = 1'bX;
          wrenable_reg_12 = 1'bX;
          wrenable_reg_13 = 1'bX;
          wrenable_reg_14 = 1'bX;
          wrenable_reg_15 = 1'bX;
          wrenable_reg_16 = 1'bX;
          wrenable_reg_17 = 1'bX;
          wrenable_reg_18 = 1'bX;
          wrenable_reg_19 = 1'bX;
          wrenable_reg_2 = 1'bX;
          wrenable_reg_20 = 1'bX;
          wrenable_reg_21 = 1'bX;
          wrenable_reg_22 = 1'bX;
          wrenable_reg_23 = 1'bX;
          wrenable_reg_24 = 1'bX;
          wrenable_reg_25 = 1'bX;
          wrenable_reg_26 = 1'bX;
          wrenable_reg_3 = 1'bX;
          wrenable_reg_4 = 1'bX;
          wrenable_reg_5 = 1'bX;
          wrenable_reg_6 = 1'bX;
          wrenable_reg_7 = 1'bX;
          wrenable_reg_8 = 1'bX;
          wrenable_reg_9 = 1'bX;
          _next_state = S_6;
        end
      S_0 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE = 1'b1;
          selector_MUX_173_reg_13_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_13 = 1'b1;
          if (OUT_CONDITION_main_419532_420274 == 1'b1)
            begin
              _next_state = S_0;
              selector_MUX_173_reg_13_0_0_0 = 1'b0;
              wrenable_reg_13 = 1'b0;
            end
          else
            begin
              _next_state = S_1;
              wrenable_reg_0 = 1'b0;
            end
        end
      S_1 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_2;
        end
      S_2 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD = 1'b1;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0 = 1'b1;
          selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          selector_IN_UNBOUNDED_main_419532_420319 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          if (OUT_UNBOUNDED_main_419532_420319 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_4 :
        begin
          wrenable_reg_19 = 1'b1;
          if (OUT_UNBOUNDED_main_419532_420319 == 1'b0)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_5;
            end
        end
      S_5 :
        begin
          selector_MUX_187_reg_26_0_0_2 = 1'b1;
          selector_MUX_187_reg_26_0_1_1 = 1'b1;
          selector_MUX_187_reg_26_0_2_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          if (OUT_MULTIIF_main_419532_421597[12] == 1'b1)
            begin
              _next_state = S_7;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[11] == 1'b1)
            begin
              _next_state = S_8;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[10] == 1'b1)
            begin
              _next_state = S_9;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[9] == 1'b1)
            begin
              _next_state = S_10;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[8] == 1'b1)
            begin
              _next_state = S_11;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[7] == 1'b1)
            begin
              _next_state = S_12;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[6] == 1'b1)
            begin
              _next_state = S_13;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[5] == 1'b1)
            begin
              _next_state = S_14;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[4] == 1'b1)
            begin
              _next_state = S_15;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[3] == 1'b1)
            begin
              _next_state = S_16;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[2] == 1'b1)
            begin
              _next_state = S_17;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[1] == 1'b1)
            begin
              _next_state = S_18;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else if (OUT_MULTIIF_main_419532_421597[0] == 1'b1)
            begin
              _next_state = S_19;
              selector_MUX_187_reg_26_0_0_2 = 1'b0;
              selector_MUX_187_reg_26_0_1_1 = 1'b0;
              selector_MUX_187_reg_26_0_2_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
            end
          else
            begin
              _next_state = S_20;
            end
        end
      S_19 :
        begin
          selector_MUX_187_reg_26_0_0_4 = 1'b1;
          selector_MUX_187_reg_26_0_1_2 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_18 :
        begin
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_17 :
        begin
          selector_MUX_187_reg_26_0_2_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_16 :
        begin
          selector_MUX_187_reg_26_0_1_1 = 1'b1;
          selector_MUX_187_reg_26_0_2_0 = 1'b1;
          selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_15 :
        begin
          selector_MUX_187_reg_26_0_1_1 = 1'b1;
          selector_MUX_187_reg_26_0_2_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_14 :
        begin
          selector_MUX_187_reg_26_0_1_2 = 1'b1;
          selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_13 :
        begin
          selector_MUX_187_reg_26_0_1_2 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_12 :
        begin
          selector_MUX_187_reg_26_0_0_0 = 1'b1;
          selector_MUX_187_reg_26_0_1_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_11 :
        begin
          selector_MUX_187_reg_26_0_1_2 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_10 :
        begin
          selector_MUX_187_reg_26_0_1_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_9 :
        begin
          selector_MUX_187_reg_26_0_0_1 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_8 :
        begin
          selector_MUX_187_reg_26_0_0_3 = 1'b1;
          selector_MUX_187_reg_26_0_2_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_7 :
        begin
          selector_MUX_187_reg_26_0_0_4 = 1'b1;
          selector_MUX_187_reg_26_0_1_2 = 1'b1;
          wrenable_reg_26 = 1'b1;
          _next_state = S_20;
        end
      S_20 :
        begin
          fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE = 1'b1;
          if (OUT_CONDITION_main_419532_421537 == 1'b1)
            begin
              _next_state = S_21;
              done_port = 1'b1;
            end
          else
            begin
              _next_state = S_1;
            end
        end
      S_21 :
        begin
          _next_state = S_6;
        end
      default :
        begin
          _next_state = S_6;
          selector_MUX_168_reg_0_0_0_0 = 1'bX;
          selector_MUX_173_reg_13_0_0_0 = 1'bX;
          selector_MUX_187_reg_26_0_0_0 = 1'bX;
          selector_MUX_187_reg_26_0_0_1 = 1'bX;
          selector_MUX_187_reg_26_0_0_2 = 1'bX;
          selector_MUX_187_reg_26_0_0_3 = 1'bX;
          selector_MUX_187_reg_26_0_0_4 = 1'bX;
          selector_MUX_187_reg_26_0_1_0 = 1'bX;
          selector_MUX_187_reg_26_0_1_1 = 1'bX;
          selector_MUX_187_reg_26_0_1_2 = 1'bX;
          selector_MUX_187_reg_26_0_2_0 = 1'bX;
          selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0 = 1'bX;
          selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0 = 1'bX;
          selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0 = 1'bX;
          selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0 = 1'bX;
          wrenable_reg_0 = 1'bX;
          wrenable_reg_1 = 1'bX;
          wrenable_reg_10 = 1'bX;
          wrenable_reg_11 = 1'bX;
          wrenable_reg_12 = 1'bX;
          wrenable_reg_13 = 1'bX;
          wrenable_reg_14 = 1'bX;
          wrenable_reg_15 = 1'bX;
          wrenable_reg_16 = 1'bX;
          wrenable_reg_17 = 1'bX;
          wrenable_reg_18 = 1'bX;
          wrenable_reg_19 = 1'bX;
          wrenable_reg_2 = 1'bX;
          wrenable_reg_20 = 1'bX;
          wrenable_reg_21 = 1'bX;
          wrenable_reg_22 = 1'bX;
          wrenable_reg_23 = 1'bX;
          wrenable_reg_24 = 1'bX;
          wrenable_reg_25 = 1'bX;
          wrenable_reg_26 = 1'bX;
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

// Top component for main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _main(clock, reset, start_port, done_port, return_port);
  parameter MEM_var_419652_419512=4096, MEM_var_419678_419512=4096, MEM_var_420284_419532=4096, MEM_var_420408_419532=4096;
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire OUT_CONDITION_main_419532_420274;
  wire OUT_CONDITION_main_419532_421537;
  wire [12:0] OUT_MULTIIF_main_419532_421597;
  wire OUT_UNBOUNDED_main_419532_420319;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  wire selector_IN_UNBOUNDED_main_419532_420319;
  wire selector_MUX_168_reg_0_0_0_0;
  wire selector_MUX_173_reg_13_0_0_0;
  wire selector_MUX_187_reg_26_0_0_0;
  wire selector_MUX_187_reg_26_0_0_1;
  wire selector_MUX_187_reg_26_0_0_2;
  wire selector_MUX_187_reg_26_0_0_3;
  wire selector_MUX_187_reg_26_0_0_4;
  wire selector_MUX_187_reg_26_0_1_0;
  wire selector_MUX_187_reg_26_0_1_1;
  wire selector_MUX_187_reg_26_0_1_2;
  wire selector_MUX_187_reg_26_0_2_0;
  wire selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0;
  wire selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0;
  wire selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0;
  wire selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_3;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_main Controller_i (.done_port(done_delayed_REG_signal_in), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE), .selector_IN_UNBOUNDED_main_419532_420319(selector_IN_UNBOUNDED_main_419532_420319), .selector_MUX_168_reg_0_0_0_0(selector_MUX_168_reg_0_0_0_0), .selector_MUX_173_reg_13_0_0_0(selector_MUX_173_reg_13_0_0_0), .selector_MUX_187_reg_26_0_0_0(selector_MUX_187_reg_26_0_0_0), .selector_MUX_187_reg_26_0_0_1(selector_MUX_187_reg_26_0_0_1), .selector_MUX_187_reg_26_0_0_2(selector_MUX_187_reg_26_0_0_2), .selector_MUX_187_reg_26_0_0_3(selector_MUX_187_reg_26_0_0_3), .selector_MUX_187_reg_26_0_0_4(selector_MUX_187_reg_26_0_0_4), .selector_MUX_187_reg_26_0_1_0(selector_MUX_187_reg_26_0_1_0), .selector_MUX_187_reg_26_0_1_1(selector_MUX_187_reg_26_0_1_1), .selector_MUX_187_reg_26_0_1_2(selector_MUX_187_reg_26_0_1_2), .selector_MUX_187_reg_26_0_2_0(selector_MUX_187_reg_26_0_2_0), .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0), .selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0(selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0), .selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0(selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0), .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_10(wrenable_reg_10), .wrenable_reg_11(wrenable_reg_11), .wrenable_reg_12(wrenable_reg_12), .wrenable_reg_13(wrenable_reg_13), .wrenable_reg_14(wrenable_reg_14), .wrenable_reg_15(wrenable_reg_15), .wrenable_reg_16(wrenable_reg_16), .wrenable_reg_17(wrenable_reg_17), .wrenable_reg_18(wrenable_reg_18), .wrenable_reg_19(wrenable_reg_19), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_20(wrenable_reg_20), .wrenable_reg_21(wrenable_reg_21), .wrenable_reg_22(wrenable_reg_22), .wrenable_reg_23(wrenable_reg_23), .wrenable_reg_24(wrenable_reg_24), .wrenable_reg_25(wrenable_reg_25), .wrenable_reg_26(wrenable_reg_26), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6), .wrenable_reg_7(wrenable_reg_7), .wrenable_reg_8(wrenable_reg_8), .wrenable_reg_9(wrenable_reg_9), .OUT_CONDITION_main_419532_420274(OUT_CONDITION_main_419532_420274), .OUT_CONDITION_main_419532_421537(OUT_CONDITION_main_419532_421537), .OUT_MULTIIF_main_419532_421597(OUT_MULTIIF_main_419532_421597), .OUT_UNBOUNDED_main_419532_420319(OUT_UNBOUNDED_main_419532_420319), .clock(clock), .reset(reset), .start_port(start_port));
  datapath_main #(.MEM_var_419652_419512(MEM_var_419652_419512), .MEM_var_419678_419512(MEM_var_419678_419512), .MEM_var_420284_419532(MEM_var_420284_419532), .MEM_var_420408_419532(MEM_var_420408_419532)) Datapath_i (.return_port(return_port), .OUT_CONDITION_main_419532_420274(OUT_CONDITION_main_419532_420274), .OUT_CONDITION_main_419532_421537(OUT_CONDITION_main_419532_421537), .OUT_MULTIIF_main_419532_421597(OUT_MULTIIF_main_419532_421597), .OUT_UNBOUNDED_main_419532_420319(OUT_UNBOUNDED_main_419532_420319), .clock(clock), .reset(reset), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_STORE), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_LOAD), .fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE(fuselector_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_STORE), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD), .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE), .selector_IN_UNBOUNDED_main_419532_420319(selector_IN_UNBOUNDED_main_419532_420319), .selector_MUX_168_reg_0_0_0_0(selector_MUX_168_reg_0_0_0_0), .selector_MUX_173_reg_13_0_0_0(selector_MUX_173_reg_13_0_0_0), .selector_MUX_187_reg_26_0_0_0(selector_MUX_187_reg_26_0_0_0), .selector_MUX_187_reg_26_0_0_1(selector_MUX_187_reg_26_0_0_1), .selector_MUX_187_reg_26_0_0_2(selector_MUX_187_reg_26_0_0_2), .selector_MUX_187_reg_26_0_0_3(selector_MUX_187_reg_26_0_0_3), .selector_MUX_187_reg_26_0_0_4(selector_MUX_187_reg_26_0_0_4), .selector_MUX_187_reg_26_0_1_0(selector_MUX_187_reg_26_0_1_0), .selector_MUX_187_reg_26_0_1_1(selector_MUX_187_reg_26_0_1_1), .selector_MUX_187_reg_26_0_1_2(selector_MUX_187_reg_26_0_1_2), .selector_MUX_187_reg_26_0_2_0(selector_MUX_187_reg_26_0_2_0), .selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0(selector_MUX_1_ARRAY_1D_STD_BRAM_NN_SDS_0_i0_1_0_0), .selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0(selector_MUX_277_ui_lshift_expr_FU_32_32_32_76_i0_1_0_0), .selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0(selector_MUX_323_ui_rshift_expr_FU_32_32_32_90_i0_1_0_0), .selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0(selector_MUX_5_ARRAY_1D_STD_BRAM_NN_SDS_0_i1_1_0_0), .wrenable_reg_0(wrenable_reg_0), .wrenable_reg_1(wrenable_reg_1), .wrenable_reg_10(wrenable_reg_10), .wrenable_reg_11(wrenable_reg_11), .wrenable_reg_12(wrenable_reg_12), .wrenable_reg_13(wrenable_reg_13), .wrenable_reg_14(wrenable_reg_14), .wrenable_reg_15(wrenable_reg_15), .wrenable_reg_16(wrenable_reg_16), .wrenable_reg_17(wrenable_reg_17), .wrenable_reg_18(wrenable_reg_18), .wrenable_reg_19(wrenable_reg_19), .wrenable_reg_2(wrenable_reg_2), .wrenable_reg_20(wrenable_reg_20), .wrenable_reg_21(wrenable_reg_21), .wrenable_reg_22(wrenable_reg_22), .wrenable_reg_23(wrenable_reg_23), .wrenable_reg_24(wrenable_reg_24), .wrenable_reg_25(wrenable_reg_25), .wrenable_reg_26(wrenable_reg_26), .wrenable_reg_3(wrenable_reg_3), .wrenable_reg_4(wrenable_reg_4), .wrenable_reg_5(wrenable_reg_5), .wrenable_reg_6(wrenable_reg_6), .wrenable_reg_7(wrenable_reg_7), .wrenable_reg_8(wrenable_reg_8), .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1), .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out), .clock(clock), .reset(reset), .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: main
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module main(clock, reset, start_port, done_port, return_port);
  parameter MEM_var_419652_419512=4096, MEM_var_419678_419512=4096, MEM_var_420284_419532=4096, MEM_var_420408_419532=4096;
  // IN
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire [31:0] out_return_port_ui_view_convert_expr_FU;
  
  _main #(.MEM_var_419652_419512(MEM_var_419652_419512), .MEM_var_419678_419512(MEM_var_419678_419512), .MEM_var_420284_419532(MEM_var_420284_419532), .MEM_var_420408_419532(MEM_var_420408_419532)) _main_i0 (.done_port(done_port), .return_port(out_return_port_ui_view_convert_expr_FU), .clock(clock), .reset(reset), .start_port(start_port));
  ui_view_convert_expr_FU #(.BITSIZE_in1(32), .BITSIZE_out1(32)) return_port_ui_view_convert_expr_FU (.out1(return_port), .in1(out_return_port_ui_view_convert_expr_FU));

endmodule


