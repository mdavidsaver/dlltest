
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall" x86

if exist build-nmae goto cd
mkdir build-nmae
:cd
cd build-nmake

cmake -G "NMake Makefiles" ..

nmake

pause
