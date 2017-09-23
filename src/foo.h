#ifndef FOO_H
#define FOO_H

#ifdef __cplusplus
extern "C" {
#endif

#ifndef _WIN32
#  define _CCALL
#  define _STDCALL
#  define FOO_EXPORT

#else
#  define _CCALL __cdecl
#  define _STDCALL __stdcall

#  ifdef foo_EXPORTS
#    define FOO_EXPORT __declspec(dllexport)

#  else
#    define FOO_EXPORT __declspec(dllimport)
#  endif
#endif

FOO_EXPORT int _CCALL fn1(int);
FOO_EXPORT int _STDCALL fn2(int);

#ifdef __cplusplus
}
#endif

#endif
