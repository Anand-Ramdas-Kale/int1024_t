#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

#define LEFT_MOST_BIT 0x8000000000000000ULL

#define UINT1024_MAX {                              \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, UINT64_MAX, \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, UINT64_MAX, \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, UINT64_MAX, \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, UINT64_MAX  \
}

#define UINT1024_MIN {      \
    0ULL, 0ULL, 0ULL, 0ULL, \                    
    0ULL, 0ULL, 0ULL, 0ULL, \
    0ULL, 0ULL, 0ULL, 0ULL, \
    0ULL, 0ULL, 0ULL, 0ULL  \
}

#define INT1024_MAX {                               \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, UINT64_MAX, \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, UINT64_MAX, \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, UINT64_MAX, \
    UINT64_MAX, UINT64_MAX, UINT64_MAX, INT64_MAX   \
}

#define INT1024_MIN {           \
    0ULL, 0ULL, 0ULL, 0ULL,     \                    
    0ULL, 0ULL, 0ULL, 0ULL,     \
    0ULL, 0ULL, 0ULL, 0ULL,     \
    0ULL, 0ULL, 0ULL, INT64_MIN \
}

// structure definition
typedef uint64_t int1024_t[16];
typedef uint64_t uint1024_t[16];
typedef uint64_t int2048_t[32];
typedef uint64_t uint2048_t[32];

// <<< assembly functions
int shift_left_bin_1024_bits(void *);
int shift_left_bcd_1280_bits(void *);

int adjust_quad(uint64_t *);
void bin2bcd(void *raw, void *number);

int add_uint1024_t(void *, void *);
int add_int1024_t(void *, void *);

int sub_int1024_t(void *, void *);              // we don't have unsigned sub for now

void mul_uint1024_t(void *s1, void *s2, void *dest);
void complement(void *);
// assembly functions >>> 

// <<< c wrappers --------------------------------------------------------------------------------------------
int1024_t *get_number();
void put_number(int1024_t* number);
void put_number_unsigned(uint1024_t* number);
bool add_signed(uint1024_t * source1, uint1024_t * source2AndDestination);
bool add_unsigned(int1024_t * source1, int1024_t * source2AndDestination);
bool sub_signed(int1024_t * source1, int1024_t * source2AndDestination);
uint1024_t *mul_unsigned(uint1024_t * source1, uint1024_t * source2);
int1024_t *mul_signed(int1024_t * source1, int1024_t * source2);
uint2048_t *mul_unsigned_2048bits(uint1024_t * source1, uint1024_t * source2);
void make_zero_1024_bits(void *);
void make_zero_1280_bits(void *);
void make_zero_2048_bits(void *);
void copy_1024_bits(void *source, void *desitination);
void copy_1280_bits(void *source, void *desitination);
void flush_stdin();
void print_bin(int1024_t *);
void print_hex(int1024_t *);
// -------------------------------------------------------------------------------------------- c wrappers >>>

