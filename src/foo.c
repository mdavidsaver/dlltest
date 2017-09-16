#include "foo.h"

int internal(int x);

int _CCALL fn1(int x) { return x*2; }
int _STDCALL fn2(int x) { return x*3; }

int internal(int x) {
    return x+1;
}
