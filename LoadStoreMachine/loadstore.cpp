#include "loadstore.h"
#include <stdio.h>

RegisterFile::RegisterFile() {
#pragma HLS INLINE
    for(int i = 0; i < NUM_REGISTERS; i++)
        registers[i] = 0;
}

void RegisterFile::write(reg_t addr, data_t data) {
#pragma HLS INLINE
    if(addr != 0) { // Reserve register 0 as read-only
        registers[addr] = data;
    }
}

data_t RegisterFile::read(reg_t addr) {
#pragma HLS INLINE
    return registers[addr];
}

void RegisterFile::reset() {
    for(int i = 0; i < NUM_REGISTERS; i++)
        registers[i] = 0;
}

ALU::ALU() {}

data_t ALU::add(data_t a, data_t b) {
#pragma HLS INLINE
    return a + b;
}

data_t ALU::sub(data_t a, data_t b) {
#pragma HLS INLINE
    return a - b;
}

data_t ALU::and_op(data_t a, data_t b) {
#pragma HLS INLINE
    return a & b;
}

data_t ALU::or_op(data_t a, data_t b) {
#pragma HLS INLINE
    return a | b;
}

data_t ALU::cmp(data_t a, data_t b) {
#pragma HLS INLINE
    return a == b;
}

data_t ALU::compute(data_t a, data_t b, opcode_t opcode) {
#pragma HLS INLINE
    data_t result = 0;
    switch(opcode) {
        case OP_ADD:
            result = add(a, b);
            break;
        case OP_SUB:
            result = sub(a, b);
            break;
        case OP_AND:
            result = and_op(a, b);
            break;
        case OP_OR:
            result = or_op(a, b);
            break;
        case OP_CMP:
            result = cmp(a, b);
            break;
        default:
            result = 0;
            break;
    }

    return result;
}

Memory::Memory() {
#pragma HLS INLINE
    for(int i = 0; i < MEM_DEPTH; i++)
        memory[i] = 0;
}

data_t Memory::read(addr_t address) {
#pragma HLS INLINE
    return memory[address];
}

void Memory::write(addr_t address, data_t data) {
#pragma HLS INLINE
    memory[address] = data;
}

void Memory::reset() {
    for(int i = 0; i < MEM_DEPTH; i++) 
        memory[i] = 0;
}

LSM:: LSM() {
    reg_file.reset();
    mem.reset();
}

void LSM::execute_op(
    opcode_t opcode,
    reg_t ra_addr,
    reg_t rb_addr,
    reg_t rc_addr,
    data_t imd_data    // immediate value of data to be set
) {
    data_t mem_out = 0;
    data_t alu_out = 0;

    data_t reg_a = reg_file.read(ra_addr);
    data_t reg_b = reg_file.read(rb_addr);

    switch(opcode) {
        // alu operations
        case OP_ADD:
        case OP_SUB:
        case OP_AND:
        case OP_OR:
        case OP_CMP:
        {
            alu_out = alu.compute(reg_a, reg_b, opcode);
            reg_file.write(rc_addr, alu_out);
        }
        break;
        
        case OP_LD:
        {
            mem_out = mem.read((addr_t)(reg_b) & 0x3FF);
            reg_file.write(ra_addr, mem_out);
        }
        break;

        case OP_ST:
            mem.write((addr_t)(reg_b & 0x3FF), reg_a);
            break;

        case OP_MOV:
            reg_file.write(ra_addr, imd_data);
            break;

        case OP_NOP:
        default:
            break;
    }
}

void LSM::reset() {
    reg_file.reset();
    mem.reset();
}

void LSM::print_registers() {
    for(int i = 0; i < NUM_REGISTERS; i++) {
        if(i%4 == 0) {
            printf("\n$%02d: ", i);
        }
        printf("0x%08X  ", (unsigned int)get_register(i));
    }
    printf("\n");
}

// test methods
data_t LSM::get_register(reg_t addr) {
    return reg_file.read(addr);
}

data_t LSM::get_mem(addr_t mem_addr) {
    return mem.read(mem_addr);
}

// Top-level HLS function
data_t execute(
    opcode_t opcode,
    reg_t ra_addr,
    reg_t rb_addr,
    reg_t rc_addr,
    data_t imd_data
) {
    static LSM lsm_instance{};

    lsm_instance.execute_op(opcode, ra_addr, rb_addr, rc_addr, imd_data);
    
    data_t result;
    switch(opcode) {
        case OP_MOV:
        case OP_LD:
            result = lsm_instance.get_register(ra_addr);
            break;
        case OP_ST:
        {
            data_t reg_b = lsm_instance.get_register(rb_addr);
            result = lsm_instance.get_mem((addr_t)(reg_b & 0x3FF));
        }
        break;
        default:
            result = lsm_instance.get_register(rc_addr);
            break;
    }
    lsm_instance.print_registers();
    return result;
}