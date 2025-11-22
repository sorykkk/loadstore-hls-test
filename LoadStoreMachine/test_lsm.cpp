#include "loadstore.h"
#include <stdio.h>
#include <assert.h>

int main() {
    data_t result_reg1 =0 , result_reg2 = 0;
    int pass_count = 0, test_count = 0;

    test_count++;
    printf("Test 1: Register Write and Read\n");
    result_reg1 = execute(OP_MOV, 1, 0, 0, 0x0000000A); // R1 = 10
    result_reg2 = execute(OP_MOV, 2, 0, 0, 0x00000014); // R2 = 20
    assert(result_reg1 == 0x0000000A);
    assert(result_reg2 == 0x00000014);
    printf("PASS");
    pass_count++;

    test_count++;
    printf("Test 2: ADD Operation (R3 = R1 + R2)\n");
    result_reg1 = execute(OP_ADD, 1, 2, 3, 0);
    printf("  R3 = 0x%X\n", (unsigned int)result_reg1);
    assert(result_reg1 == 0x0000001E);
    printf("PASS\n");
    pass_count++;

    test_count++;
    printf("Test 3: SUB Operation (R4 = R2 - R1)\n");
    result_reg1 = execute(OP_SUB, 2, 1, 4, 0);
    printf("  R4 = 0x%X\n", (unsigned int)result_reg1);
    assert(result_reg1 == 0x0000000A);
    printf("PASS\n");
    pass_count++;
    
    test_count++;
    printf("Test 4: AND Operation (R5 = R1 AND 0x0F)\n");
    execute(OP_MOV, 6, 0, 0, 0x0F);
    result_reg1 = execute(OP_AND, 1, 6, 5, 0);
    printf("  R5 = 0x%X\n", (unsigned int)result_reg1);
    assert(result_reg1 == 0x0000000A);
    printf("PASS\n");
    pass_count++;
    
    test_count++;
    printf("Test 5: OR Operation (R7 = R1 OR 0xF0)\n");
    execute(OP_MOV, 8, 0, 0, 0xF0);
    result_reg1 = execute(OP_OR, 1, 8, 7, 0);
    printf("  R7 = 0x%X\n", (unsigned int)result_reg1);
    assert(result_reg1 == 0x000000FA);
    printf("PASS\n");
    pass_count++;
    
    test_count++;
    printf("Test 6: Memory Write (mem[0] = 0x12345678)\n");
    execute(OP_MOV, 10, 0, 0, 0x12345678);
    execute(OP_MOV, 11, 0, 0, 0);
    result_reg1 = execute(OP_ST, 10, 11, 0, 0); // OP_ST: ra=data, rb=address
    printf("  Memory[0] = 0x%X\n", (unsigned int)result_reg1);
    assert(result_reg1 == 0x12345678);
    printf("PASS\n");
    pass_count++;

    test_count++;
    printf("Test 7: Memory Read (R12 = mem[0])\n");          // Address = 0
    execute(OP_MOV, 11, 0, 0, 0);
    result_reg1 = execute(OP_LD, 11, 12, 0, 0);
    printf("  R12 = 0x%X\n", (unsigned int)result_reg1);
    assert(result_reg1 == 0x12345678);
    printf("PASS\n");
    pass_count++;
    
    test_count++;
    printf("Test 8: Sequential Operations\n");
    printf("  Step 1: R13 = 5 + 3\n");
    execute(OP_MOV, 14, 0, 0, 5);
    execute(OP_MOV, 15, 0, 0, 3);
    result_reg1 = execute(OP_ADD, 14, 15, 13, 0);
    printf("    Result: 0x%X\n", (unsigned int)result_reg1);
    
    printf("  Step 2: R16 = R13 * 2 (via ADD R13 + R13)\n");
    result_reg1 = execute(OP_ADD, 13, 13, 16, 0);
    printf("    Result: 0x%X\n", (unsigned int)result_reg1);
    
    printf("  Step 3: mem[10] = R16\n");
    execute(OP_MOV, 17, 0, 0, 10);
    result_reg1 = execute(OP_ST, 16, 17, 0, 0);
    printf("    Result: 0x%X\n", (unsigned int)result_reg1);
    
    printf("  Step 4: R18 = mem[10]\n");
    result_reg1 = execute(OP_LD, 18, 17, 0, 0);
    printf("    Result: 0x%X (expected 0x10 = 16)\n", (unsigned int)result_reg1);
    assert(result_reg1 == 16);
    printf("PASS\n\n");
    pass_count++;
    
    printf("Test Results: %d/%d tests passed\n", pass_count, test_count);
    
    if(pass_count == test_count) {
        printf("ALL TEST PASSED!\n");
        return 0;
    }
    else {
        printf("PARTIAL PASSED\n");
        return 1;
    }


    return 0;
}