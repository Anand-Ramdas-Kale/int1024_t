    .global shift_left_bcd_1280_bits
    .type shift_left_bcd_1280_bits, @function

    .global shift_left_bin_1024_bits
    .type shift_left_bin_1024_bits, @function

shift_left_bcd_1280_bits:
    movq    %rbx, %rsi
    xorl    %ebx, %ebx
    xorl    %ecx, %ecx
    incq    %rbx

    # 1 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %ecx
    addq    $8, %rdi 

    # 2 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 3 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 4 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 5 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 6 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 7 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 8 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 9 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 10 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 11 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 12 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 13 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 14 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 15 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 16 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 17 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 18 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 19 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 20 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx

    # restore %rdi
    subq    $152, %rdi
    movq    %rsi, %rbx
    ret

shift_left_bin_1024_bits:
    movq    %rbx, %rsi
    xorl    %ebx, %ebx
    xorl    %ecx, %ecx
    incq    %rbx

    # 1 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %ecx
    addq    $8, %rdi 

    # 2 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 3 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 4 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 5 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 6 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 7 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 8 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 9 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 10 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 11 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 12 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 13 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 14 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 15 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)
    movl    %eax, %ecx
    addq    $8, %rdi 

    # 16 
    xorl    %eax, %eax
    shlq    $1, (%rdi)
    cmovc   %ebx, %eax
    orq     %rcx, (%rdi)

    subq    $120, %rdi
    movq    %rsi, %rbx
    ret

    # shift_left_bin_1024_bits
