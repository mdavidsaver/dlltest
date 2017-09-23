
rem Build library w/ mingw
rem link test executable w/ msvc

rem https://mingw-w64.org/doku.php/download/mingw-builds
set PATH=%PATH%;C:\Program Files\mingw-w64\x86_64-7.1.0-win32-seh-rt_v5-rev2\mingw64\bin

if exist build-lib goto cd
mkdir build-lib
:cd
cd build-lib

cmake -G "MinGW Makefiles" ..

cmake --build .

cd ..

if exist build-exe goto cd
mkdir build-exe
:cd
cd build-exe

cmake -G "Visual Studio 14 2015 Win64" ../test -DFOO_BIN="${CMAKE_CURRENT_BINARY_DIR}/../build-lib"

cmake --build .

pause
