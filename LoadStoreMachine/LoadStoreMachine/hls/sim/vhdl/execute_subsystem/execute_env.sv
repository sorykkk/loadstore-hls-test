//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef EXECUTE_ENV__SV                                                                                   
    `define EXECUTE_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class execute_env extends uvm_env;                                                                          
                                                                                                                    
        execute_virtual_sequencer execute_virtual_sqr;                                                      
        execute_config execute_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(4) env_master_svr_opcode;
        svr_pkg::svr_env#(5) env_master_svr_ra_addr;
        svr_pkg::svr_env#(5) env_master_svr_rb_addr;
        svr_pkg::svr_env#(5) env_master_svr_rc_addr;
        svr_pkg::svr_env#(32) env_master_svr_imd_data;
        svr_pkg::svr_env#(32) env_slave_svr_ap_return;
                                                                                                                    
        execute_reference_model   refm;                                                                         
                                                                                                                    
        execute_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(execute_env)                                                                 
        `uvm_field_object (env_master_svr_opcode,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_master_svr_ra_addr,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_master_svr_rb_addr,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_master_svr_rc_addr,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_master_svr_imd_data,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_slave_svr_ap_return,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (execute_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (execute_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "execute_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void execute_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        execute_cfg = execute_config::type_id::create("execute_cfg", this);                           
                                                                                                                    
        execute_cfg.port_opcode_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_opcode  = svr_env#(4)::type_id::create("env_master_svr_opcode", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_opcode*", "cfg", execute_cfg.port_opcode_cfg);
        execute_cfg.port_opcode_cfg.prt_type = svr_pkg::AP_NONE;
        execute_cfg.port_opcode_cfg.is_active = svr_pkg::SVR_ACTIVE;
        execute_cfg.port_opcode_cfg.spec_cfg = svr_pkg::NORMAL;
        execute_cfg.port_opcode_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        execute_cfg.port_ra_addr_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_ra_addr  = svr_env#(5)::type_id::create("env_master_svr_ra_addr", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_ra_addr*", "cfg", execute_cfg.port_ra_addr_cfg);
        execute_cfg.port_ra_addr_cfg.prt_type = svr_pkg::AP_NONE;
        execute_cfg.port_ra_addr_cfg.is_active = svr_pkg::SVR_ACTIVE;
        execute_cfg.port_ra_addr_cfg.spec_cfg = svr_pkg::NORMAL;
        execute_cfg.port_ra_addr_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        execute_cfg.port_rb_addr_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_rb_addr  = svr_env#(5)::type_id::create("env_master_svr_rb_addr", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_rb_addr*", "cfg", execute_cfg.port_rb_addr_cfg);
        execute_cfg.port_rb_addr_cfg.prt_type = svr_pkg::AP_NONE;
        execute_cfg.port_rb_addr_cfg.is_active = svr_pkg::SVR_ACTIVE;
        execute_cfg.port_rb_addr_cfg.spec_cfg = svr_pkg::NORMAL;
        execute_cfg.port_rb_addr_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        execute_cfg.port_rc_addr_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_rc_addr  = svr_env#(5)::type_id::create("env_master_svr_rc_addr", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_rc_addr*", "cfg", execute_cfg.port_rc_addr_cfg);
        execute_cfg.port_rc_addr_cfg.prt_type = svr_pkg::AP_NONE;
        execute_cfg.port_rc_addr_cfg.is_active = svr_pkg::SVR_ACTIVE;
        execute_cfg.port_rc_addr_cfg.spec_cfg = svr_pkg::NORMAL;
        execute_cfg.port_rc_addr_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        execute_cfg.port_imd_data_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_imd_data  = svr_env#(32)::type_id::create("env_master_svr_imd_data", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_imd_data*", "cfg", execute_cfg.port_imd_data_cfg);
        execute_cfg.port_imd_data_cfg.prt_type = svr_pkg::AP_NONE;
        execute_cfg.port_imd_data_cfg.is_active = svr_pkg::SVR_ACTIVE;
        execute_cfg.port_imd_data_cfg.spec_cfg = svr_pkg::NORMAL;
        execute_cfg.port_imd_data_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        execute_cfg.port_ap_return_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_ap_return  = svr_env#(32)::type_id::create("env_slave_svr_ap_return", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_ap_return*", "cfg", execute_cfg.port_ap_return_cfg);
        execute_cfg.port_ap_return_cfg.prt_type = svr_pkg::AP_NONE;
        execute_cfg.port_ap_return_cfg.is_active = svr_pkg::SVR_ACTIVE;
        execute_cfg.port_ap_return_cfg.spec_cfg = svr_pkg::NORMAL;
        execute_cfg.port_ap_return_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 



        refm = execute_reference_model::type_id::create("refm", this);


        uvm_config_db#(execute_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = execute_subsystem_monitor::type_id::create("subsys_mon", this);


        execute_virtual_sqr = execute_virtual_sequencer::type_id::create("execute_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void execute_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        execute_virtual_sqr.svr_port_opcode_sqr = env_master_svr_opcode.m_agt.sqr;
        env_master_svr_opcode.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_opcode_imp);
 
        execute_virtual_sqr.svr_port_ra_addr_sqr = env_master_svr_ra_addr.m_agt.sqr;
        env_master_svr_ra_addr.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_ra_addr_imp);
 
        execute_virtual_sqr.svr_port_rb_addr_sqr = env_master_svr_rb_addr.m_agt.sqr;
        env_master_svr_rb_addr.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_rb_addr_imp);
 
        execute_virtual_sqr.svr_port_rc_addr_sqr = env_master_svr_rc_addr.m_agt.sqr;
        env_master_svr_rc_addr.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_rc_addr_imp);
 
        execute_virtual_sqr.svr_port_imd_data_sqr = env_master_svr_imd_data.m_agt.sqr;
        env_master_svr_imd_data.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_imd_data_imp);
 
        execute_virtual_sqr.svr_port_ap_return_sqr = env_slave_svr_ap_return.s_agt.sqr;
        env_slave_svr_ap_return.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_ap_return_imp);
 
        refm.execute_cfg = execute_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task execute_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "execute_env is running", UVM_LOW)
    endtask


`endif
