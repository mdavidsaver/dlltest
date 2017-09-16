
echo %cd%
set

if "%APPVEYOR_BUILD_WORKER_IMAGE%"=="Visual Studio 2015" set VVERSION=14 2015
if "%PLATFORM%"=="x86" set ARCH=
if "%PLATFORM%"=="x64" set ARCH= Win64

echo "|Visual Studio %VVERSION%%ARCH%|"

cmake -G "Visual Studio %VVERSION%%ARCH%" .
