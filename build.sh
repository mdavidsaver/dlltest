#!/bin/sh
set -e -x

[ -f CMakeLists.txt ] || exit 1

install -d build
rm -rf build/*

install -d build/host
install -d build/w32
install -d build/w64
install -d build/test-host
install -d build/test-w32
install -d build/test-w64

cmake -S . -B build/host && cmake --build build/host -v --

cmake -S . -B build/w32 --toolchain toolchains/mingw32-cross.cmake && cmake --build build/w32 -v --

cmake -S . -B build/w64 --toolchain toolchains/mingw64-cross.cmake && cmake --build build/w64 -v --
