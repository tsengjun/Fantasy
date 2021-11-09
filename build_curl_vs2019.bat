@echo on

set CWD=%~sdp0
cd /d "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build"
call vcvars32.bat
cd %CWD%

set PATH="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.29.30133\bin\Hostx86\x86";"C:\Program Files\NASM";"C:\Strawberry\perl\bin";%PATH%
echo %PATH%

cd ../
call buildconf.bat
cd %CWD%

nmake /f Makefile.vc mode=static DEBUG=yes MACHINE=x86 GEN_PDB=yes RTLIBCFG=static

pause
