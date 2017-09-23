
#include <stdio.h>

#include "foo.h"

int main(int argc, char *argv[])
{
    printf("Start 2\n");
#ifdef _WIN64
    printf("WIN64\n");
#endif
    printf("fn1(%d) = %d\n", 5, fn1(5));
    printf("fn2(%d) = %d\n", 3, fn1(9));
    return 0;
}
