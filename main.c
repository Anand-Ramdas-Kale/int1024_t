// author : Anand Ramdas Kale 
// BT23CSE061
// i didn't get time to make main (and this was not the main aim, aim was to add support for int1024_t ... for TA) 

#include <unistd.h>
#include "./bigint.h"

int main()
{
    // multiplication
    int1024_t *a = get_number();
    int1024_t *b = get_number();
    int1024_t *c = mul_signed(a, b);
    put_number(a);
    put_number(b);
    if (c) {
        put_number(c);
    }
    free(a);
    free(b);
    free(c);
    return 0;
}

int main2()
{
    // representation
    int1024_t *a = calloc(1, sizeof(int1024_t));
    memset(a, -1, sizeof(int1024_t));
    put_number_unsigned(a);
    free(a);
    return 0;
}

int mai1n()
{
    // addition
    int1024_t *a = get_number();
    int1024_t *b = get_number();
    int1024_t c;
    memcpy(&c, b, 128);
    printf("a = ");
    put_number(a);
    printf("b = ");
    put_number(b);
    add_signed(a, b);
    printf("b = ");
    put_number(b);
    memcpy(&c, b, 128);
    
    memcpy(b, &c, 128);
    memcpy(b, &c, 128);
    free(a);
    free(b);
    return 0;
}

int main4()
{
    // complement
    int1024_t *a = get_number();
    put_number(a);
    put_number_unsigned(a);
    complement(a);
    put_number(a);
    free(a);
    return 0;
}

int main5()
{
    // subtraction
    int1024_t *a = get_number();
    int1024_t *b = get_number();
    printf("a = ");
    put_number(a);
    printf("b = ");
    put_number(b);
    add_signed(a, b);
    put_number(b);
    free(a);
    free(b);
    return 0;
}

int main6()
{
    int1024_t a = INT1024_MIN;
    put_number(&a);
    return 0;
}

int main0()
{
    int1024_t a = INT1024_MIN;
    put_number(&a);
    /*int1024_t *a = get_number();*/
    int1024_t *b = get_number();
    int1024_t *c = mul_signed(&a, b);
    print_hex(b);
    if (c) {
        put_number(c);
    }
    /*free(a);*/
    free(b);
    free(c);
    /*put_number(&a);*/
    return 0;
}
