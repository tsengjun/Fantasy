@echo on

:: vcvars64.bat ::
set CWD=%~sdp0
cd /d "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build"
call vcvars64.bat
cd /d %CWD%

:: PATH ::
set PATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64";"C:\Program Files\NASM";"C:\Strawberry\perl\bin";%PATH%
echo %PATH%

rmdir /S /Q build
mkdir build

cd build

cmake ../ -DBUILD_EXAMPLES:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=OFF -DBUILD_TESTING:BOOL=OFF -DCLEAR_MEMORY:BOOL=ON -DCMAKE_CONFIGURATION_TYPES:STRING=Debug -DCMAKE_C_FLAGS_DEBUG:STRING="/MTd /Zi /Ob0 /Od /RTC1 /guard:cf" -DCRYPTO_BACKEND:STRING=OpenSSL -DENABLE_DEBUG_LOGGING:BOOL=OFF
perl -pi.bak -e "s/MultiByte/Unicode/gi" src\libssh2.vcxproj
msbuild libssh2.sln

cd %CWD%
