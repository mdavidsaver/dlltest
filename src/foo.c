#include "foo.h"

int internal(int x);

int fn1(int x) { return x*2; }
_STDCALL int fn2(int x) { return x*3; }

int internal(int x) {
    return x+1;
}
