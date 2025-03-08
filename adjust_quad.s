    .global adjust_quad   
    .type adjust_quad, @function

    # %rdi :- address of bcd (destination)
    # %rsi :- address of bin (source)

adjust_quad:
    # %rdi (intact), %rax, %rdx, %r8, %r9, %r10, 
    # grab the long in %rax
    movq    $3, %r8
    xorl    %eax, %eax
    movq    (%rdi), %rax
    xorl    %r10d, %r10d

    # 1
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r10d

    # 2
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $4, %r9
    orq     %r9, %r10

    # 3
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $8, %r9
    orq     %r9, %r10
    
    # 4
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $12, %r9
    orq     %r9, %r10

    # 5
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $16, %r9
    orq     %r9, %r10

    # 6
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $20, %r9
    orq     %r9, %r10

    # 7
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $24, %r9
    orq     %r9, %r10

    # 8
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $28, %r9
    orq     %r9, %r10

    # 9
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $32, %r9
    orq     %r9, %r10

    # 10
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $36, %r9
    orq     %r9, %r10

    # 11
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $40, %r9
    orq     %r9, %r10

    # 12
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $44, %r9
    orq     %r9, %r10

    # 13
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $48, %r9
    orq     %r9, %r10

    # 14
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $52, %r9
    orq     %r9, %r10

    # 15
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $56, %r9
    orq     %r9, %r10

    # 16
    shrq    $4, %rax
    xorl    %r9d, %r9d
    movb    %al, %dl
    andl    $15, %edx
    cmpb    $4, %dl
    cmovg   %r8d, %r9d
    shlq    $60, %r9
    orq     %r9, %r10

    addq    %r10, (%rdi)
    ret
