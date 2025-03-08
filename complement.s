    .global complement
    .type complement, @function

complement:
    # %rsi stores $1 for cmov
    xorl    %ecx, %ecx
    xorl    %esi, %esi
    xorl    %edx, %edx
    incq    %rsi

    # 1
    movq    (%rdi), %rax
    notq    %rax
    addq    $1, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 2
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 3
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 4
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 5
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 6
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 7
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 8
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 9
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 10
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 11
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 12
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 13
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 14
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 15
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    cmovc   %esi, %ecx
    movq    %rax, (%rdi)
    movl    %ecx, %edx
    addq    $8, %rdi

    # 16
    xorl    %ecx, %ecx
    movq    (%rdi), %rax
    notq    %rax
    addq    %rdx, %rax
    movq    %rax, (%rdi)

    ret
