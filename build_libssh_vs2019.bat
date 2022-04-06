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

cmake ../ -DCLIENT_TESTING:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=OFF -DCMAKE_CONFIGURATION_TYPES:STRING=Debug -DCMAKE_C_FLAGS_DEBUG:STRING="/MTd /Zi /Ob0 /Od /RTC1 /guard:cf" -DCMAKE_CXX_FLAGS_DEBUG:STRING="/MTd /Zi /Ob0 /Od /RTC1 /guard:cf" -DCMAKE_C_STANDARD_LIBRARIES:STRING="kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib Crypt32.lib" -DCMAKE_CXX_STANDARD_LIBRARIES:STRING="kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib Crypt32.lib" -DCMAKE_EXE_LINKER_FLAGS_DEBUG:STRING="/debug /INCREMENTAL:NO" -DWITH_ZLIB:BOOL=OFF -DCMAKE_CXX_STANDARD=17
perl -pi.bak -e "s/MultiByte/Unicode/gi" src\ssh.vcxproj
msbuild libssh.sln

cd %CWD%
