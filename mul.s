    .global mul_uint1024_t

    .type mul_uint1024_t, @function
mul_uint1024_t:
    # saved_registers
    # stack_creation
    subq    $256, %rsp

    # raw buffer initialization :- making half raw buffer zero
    xorl    %ecx, %ecx
    movq    %rcx, 128(%rsp)
    movq    %rcx, 136(%rsp)
    movq    %rcx, 144(%rsp)
    movq    %rcx, 152(%rsp)
    movq    %rcx, 160(%rsp)
    movq    %rcx, 168(%rsp)
    movq    %rcx, 176(%rsp)
    movq    %rcx, 184(%rsp)
    movq    %rcx, 192(%rsp)
    movq    %rcx, 200(%rsp)
    movq    %rcx, 208(%rsp)
    movq    %rcx, 216(%rsp)
    movq    %rcx, 224(%rsp)
    movq    %rcx, 232(%rsp)
    movq    %rcx, 240(%rsp)
    movq    %rcx, 248(%rsp)
    # raw buffer is initialized

    # variable set up <<
    movq    %rdx, %r9               # %rdx is used in 64*64 bit -> 128 bit so %r9 holds main result
    subq    $8, %rsi                # buffer_type_a
    movl    $1, %r10d               # for cmov
    movq    %rcx, %r11              # counter
    # variable set up >>

    .raw_buffer_type_a:
    # raw_buffer_type_a <<
    cmpl    $32, %r11d
    jz      .done
    addq    $8, %rsi
    movq    %rdi, %r8
    # raw_buffer_type_a >>
    jmp     .raw_buffer_builder

    .raw_buffer_type_b:
    # raw_buffer_type_b <<
    leaq    8(%rdi), %r8
    # raw_buffer_type_b >>
    # jmp     .raw_buffer_builder           ... jumps to builder (actually)

    .raw_buffer_builder:
    # raw_buffer_builder <<
    movq    (%rsi), %rcx
    # uses %rax, %rdx, %rsp (left intact), %rcx, %r8 (pointer within first argument...initialized by buffer type)
    # 1
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, (%rsp)
    movq    %rdx, 8(%rsp)
    addq    $16, %r8

    # 2
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, 16(%rsp)
    movq    %rdx, 24(%rsp)
    addq    $16, %r8

    # 3
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, 32(%rsp)
    movq    %rdx, 40(%rsp)
    addq    $16, %r8

    # 4
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, 48(%rsp)
    movq    %rdx, 56(%rsp)
    addq    $16, %r8

    # 5
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, 64(%rsp)
    movq    %rdx, 72(%rsp)
    addq    $16, %r8

    # 6
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, 80(%rsp)
    movq    %rdx, 88(%rsp)
    addq    $16, %r8

    # 7
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, 96(%rsp)
    movq    %rdx, 104(%rsp)
    addq    $16, %r8

    # 8
    movq    (%r8), %rax
    mulq    %rcx
    movq    %rax, 112(%rsp)
    movq    %rdx, 120(%rsp)
    addq    $8, %r8
    # raw_buffer_builder >>

    # level selector <<
    incl    %r11d
    movq    %rsp, %rcx
    movl    %r11d, %eax
    shrl    $1, %eax
    jmp     *.ADD_LVL(, %rax, 8)
    # level selector >>

    # addition slide <<
        # %rax : new carry
        # %rdx : old carry
        # %r10 : $1 for cmov (initialized in the begining)
        # %rcx : pointer to current quadword to be added
        # %r8  : temp register
        # %r9  : (const not changed throughout life of function) main_result_pointer
    .add_level_1:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, (%r9)
    cmovc   %r10d, %eax
    addq    %rdx, (%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_2:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 8(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 8(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_3:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 16(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 16(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_4:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 24(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 24(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_5:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 32(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 32(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_6:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 40(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 40(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_7:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 48(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 48(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_8:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 56(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 56(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_9:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 64(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 64(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_10:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 72(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 72(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_11:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 80(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 80(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_12:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 88(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 88(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_13:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 96(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 96(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_14:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 104(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 104(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_15:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 112(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 112(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_16:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 120(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 120(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_17:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 128(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 128(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_18:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 136(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 136(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_19:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 144(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 144(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_20:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 152(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 152(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_21:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 160(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 160(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_22:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 168(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 168(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_23:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 176(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 176(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_24:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 184(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 184(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_25:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 192(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 192(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_26:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 200(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 200(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_27:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 208(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 208(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_28:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 216(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 216(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_29:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 224(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 224(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_30:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 232(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 232(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_31:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 240(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 240(%r9)
    cmovc   %r10d, %eax
    movl    %eax, %edx
    addq    $8, %rcx

    .add_level_32:
    xorl    %eax, %eax
    movq    (%rcx), %r8
    addq    %r8, 248(%r9)
    cmovc   %r10d, %eax
    addq    %rdx, 248(%r9)
    # cmovc   %r10d, %eax
    # movl    %eax, %edx
    # addq    $8, %rcx
    # addition slide >>

    # iteration <<
    movb    %r11b, %al
    andl    $1, %eax
    jmp     *.BLOCK_TYPE_SELLECTOR(, %rax, 8)
    # iteration >>

    .done:
    # stack_deallocation
    addq    $256, %rsp
    # restore_saved_registers
    ret

    ####################################################################################################

    .section .rodata
    .align 8

    .ADD_LVL:
    .quad .add_level_1
    .quad .add_level_2
    .quad .add_level_3
    .quad .add_level_4
    .quad .add_level_5
    .quad .add_level_6
    .quad .add_level_7
    .quad .add_level_8
    .quad .add_level_9
    .quad .add_level_10
    .quad .add_level_11
    .quad .add_level_12
    .quad .add_level_13
    .quad .add_level_14
    .quad .add_level_15
    .quad .add_level_16
    .quad .add_level_17
    .quad .add_level_18
    .quad .add_level_19
    .quad .add_level_20
    .quad .add_level_21
    .quad .add_level_22
    .quad .add_level_23
    .quad .add_level_24
    .quad .add_level_25
    .quad .add_level_26
    .quad .add_level_27
    .quad .add_level_28
    .quad .add_level_29
    .quad .add_level_30
    .quad .add_level_31
    .quad .add_level_32

    .BLOCK_TYPE_SELLECTOR:
    .quad .raw_buffer_type_a
    .quad .raw_buffer_type_b
