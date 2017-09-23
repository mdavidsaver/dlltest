rem run "cmake --help" and look at list of generator names

if exist build32 goto cd32
mkdir build32
:cd32
cd build32

cmake -G "Visual Studio 14 2015" ..

cd ..

if exist build64 goto cd64
mkdir build64
:cd64
cd build64

cmake -G "Visual Studio 14 2015 Win64" ..

cd ..

cmake --build build32 --config Debug
cmake --build build64 --config Debug

pause
