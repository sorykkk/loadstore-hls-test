

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "execute",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "opcode", "Type" : "None", "Direction" : "I"},
			{"Name" : "ra_addr", "Type" : "None", "Direction" : "I"},
			{"Name" : "rb_addr", "Type" : "None", "Direction" : "I"},
			{"Name" : "rc_addr", "Type" : "None", "Direction" : "I"},
			{"Name" : "imd_data", "Type" : "None", "Direction" : "I"},
			{"Name" : "lsm_instance_reg_file", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "lsm_instance_mem", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lsm_instance_reg_file_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lsm_instance_mem_U", "Parent" : "0"}]}
