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

FOO_EXPORT int _CCALL fn1(int);
FOO_EXPORT int _STDCALL fn2(int);

#endif
