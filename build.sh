
#!/bin/bash
# Author : Anand Ramdas Kale
# BT23CSE061
set -xe

# gcc -O0 -no-pie -ggdb -fsanitize=address,undefined -o test ./main.c ./io.c ./conv.c ./core.c ./add.s ./mul.s ./shl.s ./complement.s ./adjust_quad.s
# gcc -O3 -no-pie -ggdb -fsanitize=address -o test ./main.c ./t.c ./conv.c ./core.c ./add.s ./mul.s ./shl.s ./complement.s ./adjust_quad.s
# gcc -O0 -fno-inline -fno-builtin -fno-strict-aliasing -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-unroll-loops -fno-aggressive-loop-optimizations -g  -no-pie -ggdb -fsanitize=address -o test_mul_10 ./m10.c ./t.c ./conv.c ./core.c ./add.s ./mul.s ./shl.s ./complement.s ./adjust_quad.s ./mul_by_10.s

gcc -no-pie -ggdb -fsanitize=address -o main ./main.c ./io.c ./conv.c ./core.c ./add.s ./mul.s ./shl.s ./complement.s ./adjust_quad.s ./mul_by_10.s
