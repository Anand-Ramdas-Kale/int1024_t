#include "./bigint.h"

bool add_signed(int1024_t * source1, int1024_t * source2AndDestination)
{
    bool perform = true;
    int overflow = add_int1024_t(source1, source2AndDestination);
    if (overflow) {
        printf("OVERFLOW: addition result could not be represented as int1024_t\n");
        perform = false;
    }
    return perform;
}

bool add_unsigned(uint1024_t * source1, uint1024_t * source2AndDestination)
{
    bool perform = true;
    int overflow = add_uint1024_t(source1, source2AndDestination);
    if (overflow) {
        printf("OVERFLOW: addition result could not be represented as uint1024_t\n");
        perform = false;
    }
    return perform;
}

bool sub_signed(int1024_t * source1, int1024_t * source2AndDestination)
{
    bool perform = true;
    complement(source1);
    int overflow = add_int1024_t(source1, source2AndDestination);
    if (overflow) {
        printf("OVERFLOW: subtraction result could not be represented as int1024_t\n");
        perform = false;
    }
    complement(source1);
    return perform;
}

uint1024_t *mul_unsigned(uint1024_t * source1, uint1024_t * source2)
{
    void *result;
    uint2048_t *main_buffer = calloc(1, sizeof(uint2048_t));
    mul_uint1024_t(source1, source2, main_buffer);
    int overflow = 0;
    for (int i = 31; i > 15; --i) {
        if (*((uint64_t *)main_buffer + i) != 0) {
            ++overflow;
        }
    }
    if (overflow) {
        printf("OVERFLOW: multiplication result could not be represented as uint1024_t\n");
        result = NULL;
    }
    else {
        result = malloc(sizeof(uint1024_t));
        for (int i = 0; i < 16; ++i) {
            *((uint64_t *)result + i) = *((uint64_t *)main_buffer + i);
        }
    }
    free(main_buffer);
    return (uint1024_t *)result;
}

int1024_t *mul_signed(int1024_t * source1, int1024_t * source2)
{
    bool s1, s2;
    s1 = s2 = false;
    uint64_t bit = LEFT_MOST_BIT;
    if (((((uint64_t *)source1)[15]) & bit) != 0) {
        complement(source1);
        s1 = true;
    }
    if (((((uint64_t *)source2)[15]) & bit) != 0) {
        complement(source2);
        s2 = true;
    }
    int1024_t *result = mul_unsigned(source1, source2);   
    if (result && s1 != s2) {
        complement(result);
    }
    if (s1) {
        complement(source1);
    }
    if (s2) {
        complement(source2);
    }
    return (int1024_t *)result;
}

uint2048_t *mul_unsigned_2048bits(uint1024_t * source1, uint1024_t * source2)
{
    uint2048_t *main_buffer = calloc(1, sizeof(uint2048_t));
    mul_uint1024_t(source1, source2, main_buffer);
    return main_buffer;
}

void make_zero_1024_bits(void *ptr)
{
    memset(ptr, 0, 1024/8);   
}

void make_zero_1280_bits(void *ptr)
{
    memset(ptr, 0, 1280/8);
}

void make_zero_2048_bits(void *ptr)
{
    memset(ptr, 0, 2048/8);
}

void print_bin(int1024_t *a)
{
    uint64_t testbit = LEFT_MOST_BIT;
    uint64_t *arr = (uint64_t *)a;
    uint64_t current;
    for (int i = 15; i >= 0; --i) {
        testbit = LEFT_MOST_BIT;
        current = arr[i];
        for (int j = 0; j < 64; ++j) {
            if ((testbit & current) != 0) {
                printf("1");
            }
            else {
                printf("0");
            }
            testbit >>= 1;
        }   
    }
    printf("\n\n");
}

void print_hex(int1024_t *a)
{
    uint64_t *arr = (uint64_t *)a;
    uint64_t current;
    int index = 15;
    printf("0x");
    while (index > 0 && arr[index] == 0) --index;
    while (index >= 0) {
        printf("%016lx", arr[index--]);
    }
    printf("\n\n");
}
