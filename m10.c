#include "./bigint.h"

int mul_by_10(int1024_t *);

int main()
{
    int1024_t a = {
        INT_MAX, 0, 0, 0,
        0, 0, 0, 0,
        0, 0, 0, 0,
        0, 0, 0, 0,
    };
    /*int1024_t c = {*/
    /*    45, 0, 0, 0,*/
    /*    0, 0, 0, 0,*/
    /*    0, 0, 0, 0,*/
    /*    0, 0, 0, 0*/
    /*};*/
    int overflow = mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    put_number(&a);
    put_number(&a);
    put_number(&a);
    put_number(&a);
    overflow += mul_by_10(&a);
    put_number(&a);
    overflow += mul_by_10(&a);
    put_number(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    overflow += mul_by_10(&a);
    put_number(&a);
    overflow += mul_by_10(&a);
    put_number(&a);
    overflow += mul_by_10(&a);
    put_number(&a);
    /*free(a);*/
    return 0;
}
