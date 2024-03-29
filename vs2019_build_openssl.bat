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

perl -pi.bak -e "s/disable\(\'static\',\s*\'pic\',\s*\'threads\'\)/disable\(\'pic\'\)/gi" Configure
perl -pi.bak -e "s/disable\(\"unavailable\",\s*\'threads\'\)/disable\(\"unavailable\"\)/gi" Configure

perl Configure --debug VC-WIN64A -static no-dso no-shared no-pic threads --prefix=%OPENSSL_ROOT_DIR%\build
perl -pi.bak -e "s/\/MT/\/MTd/gi" configdata.pm
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" configdata.pm
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" configdata.pm
perl -pi.bak -e "s/\"NDEBUG\",//gi" configdata.pm
perl -pi.bak -e "s/-DNDEBUG//gi" configdata.pm
del /F /Q "configdata.pm.bak" > nul
perl -pi.bak -e "s/\/MT/\/MTd/gi" makefile
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" makefile
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" makefile
perl -pi.bak -e "s/\"NDEBUG\",//gi" makefile
perl -pi.bak -e "s/-DNDEBUG//gi" makefile
del /F /Q "makefile.bak" > nul

nmake libclean
nmake clean
nmake distclean
perl Configure --debug VC-WIN64A -static no-dso no-shared no-pic threads --prefix=%OPENSSL_ROOT_DIR%\build
perl -pi.bak -e "s/\/MT/\/MTd/gi" configdata.pm
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" configdata.pm
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" configdata.pm
perl -pi.bak -e "s/\"NDEBUG\",//gi" configdata.pm
perl -pi.bak -e "s/-DNDEBUG//gi" configdata.pm
del /F /Q "configdata.pm.bak" > nul
perl -pi.bak -e "s/\/MT/\/MTd/gi" makefile
perl -pi.bak -e "s/\/O2/\/Od \/Ob0/gi" makefile
perl -pi.bak -e "s/-D\"NDEBUG\"//gi" makefile
perl -pi.bak -e "s/\"NDEBUG\",//gi" makefile
perl -pi.bak -e "s/-DNDEBUG//gi" makefile

del /F /Q "makefile.bak" > nul

nmake build_libs
nmake install_dev
