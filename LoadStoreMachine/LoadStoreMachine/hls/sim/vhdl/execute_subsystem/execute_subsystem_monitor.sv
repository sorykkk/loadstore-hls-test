//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef EXECUTE_SUBSYSTEM_MONITOR_SV
`define EXECUTE_SUBSYSTEM_MONITOR_SV

`uvm_analysis_imp_decl(_svr_master_opcode)
`uvm_analysis_imp_decl(_svr_master_ra_addr)
`uvm_analysis_imp_decl(_svr_master_rb_addr)
`uvm_analysis_imp_decl(_svr_master_rc_addr)
`uvm_analysis_imp_decl(_svr_master_imd_data)
`uvm_analysis_imp_decl(_svr_slave_ap_return)

class execute_subsystem_monitor extends uvm_component;

    execute_reference_model refm;
    execute_scoreboard scbd;

    `uvm_component_utils_begin(execute_subsystem_monitor)
    `uvm_component_utils_end

    uvm_analysis_imp_svr_master_opcode#(svr_pkg::svr_transfer#(4), execute_subsystem_monitor) svr_master_opcode_imp;
    uvm_analysis_imp_svr_master_ra_addr#(svr_pkg::svr_transfer#(5), execute_subsystem_monitor) svr_master_ra_addr_imp;
    uvm_analysis_imp_svr_master_rb_addr#(svr_pkg::svr_transfer#(5), execute_subsystem_monitor) svr_master_rb_addr_imp;
    uvm_analysis_imp_svr_master_rc_addr#(svr_pkg::svr_transfer#(5), execute_subsystem_monitor) svr_master_rc_addr_imp;
    uvm_analysis_imp_svr_master_imd_data#(svr_pkg::svr_transfer#(32), execute_subsystem_monitor) svr_master_imd_data_imp;
    uvm_analysis_imp_svr_slave_ap_return#(svr_pkg::svr_transfer#(32), execute_subsystem_monitor) svr_slave_ap_return_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(execute_reference_model)::get(this, "", "refm", refm))
            `uvm_fatal(this.get_full_name(), "No refm from high level")
        `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM)
        scbd = execute_scoreboard::type_id::create("scbd", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new(name, parent);
        svr_master_opcode_imp = new("svr_master_opcode_imp", this);
        svr_master_ra_addr_imp = new("svr_master_ra_addr_imp", this);
        svr_master_rb_addr_imp = new("svr_master_rb_addr_imp", this);
        svr_master_rc_addr_imp = new("svr_master_rc_addr_imp", this);
        svr_master_imd_data_imp = new("svr_master_imd_data_imp", this);
        svr_slave_ap_return_imp = new("svr_slave_ap_return_imp", this);
    endfunction

    virtual function void write_svr_master_opcode(svr_transfer#(4) tr);
        refm.write_svr_master_opcode(tr);
        scbd.write_svr_master_opcode(tr);
    endfunction

    virtual function void write_svr_master_ra_addr(svr_transfer#(5) tr);
        refm.write_svr_master_ra_addr(tr);
        scbd.write_svr_master_ra_addr(tr);
    endfunction

    virtual function void write_svr_master_rb_addr(svr_transfer#(5) tr);
        refm.write_svr_master_rb_addr(tr);
        scbd.write_svr_master_rb_addr(tr);
    endfunction

    virtual function void write_svr_master_rc_addr(svr_transfer#(5) tr);
        refm.write_svr_master_rc_addr(tr);
        scbd.write_svr_master_rc_addr(tr);
    endfunction

    virtual function void write_svr_master_imd_data(svr_transfer#(32) tr);
        refm.write_svr_master_imd_data(tr);
        scbd.write_svr_master_imd_data(tr);
    endfunction

    virtual function void write_svr_slave_ap_return(svr_transfer#(32) tr);
        refm.write_svr_slave_ap_return(tr);
        scbd.write_svr_slave_ap_return(tr);
    endfunction
endclass
`endif
