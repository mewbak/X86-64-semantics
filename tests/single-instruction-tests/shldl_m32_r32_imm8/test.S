TEST_BEGIN(SHLDL, 3)
TEST_INPUTS(
    0, 0, 0,                  
    0, 0,                   1,                  
    1, 1,                   1,
    0xFF, 0xFF,             1,
    0xFFFF, 0xFFFF,         1,
    0, 0xFFFF,              1,
    0xFFFF, 0,              1,
    0xFFFFFFFF, 0xFFFFFFFF, 1,
    0, 0xFFFFFFFF,          1,
    0xFFFFFFFF, 0,          1,
    0, 0,           15,                  
    1, 1,           15,
    0xFF, 0xFF,     15,
    0xFFFF, 0xFFFF, 15,
    0, 0xFFFF,      15,
    0xFFFF, 0,      15,
    0, 0,           16,                  
    1, 1,           16,
    0xFF, 0xFF,     16,
    0xFFFF, 0xFFFF, 16,
    0, 0xFFFF,      16,
    0xFFFF, 0,      16,
    0xFF, 0xFF,             31,
    0xFFFF, 0xFFFF,         31,
    0, 0xFFFF,              31,
    0xFFFF, 0,              31,
    0xFFFFFFFF, 0xFFFFFFFF, 31,
    0, 0xFFFFFFFF,          31,
    0xFFFFFFFF, 0,          31,
    0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 31,
    0, 0xFFFFFFFFFFFFFFFF, 31,
    0xFFFFFFFFFFFFFFFF, 0, 31,
    0xFF, 0xFF,             32,
    0xFFFF, 0xFFFF,         32,
    0, 0xFFFF,              32,
    0xFFFF, 0,              32,
    0xFFFFFFFF, 0xFFFFFFFF, 32,
    0, 0xFFFFFFFF,          32,
    0xFFFFFFFF, 0,          32,
    0xFF, 0xFF,                             63,
    0xFFFF, 0xFFFF,                         63,
    0, 0xFFFF,                              63,
    0xFFFF, 0,                              63,
    0xFFFFFFFF, 0xFFFFFFFF,                 63,
    0, 0xFFFFFFFF,                          63,
    0xFFFFFFFF, 0,                          63,
    0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 63,
    0, 0xFFFFFFFFFFFFFFFF,                  63,
    0xFFFFFFFFFFFFFFFF, 0,                  63,
    0xFF, 0xFF,                             64,
    0xFFFF, 0xFFFF,                         64,
    0, 0xFFFF,                              64,
    0xFFFF, 0,                              64,
    0xFFFFFFFF, 0xFFFFFFFF,                 64,
    0, 0xFFFFFFFF,                          64,
    0xFFFFFFFF, 0,                          64,
    0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF, 64,
    0, 0xFFFFFFFFFFFFFFFF,                  64,
    0xFFFFFFFFFFFFFFFF, 0,                  64)

    movq ARG1_64, %rax
    movq ARG2_64, %rbx
    pushq %rbx
    shldl ARG3_64, %eax, (%rsp)
TEST_END
