@echo on

set CWD=%~sdp0
cd /d "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build"
call vcvars64.bat
cd %CWD%

set PATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64";"C:\Program Files\NASM";"C:\Strawberry\perl\bin";%PATH%
echo %PATH%

call buildconf.bat

cd winbuild
nmake /f Makefile.vc mode=static DEBUG=yes MACHINE=x64 GEN_PDB=yes RTLIBCFG=static ENABLE_UNICODE=yes ENABLE_IPV6=no ENABLE_SSPI=no ENABLE_SCHANNEL=no
cd %CWD%

pause
