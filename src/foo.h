#ifndef FOO_H
#define FOO_H

#ifdef __cplusplus
extern "C" {
#endif

#if defined(_WIN32)

#  define _CCALL __cdecl
#  define _STDCALL __stdcall

#  ifdef BUILDING_FOO
#    define FOO_EXPORT __declspec(dllexport)
#  else
#    define FOO_EXPORT __declspec(dllimport)
#  endif

#elif __GNUC__ >= 4

#  define _CCALL
#  define _STDCALL
#  define FOO_EXPORT __attribute__ ((visibility("default")))

#else

#  define _CCALL
#  define _STDCALL
#  define FOO_EXPORT

#endif

FOO_EXPORT int _CCALL fn1(int);
FOO_EXPORT int _STDCALL fn2(int);

#ifdef __cplusplus
}
#endif

#endif
