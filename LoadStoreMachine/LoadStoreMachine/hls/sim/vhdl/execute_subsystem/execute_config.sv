//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef EXECUTE_CONFIG__SV                        
    `define EXECUTE_CONFIG__SV                    
                                                            
    class execute_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_opcode_cfg;
        svr_pkg::svr_config port_ra_addr_cfg;
        svr_pkg::svr_config port_rb_addr_cfg;
        svr_pkg::svr_config port_rc_addr_cfg;
        svr_pkg::svr_config port_imd_data_cfg;
        svr_pkg::svr_config port_ap_return_cfg;

        `uvm_object_utils_begin(execute_config)         
        `uvm_field_object(port_opcode_cfg, UVM_DEFAULT)
        `uvm_field_object(port_ra_addr_cfg, UVM_DEFAULT)
        `uvm_field_object(port_rb_addr_cfg, UVM_DEFAULT)
        `uvm_field_object(port_rc_addr_cfg, UVM_DEFAULT)
        `uvm_field_object(port_imd_data_cfg, UVM_DEFAULT)
        `uvm_field_object(port_ap_return_cfg, UVM_DEFAULT)
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "execute_config");
            super.new(name);                                
            port_opcode_cfg = svr_pkg::svr_config::type_id::create("port_opcode_cfg");
            port_ra_addr_cfg = svr_pkg::svr_config::type_id::create("port_ra_addr_cfg");
            port_rb_addr_cfg = svr_pkg::svr_config::type_id::create("port_rb_addr_cfg");
            port_rc_addr_cfg = svr_pkg::svr_config::type_id::create("port_rc_addr_cfg");
            port_imd_data_cfg = svr_pkg::svr_config::type_id::create("port_imd_data_cfg");
            port_ap_return_cfg = svr_pkg::svr_config::type_id::create("port_ap_return_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      
