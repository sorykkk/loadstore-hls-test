//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
//Tool Version Limit: 2025.05
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef EXECUTE_SUBSYS_TEST_SEQUENCE_LIB__SV                                              
    `define EXECUTE_SUBSYS_TEST_SEQUENCE_LIB__SV                                          
                                                                                                    
    `define AUTOTB_TVIN_opcode_opcode  "../tv/cdatafile/c.execute.autotvin_opcode.dat" 
    `define AUTOTB_TVIN_ra_addr_ra_addr  "../tv/cdatafile/c.execute.autotvin_ra_addr.dat" 
    `define AUTOTB_TVIN_rb_addr_rb_addr  "../tv/cdatafile/c.execute.autotvin_rb_addr.dat" 
    `define AUTOTB_TVIN_rc_addr_rc_addr  "../tv/cdatafile/c.execute.autotvin_rc_addr.dat" 
    `define AUTOTB_TVIN_imd_data_imd_data  "../tv/cdatafile/c.execute.autotvin_imd_data.dat" 
                                                                                                    
    `include "uvm_macros.svh"                                                                     
                                                                                                    
    class execute_subsys_test_sequence_lib extends uvm_sequence;                                
                                                                                                    
        function new (string name = "execute_subsys_test_sequence_lib");                      
            super.new(name);                                                                        
            `uvm_info(this.get_full_name(), "new is called", UVM_LOW)                             
        endfunction                                                                                 
                                                                                                    
        `uvm_object_utils(execute_subsys_test_sequence_lib)                                     
        `uvm_declare_p_sequencer(execute_virtual_sequencer)                                     
                                                                                                    
        virtual task body();                                                                        
            uvm_phase starting_phase;                                                               
            virtual interface misc_interface misc_if;                                               
            execute_reference_model refm;                                                       
                                                                                                    
            string file_queue_opcode [$];                                                         
            integer bitwidth_queue_opcode [$];                                                    
                                                                                                               
            svr_pkg::svr_master_sequence#(4) svr_port_opcode_seq;            
            svr_pkg::svr_random_sequence#(4) svr_port_random_port_opcode_seq;

            string file_queue_ra_addr [$];                                                         
            integer bitwidth_queue_ra_addr [$];                                                    
                                                                                                               
            svr_pkg::svr_master_sequence#(5) svr_port_ra_addr_seq;            
            svr_pkg::svr_random_sequence#(5) svr_port_random_port_ra_addr_seq;

            string file_queue_rb_addr [$];                                                         
            integer bitwidth_queue_rb_addr [$];                                                    
                                                                                                               
            svr_pkg::svr_master_sequence#(5) svr_port_rb_addr_seq;            
            svr_pkg::svr_random_sequence#(5) svr_port_random_port_rb_addr_seq;

            string file_queue_rc_addr [$];                                                         
            integer bitwidth_queue_rc_addr [$];                                                    
                                                                                                               
            svr_pkg::svr_master_sequence#(5) svr_port_rc_addr_seq;            
            svr_pkg::svr_random_sequence#(5) svr_port_random_port_rc_addr_seq;

            string file_queue_imd_data [$];                                                         
            integer bitwidth_queue_imd_data [$];                                                    
                                                                                                               
            svr_pkg::svr_master_sequence#(32) svr_port_imd_data_seq;            
            svr_pkg::svr_random_sequence#(32) svr_port_random_port_imd_data_seq;

            svr_pkg::svr_slave_sequence #(32) svr_port_ap_return_seq;            


            if (!uvm_config_db#(execute_reference_model)::get(p_sequencer,"", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No reference model")
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_LOW)

            `uvm_info(this.get_full_name(), "body is called", UVM_LOW)
            starting_phase = this.get_starting_phase();
            if (starting_phase != null) begin
                `uvm_info(this.get_full_name(), "starting_phase not null", UVM_LOW)
                starting_phase.raise_objection(this);
            end
            else
                `uvm_info(this.get_full_name(), "starting_phase null" , UVM_LOW)

            misc_if = refm.misc_if;


            //phase_done.set_drain_time(this, 0ns);
            wait(refm.misc_if.reset === 0);
            ->refm.misc_if.initialed_evt;

            fork
                begin
                    fork
                        begin
                            string keystr_delay;
                            file_queue_opcode.push_back(`AUTOTB_TVIN_opcode_opcode);
                            bitwidth_queue_opcode.push_back(4);

                            `uvm_create_on(svr_port_opcode_seq, p_sequencer.svr_port_opcode_sqr);
                            svr_port_opcode_seq.misc_if = refm.misc_if;
                            svr_port_opcode_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_opcode_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_opcode_seq.finish   = refm.finish;
                            svr_port_opcode_seq.file_rd.config_file(file_queue_opcode, bitwidth_queue_opcode);
                            if( refm.execute_cfg.port_opcode_cfg.prt_type == AP_VLD ) wait(refm.misc_if.tb2dut_ap_start === 1'b1);
                            svr_port_opcode_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_opcode_seq);     
                        end                                               
                        begin
                            string keystr_delay;
                            file_queue_ra_addr.push_back(`AUTOTB_TVIN_ra_addr_ra_addr);
                            bitwidth_queue_ra_addr.push_back(5);

                            `uvm_create_on(svr_port_ra_addr_seq, p_sequencer.svr_port_ra_addr_sqr);
                            svr_port_ra_addr_seq.misc_if = refm.misc_if;
                            svr_port_ra_addr_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_ra_addr_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_ra_addr_seq.finish   = refm.finish;
                            svr_port_ra_addr_seq.file_rd.config_file(file_queue_ra_addr, bitwidth_queue_ra_addr);
                            if( refm.execute_cfg.port_ra_addr_cfg.prt_type == AP_VLD ) wait(refm.misc_if.tb2dut_ap_start === 1'b1);
                            svr_port_ra_addr_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_ra_addr_seq);     
                        end                                               
                        begin
                            string keystr_delay;
                            file_queue_rb_addr.push_back(`AUTOTB_TVIN_rb_addr_rb_addr);
                            bitwidth_queue_rb_addr.push_back(5);

                            `uvm_create_on(svr_port_rb_addr_seq, p_sequencer.svr_port_rb_addr_sqr);
                            svr_port_rb_addr_seq.misc_if = refm.misc_if;
                            svr_port_rb_addr_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_rb_addr_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_rb_addr_seq.finish   = refm.finish;
                            svr_port_rb_addr_seq.file_rd.config_file(file_queue_rb_addr, bitwidth_queue_rb_addr);
                            if( refm.execute_cfg.port_rb_addr_cfg.prt_type == AP_VLD ) wait(refm.misc_if.tb2dut_ap_start === 1'b1);
                            svr_port_rb_addr_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_rb_addr_seq);     
                        end                                               
                        begin
                            string keystr_delay;
                            file_queue_rc_addr.push_back(`AUTOTB_TVIN_rc_addr_rc_addr);
                            bitwidth_queue_rc_addr.push_back(5);

                            `uvm_create_on(svr_port_rc_addr_seq, p_sequencer.svr_port_rc_addr_sqr);
                            svr_port_rc_addr_seq.misc_if = refm.misc_if;
                            svr_port_rc_addr_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_rc_addr_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_rc_addr_seq.finish   = refm.finish;
                            svr_port_rc_addr_seq.file_rd.config_file(file_queue_rc_addr, bitwidth_queue_rc_addr);
                            if( refm.execute_cfg.port_rc_addr_cfg.prt_type == AP_VLD ) wait(refm.misc_if.tb2dut_ap_start === 1'b1);
                            svr_port_rc_addr_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_rc_addr_seq);     
                        end                                               
                        begin
                            string keystr_delay;
                            file_queue_imd_data.push_back(`AUTOTB_TVIN_imd_data_imd_data);
                            bitwidth_queue_imd_data.push_back(32);

                            `uvm_create_on(svr_port_imd_data_seq, p_sequencer.svr_port_imd_data_sqr);
                            svr_port_imd_data_seq.misc_if = refm.misc_if;
                            svr_port_imd_data_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_imd_data_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_imd_data_seq.finish   = refm.finish;
                            svr_port_imd_data_seq.file_rd.config_file(file_queue_imd_data, bitwidth_queue_imd_data);
                            if( refm.execute_cfg.port_imd_data_cfg.prt_type == AP_VLD ) wait(refm.misc_if.tb2dut_ap_start === 1'b1);
                            svr_port_imd_data_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_imd_data_seq);     
                        end                                               
                        begin
                            string keystr_delay;
                            `uvm_create_on(svr_port_ap_return_seq, p_sequencer.svr_port_ap_return_sqr);
                            svr_port_ap_return_seq.misc_if = refm.misc_if;
                            svr_port_ap_return_seq.ap_done  = refm.ap_done_for_nexttrans ;
                            svr_port_ap_return_seq.ap_ready = refm.ap_ready_for_nexttrans;
                            svr_port_ap_return_seq.finish   = refm.finish;
                            svr_port_ap_return_seq.isusr_delay = svr_pkg::NO_DELAY;
                            `uvm_send(svr_port_ap_return_seq);     
                        end                                               
                        begin
                            wait(svr_port_opcode_seq&&svr_port_ra_addr_seq&&svr_port_rb_addr_seq&&svr_port_rc_addr_seq&&svr_port_imd_data_seq);
                            forever begin
                                wait(svr_port_opcode_seq.one_sect_read&&svr_port_ra_addr_seq.one_sect_read&&svr_port_rb_addr_seq.one_sect_read&&svr_port_rc_addr_seq.one_sect_read&&svr_port_imd_data_seq.one_sect_read);
                                svr_port_opcode_seq.one_sect_read = 0;
                                svr_port_ra_addr_seq.one_sect_read = 0;
                                svr_port_rb_addr_seq.one_sect_read = 0;
                                svr_port_rc_addr_seq.one_sect_read = 0;
                                svr_port_imd_data_seq.one_sect_read = 0;
                                -> refm.allsvr_input_done;
                            end
                        end
                        begin
                            int delay;
                            repeat(3) @(posedge refm.misc_if.clock);
                            for(int j=0; j<20; j++) begin
                                #0; refm.misc_if.tb2dut_ap_start = 1;
                                fork
                                    begin
                                        @(refm.dut2tb_ap_done);
                                    end
                                    begin
                                        @(refm.dut2tb_ap_ready);
                                        #0; refm.misc_if.tb2dut_ap_start = 0;
                                    end
                                join
                                void'(std::randomize(delay) with { delay == 0; });
                                repeat(delay) @(posedge refm.misc_if.clock);
                            end
                        end
                        begin
                            int delay;
                            for(int j=0; j<20; j=j+refm.ap_done_cnt) begin
                                @refm.dut2tb_ap_done;
                                #0; refm.misc_if.tb2dut_ap_continue = 0;
                            end
                        end
                    join
                end

                begin
                    for(int j=0; j<20; j=j+refm.ap_done_cnt) @refm.ap_done_for_nexttrans;
                    `uvm_info(this.get_full_name(), "autotb finished", UVM_LOW)
                    -> refm.finish;
                    refm.misc_if.finished = 1;
                    @(posedge refm.misc_if.clock);
                    refm.misc_if.finished = 0;
                    @(posedge refm.misc_if.clock);
                    -> refm.misc_if.finished_evt;
                end
            join_any
            repeat(5) @(posedge refm.misc_if.clock); //5 cycles delay for finish stuff. 5 is haphazard value

            p_sequencer.svr_port_opcode_sqr.stop_sequences();
            p_sequencer.svr_port_ra_addr_sqr.stop_sequences();
            p_sequencer.svr_port_rb_addr_sqr.stop_sequences();
            p_sequencer.svr_port_rc_addr_sqr.stop_sequences();
            p_sequencer.svr_port_imd_data_sqr.stop_sequences();
            p_sequencer.svr_port_ap_return_sqr.stop_sequences();
            disable fork;
                                                                                                    
            starting_phase.drop_objection(this);                                                    
                                                                                                    
        endtask                                                                                     
    endclass                                                                                        
                                                                                                    
`endif                                                                                              
