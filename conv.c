#include "./bigint.h"

void bin2bcd(void *raw, void *number)
{
    memset(raw, 0, 256);
    uint64_t *buffer = raw;
    uint64_t *num = (uint64_t *) number;
    num += 15;
    uint64_t testbit = LEFT_MOST_BIT;

    for (uint64_t k = 0; k < 16; ++k) {
        testbit = LEFT_MOST_BIT;
        for (uint64_t j = 0; j < 64; ++j) {
            for (uint64_t i = 0; i < 20; ++i) {
                adjust_quad(buffer + i);
            } 
            shift_left_bcd_1280_bits(buffer);
            if (((*num) & testbit) != 0) {
                buffer[0] |= 1ULL;
            }
            testbit >>= 1;
        }
        --num;
    }
    return;
}
