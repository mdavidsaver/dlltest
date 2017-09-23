#!/bin/sh
set -e -x

[ -f CMakeLists.txt ] || exit 1

install -d build
rm -rf build

install -d build/host
install -d build/w32
install -d build/w64
install -d build/test-host
install -d build/test-w32
install -d build/test-w64

(cd build/host && cmake ../.. && make VERBOSE=1)

(cd build/test-host && cmake ../../test -DFOO_BIN:PATH=$PWD/../host && make VERBOSE=1)


(cd build/w32 && cmake -DCMAKE_TOOLCHAIN_FILE=../../toolchains/mingw32-cross.cmake ../.. && make VERBOSE=1)


(cd build/w64 && cmake -DCMAKE_TOOLCHAIN_FILE=../../toolchains/mingw64-cross.cmake ../.. && make VERBOSE=1)
