#ifndef FOO_H
#define FOO_H

#ifndef _WIN32
#  define _CCALL
#  define _STDCALL
#else
#  define _CCALL __cdecl
#  define _STDCALL __stdcall
#endif

#include "foo_export.h"

FOO_EXPORT _CCALL int fn1(int);
FOO_EXPORT _STDCALL int fn2(int);

#endif
