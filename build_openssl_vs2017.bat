@echo off

:: vcvars32.bat ::
set CWD=%~sdp0
cd /d "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build"
call vcvars32.bat
cd /d %CWD%

:: path ::
set path="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.12.25827\bin\Hostx86\x86";"C:\Program Files (x86)\NASM";"C:\Perl64\bin";%path%

perl Configure --release VC-WIN32 no-dso no-shared threads
perl -pi.bak -e "s/\/MT/\/MTd/gi" configdata.pm
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" configdata.pm
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" configdata.pm
perl -pi.bak -e "s/\"NDEBUG\",//gi" configdata.pm
perl -pi.bak -e "s/-DNDEBUG//gi" configdata.pm
perl -pi.bak -e "s/-DUNICODE//gi" configdata.pm
perl -pi.bak -e "s/-D_UNICODE//gi" configdata.pm
perl -pi.bak -e "s/-D\"UNICODE\"//gi" configdata.pm
perl -pi.bak -e "s/-D\"_UNICODE\"//gi" configdata.pm
perl -pi.bak -e "s/\"UNICODE\",//gi" configdata.pm
perl -pi.bak -e "s/\"_UNICODE\",//gi" configdata.pm
del /F /Q "configdata.pm.bak" > nul
perl -pi.bak -e "s/\/MT/\/MTd/gi" makefile
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" makefile
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" makefile
perl -pi.bak -e "s/\"NDEBUG\",//gi" makefile
perl -pi.bak -e "s/-DNDEBUG//gi" makefile
perl -pi.bak -e "s/-DUNICODE//gi" makefile
perl -pi.bak -e "s/-D_UNICODE//gi" makefile
perl -pi.bak -e "s/-D\"UNICODE\"//gi" makefile
perl -pi.bak -e "s/-D\"_UNICODE\"//gi" makefile
perl -pi.bak -e "s/\"UNICODE\",//gi" makefile
perl -pi.bak -e "s/\"_UNICODE\",//gi" makefile
del /F /Q "makefile.bak" > nul

nmake libclean
nmake clean
nmake distclean
perl Configure --release VC-WIN32 no-dso no-shared threads
perl -pi.bak -e "s/\/MT/\/MTd/gi" configdata.pm
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" configdata.pm
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" configdata.pm
perl -pi.bak -e "s/\"NDEBUG\",//gi" configdata.pm
perl -pi.bak -e "s/-DNDEBUG//gi" configdata.pm
perl -pi.bak -e "s/-DUNICODE//gi" configdata.pm
perl -pi.bak -e "s/-D_UNICODE//gi" configdata.pm
perl -pi.bak -e "s/-D\"UNICODE\"//gi" configdata.pm
perl -pi.bak -e "s/-D\"_UNICODE\"//gi" configdata.pm
perl -pi.bak -e "s/\"UNICODE\",//gi" configdata.pm
perl -pi.bak -e "s/\"_UNICODE\",//gi" configdata.pm
del /F /Q "configdata.pm.bak" > nul
perl -pi.bak -e "s/\/MT/\/MTd/gi" makefile
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" makefile
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" makefile
perl -pi.bak -e "s/\"NDEBUG\",//gi" makefile
perl -pi.bak -e "s/-DNDEBUG//gi" makefile
perl -pi.bak -e "s/-DUNICODE//gi" makefile
perl -pi.bak -e "s/-D_UNICODE//gi" makefile
perl -pi.bak -e "s/-D\"UNICODE\"//gi" makefile
perl -pi.bak -e "s/-D\"_UNICODE\"//gi" makefile
perl -pi.bak -e "s/\"UNICODE\",//gi" makefile
perl -pi.bak -e "s/\"_UNICODE\",//gi" makefile

del /F /Q "makefile.bak" > nul

nmake build_libs

