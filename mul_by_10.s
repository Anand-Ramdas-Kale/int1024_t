    .global mul_by_10
    .type mul_by_10, @function

mul_by_10:
    pushq   %r12
    pushq   %r13
    pushq   %r14
    pushq   %r15
    pushq   %rbx
    pushq   %rcx
    pushq   %rdx
    pushq   %rbp
    pushq   %rsi
    subq    $256, %rsp

    call    shift_left_bcd_1280_bits
    addq    %rax, (%rsp)
    
    leaq    16(%rsp), %rsi
    call    copy_1024_bits_in_loc_rsi_from_loc_rdi

    call    shift_left_bcd_1280_bits
    addq    %rax, (%rsp)

    call    shift_left_bcd_1280_bits
    addq    %rax, (%rsp)

    movq    %rdi, %rsi
    leaq    16(%rsp), %rdi
    call    add_ptr_rdi_to_ptr_rsi

    addq    %rax, (%rsp)
    movq    %rsi, %rdi

    movq    (%rsp), %rax
    addq    $256, %rsp

    popq   %rsi
    popq   %rbp
    popq   %rdx
    popq   %rcx
    popq   %rbx
    popq   %r15
    popq   %r14
    popq   %r13
    popq   %r12
    ret


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

copy_1024_bits_in_loc_rsi_from_loc_rdi:
    # 1
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 2
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 3
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 4
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 5
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 6
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 7
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 8
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 9
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 10
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 11
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 12
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 13
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 14
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 15
    movq    (%rdi), %rax
    movq    %rax, (%rsi)
    addq    $8, %rdi
    addq    $8, %rsi

    # 16
    movq    (%rdi), %rax
    movq    %rax, (%rsi)

    subq    $120, %rdi    
    subq    $120, %rsi    
    ret

add_ptr_rdi_to_ptr_rsi:
    # %eax returns an integer carry
    xorl    %eax, %eax
    xorl    %r9d, %r9d
    movl    $1, %r9d

    # 64b 1
    movq    (%rdi), %r8
    addq    %r8, (%rsi)
    cmovc   %r9d, %r10d 
    
    # 64b 2
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)
 
    # 64b 3
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)
 
    # 64b 4
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)
 
    # 64b 5
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)

    # 64b 6
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)

    # 64b 7
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)

    # 64b 8
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)

    # 64b 9
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)

    # 64b 10
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)
 
    # 64b 11
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)
 
    # 64b 12
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)
 
    # 64b 13
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)
 
    # 64b 14
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)

    # 64b 15
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;

    movl    %eax, %r10d     # previous_carry = new_carry(%eax)

    # 64b 16
    addq    $8, %rdi        # make the pointers point to next 64 bits
    addq    $8, %rsi        # make the pointers point to next 64 bits
    xorl    %eax, %eax      # make %rax 0
    movq    (%rdi), %r8     # temp = value_at(%rdi)
    addq    %r8, (%rsi)     # value_at(%rsi) += temp ... eauivalent to ... value_at(%rsi) += value_at(%rdi)
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    addq    %r10, (%rsi)    # value_at(%rsi) += previous_carry
    cmovc   %r9d, %eax      # %eax = (carry) ? 1 : 0;
    subq    $120, %rsi
    ret

