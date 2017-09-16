
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall" x86

if exist build goto cd
mkdir build
:cd
cd build

cmake -G "NMake Makefiles" ..

nmake

pause
