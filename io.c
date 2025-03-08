#include "./bigint.h"

int1024_t *get_number()
{
    int1024_t *a = calloc(1, sizeof(int1024_t));
    int1024_t *b = calloc(1, sizeof(int1024_t));
    int1024_t *temp = malloc(sizeof(int1024_t));
    bool complement_flag = false;
    char *numberString = malloc(310 * sizeof(char));
    scanf("%s", numberString);
    void *to_free = numberString;
    if (*numberString == '-') {
        complement_flag = true;
        numberString++;
    }
    else if (*numberString == '+') {
        numberString++;
    }
    uint64_t i = 0;
    uint64_t digit;
    int overflow = 0;
    while (numberString[i]) {
        overflow += shift_left_bin_1024_bits(b);
        memcpy(temp, b, 128);
        overflow += shift_left_bin_1024_bits(b);
        overflow += shift_left_bin_1024_bits(b);
        overflow += add_uint1024_t(temp, b);
        digit = numberString[i] - '0';
        (*a)[0] = digit;
        overflow += add_uint1024_t(a, b);
        ++i;
    }
    if (overflow) {
        printf("cannot be represented as uint1024_t\n");
    }
    if (complement_flag) {
        complement(b);
    }
    free(to_free);
    free(a);
    free(temp);
    return b;
}


void put_number(int1024_t* number)
{
    bool complement_flag = false;
    int2048_t *buffer = calloc(1, sizeof(int2048_t));
    uint64_t bit = LEFT_MOST_BIT;
    if (((((uint64_t *)number)[15]) & bit) != 0) {
        complement(number);
        complement_flag = true;
    }
    bin2bcd(buffer, number);
    int index = 19;
    if (complement_flag) {
        printf("-");
    }
    while (index > 0 && ((uint64_t *)buffer)[index] == 0) --index;
    printf("%lx", ((uint64_t *)buffer)[index--]);
    while (index >= 0) {
        printf("%016lx", ((uint64_t *)buffer)[index--]);
    }
    printf("\n\n");
    free(buffer);
    if (complement_flag) {
        complement(number);
    }
}

void put_number_unsigned(uint1024_t *number)
{
    int2048_t *buffer = calloc(1, sizeof(int2048_t));
    memset(buffer, 0, sizeof(int2048_t));
    bin2bcd(buffer, number);
    int index = 19;
    while (index > 0 && ((uint64_t *)buffer)[index] == 0) --index;
    printf("%lx", ((uint64_t *)buffer)[index--]);
    while (index >= 0) {
        printf("%016lx", ((uint64_t *)buffer)[index--]);
    }
    printf("\n\n");
    free(buffer);
}

void copy_1024_bits(void *source, void *desitination)
{
    memcpy(desitination, source, 128);
}
void copy_1280_bits(void *source, void *desitination)
{
    memcpy(desitination, source, 256);
}

void flush_stdin() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF); // Clear the input buffer
}
