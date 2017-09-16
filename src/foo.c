#include "foo.h"

int internal(int x);

int fn1(int x) { return x*2; }

int internal(int x) {
    return x+1;
}

static
int secret(int x) {
    return x+2;
}
