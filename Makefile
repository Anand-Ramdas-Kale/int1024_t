CFLAGS = -O3 -no-pie -ggdb -fsanitize=address -Wall -Wextra -Wpedantic
CC = gcc

main: main.o conv.o core.o io.o add.o mul.o shl.o complement.o adjust_quad.o mul_by_10.o
	$(CC) $(CFLAGS) -o main main.o conv.o core.o add.o mul.o shl.o complement.o adjust_quad.o mul_by_10.o io.o

main.o: main.c bigint.h
	$(CC) $(CFLAGS) -c -o main.o main.c

conv.o: conv.c bigint.h
	$(CC) $(CFLAGS) -c -o conv.o conv.c

core.o: core.c bigint.h
	$(CC) $(CFLAGS) -c -o core.o core.c

io.o: io.c bigint.h
	$(CC) $(CFLAGS) -c -o io.o io.c

add.o: add.s
	$(CC) $(CFLAGS) -c -o add.o add.s

mul.o: mul.s
	$(CC) -no-pie -c -o mul.o mul.s

shl.o: shl.s
	$(CC) $(CFLAGS) -c -o shl.o shl.s

complement.o: complement.s
	$(CC) $(CFLAGS) -c -o complement.o complement.s

adjust_quad.o: adjust_quad.s
	$(CC) $(CFLAGS) -c -o adjust_quad.o adjust_quad.s

mul_by_10.o: mul_by_10.s
	$(CC) $(CFLAGS) -c -o mul_by_10.o mul_by_10.s
