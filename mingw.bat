
rem https://mingw-w64.org/doku.php/download/mingw-builds
set PATH=%PATH%;C:\Program Files\mingw-w64\x86_64-7.1.0-win32-seh-rt_v5-rev2\mingw64\bin

if exist build-mingw64 goto cd
mkdir build-mingw64
:cd
cd build-mingw64

cmake -G "MinGW Makefiles" ..

cmake --build .

pause
