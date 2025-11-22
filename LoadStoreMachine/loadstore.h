#ifndef LSM_H
#define LSM_H

#include <ap_int.h>
#include <hls_stream.h>

// data and addr width
typedef ap_uint<32> data_t;
typedef ap_uint<10> addr_t;
typedef ap_uint<4> opcode_t;
typedef ap_uint<5> reg_t;

// mem depth
#define MEM_DEPTH 1024
#define NUM_REGISTERS 32

#define OP_ADD 0x1
#define OP_SUB 0x2
#define OP_AND 0x3
#define OP_OR  0x4
#define OP_LD  0x5
#define OP_ST  0x6
#define OP_NOP 0x7
#define OP_CMP 0x8
#define OP_MOV 0x9

class RegisterFile {
private:
    data_t registers[NUM_REGISTERS];

public:
    RegisterFile();
    void write(reg_t addr, data_t data);
    data_t read(reg_t addr);
    void reset();
};

class ALU {
public:
    ALU();
    data_t add(data_t a, data_t b);
    data_t sub(data_t a, data_t b);
    data_t and_op(data_t a, data_t b);
    data_t or_op(data_t a, data_t b);
    data_t cmp(data_t a, data_t b);

    data_t compute(data_t a, data_t b, opcode_t opcode);
};

class Memory {
private:
    data_t memory[MEM_DEPTH];

public:
    Memory();
    data_t read(addr_t address);
    void write(addr_t address, data_t data);
    void reset();
};

class LSM {
private:
    RegisterFile reg_file;
    ALU alu;
    Memory mem;

public:
    LSM();

    // main execute function
    void execute_op(
        opcode_t opcode,
        reg_t ra_addr,
        reg_t rb_addr,
        reg_t rc_addr,
        data_t imd_data
    );

    void reset();
    // test methods
    data_t get_register(reg_t addr);
    data_t get_mem(addr_t mem_addr);
    void print_registers();
};

//top level HLS function wrapper
data_t execute(
    opcode_t opcode,
    reg_t ra_addr,
    reg_t rb_addr,
    reg_t rc_addr,
    data_t imd_data
);

#endif