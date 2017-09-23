
set PATH=%PATH%;C:\MinGW\bin

if exist build goto cd
mkdir build
:cd
cd build

cmake -G "MinGW Makefiles" ..

cmake --build .

pause
