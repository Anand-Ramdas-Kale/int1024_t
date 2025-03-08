
    # TODO: support for signed and unsigned 1024 bit numbers
    # TODO: support for addition
    # TODO: support for subtraction
    # TODO: support for multiplication

    # for little-enidan

    # all operations are accepting three arguments :- (source, destination)
    # binary operations are being executed according to AT&T syntax as follows
    # addition          :- (*destination) <- (*destination) + (*source)
    # subtraction       :- (*destination) <- (*destination) - (*source)
    # multiplication    :- (*destination) <- (*destination) * (*source)

    # source      = &operand1 = %rdi 
    # destination = &operand2 = %rsi
    # %rdx, %rcx, %r8, %r9, %r10, %r11
    # %rax := carry
    # %r8  := temp register
    # %r9  := $1 (constant if carry generates)
    # %r10 := previous carry

    .global add_int1024_t
    .type add_int1024_t, @function

    .global add_uint1024_t
    .type add_uint1024_t, @function

    .global sub_int1024_t
    .type sub_int1024_t, @function

add_uint1024_t:
    # %eax returns an integer carry
    xorl    %eax, %eax
    xorl    %r9d, %r9d
    incq    %r9

    # 64b 1
    xorl    %r10d, %r10d
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
    ret

   
add_int1024_t:
    # %eax returns an integer carry
    xorl    %r10d, %r10d
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
    xorl    %r10d, %eax     # %eax <- (last carry) ^ (second last carry) = overflow
    ret

sub_int1024_t:
sub_uint1024_t:

mult_int1024_t:
mult_uint1024_t:

#g_int1024_t:
#e_int1024_t:
