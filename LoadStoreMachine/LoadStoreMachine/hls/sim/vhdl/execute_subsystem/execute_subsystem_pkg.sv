//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef EXECUTE_SUBSYSTEM_PKG__SV          
    `define EXECUTE_SUBSYSTEM_PKG__SV      
                                                     
    package execute_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "execute_config.sv"           
        `include "execute_reference_model.sv"  
        `include "execute_scoreboard.sv"       
        `include "execute_subsystem_monitor.sv"
        `include "execute_virtual_sequencer.sv"
        `include "execute_pkg_sequence_lib.sv" 
        `include "execute_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               
