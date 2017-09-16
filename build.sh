#!/bin/sh
set -e -x

[ -f CMakeLists.txt ] || exit 1

rm -rf build-*

install -d build-host

(cd build-host && cmake .. && make VERBOSE=1)

install -d build-w32

(cd build-w32 && cmake -DCMAKE_TOOLCHAIN_FILE=../toolchains/mingw-cross.cmake .. && make VERBOSE=1)
