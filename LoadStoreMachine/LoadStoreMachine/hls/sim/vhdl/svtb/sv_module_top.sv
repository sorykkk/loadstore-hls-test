//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef SV_MODULE_TOP_SV
`define SV_MODULE_TOP_SV


`timescale 1ns/1ps


`include "uvm_macros.svh"
import uvm_pkg::*;
import file_agent_pkg::*;
import svr_pkg::*;
import execute_subsystem_pkg::*;
`include "execute_subsys_test_sequence_lib.sv"
`include "execute_test_lib.sv"


module sv_module_top;


    misc_interface              misc_if ( .clock(apatb_execute_top.AESL_clock), .reset(apatb_execute_top.AESL_reset) );
    assign apatb_execute_top.ap_start = misc_if.tb2dut_ap_start;
    assign misc_if.dut2tb_ap_done = apatb_execute_top.ap_done;
    assign misc_if.dut2tb_ap_ready = apatb_execute_top.ap_ready;
    initial begin
        uvm_config_db #(virtual misc_interface)::set(null, "uvm_test_top.top_env.*", "misc_if", misc_if);
    end


    svr_if #(4)  svr_opcode_if    (.clk  (apatb_execute_top.AESL_clock), .rst(apatb_execute_top.AESL_reset));
    assign apatb_execute_top.opcode = svr_opcode_if.data[3:0];
    assign svr_opcode_if.ready = svr_opcode_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(4) )::set(null, "uvm_test_top.top_env.env_master_svr_opcode.*", "vif", svr_opcode_if);
    end


    svr_if #(5)  svr_ra_addr_if    (.clk  (apatb_execute_top.AESL_clock), .rst(apatb_execute_top.AESL_reset));
    assign apatb_execute_top.ra_addr = svr_ra_addr_if.data[4:0];
    assign svr_ra_addr_if.ready = svr_ra_addr_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(5) )::set(null, "uvm_test_top.top_env.env_master_svr_ra_addr.*", "vif", svr_ra_addr_if);
    end


    svr_if #(5)  svr_rb_addr_if    (.clk  (apatb_execute_top.AESL_clock), .rst(apatb_execute_top.AESL_reset));
    assign apatb_execute_top.rb_addr = svr_rb_addr_if.data[4:0];
    assign svr_rb_addr_if.ready = svr_rb_addr_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(5) )::set(null, "uvm_test_top.top_env.env_master_svr_rb_addr.*", "vif", svr_rb_addr_if);
    end


    svr_if #(5)  svr_rc_addr_if    (.clk  (apatb_execute_top.AESL_clock), .rst(apatb_execute_top.AESL_reset));
    assign apatb_execute_top.rc_addr = svr_rc_addr_if.data[4:0];
    assign svr_rc_addr_if.ready = svr_rc_addr_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(5) )::set(null, "uvm_test_top.top_env.env_master_svr_rc_addr.*", "vif", svr_rc_addr_if);
    end


    svr_if #(32)  svr_imd_data_if    (.clk  (apatb_execute_top.AESL_clock), .rst(apatb_execute_top.AESL_reset));
    assign apatb_execute_top.imd_data = svr_imd_data_if.data[31:0];
    assign svr_imd_data_if.ready = svr_imd_data_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(32) )::set(null, "uvm_test_top.top_env.env_master_svr_imd_data.*", "vif", svr_imd_data_if);
    end


    svr_if #(32)  svr_ap_return_if    (.clk  (apatb_execute_top.AESL_clock), .rst(apatb_execute_top.AESL_reset));
    assign svr_ap_return_if.data[31:0] = apatb_execute_top.ap_return;
    assign svr_ap_return_if.valid = misc_if.dut2tb_ap_done;
    assign svr_ap_return_if.ready = misc_if.dut2tb_ap_done;
    initial begin
        uvm_config_db #( virtual svr_if#(32) )::set(null, "uvm_test_top.top_env.env_slave_svr_ap_return.*", "vif", svr_ap_return_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif
