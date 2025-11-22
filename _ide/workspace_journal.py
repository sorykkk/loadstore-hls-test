# 2025-11-20T11:26:12.381706600
import vitis

client = vitis.create_client()
client.set_workspace(path="LoadStore")

comp = client.create_hls_component(name = "LoadStoreMachine",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="LoadStoreMachine")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp = client.create_hls_component(name = "test",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

comp.run(operation="CO_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="CO_SIMULATION")

vitis.dispose()

