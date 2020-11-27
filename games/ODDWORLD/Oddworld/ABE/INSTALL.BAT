@echo off

if "%1"!="" goto INPUT

mkdir C:\ABE

copy *.exe C:\ABE

copy *.dig C:\ABE
copy *.mdi C:\ABE
copy *.ad  C:\ABE
copy *.lst C:\ABE
copy *.bat C:\ABE
copy *.txt C:\ABE

attrib -r C:\ABE\*.*

echo .
echo Abe's Oddysee is now installed in C:\ABE
echo .
echo Type ABE and hit [enter] to play the DOS version.
echo    You should configure your sound card first by
echo    running SETSOUND.

C:
cd \ABE

GOTO BYEBYE:

:INPUT

if not exist abedos.exe goto NOCDROM

mkdir %1

copy *.exe %1

if not exist %1\abewin.exe goto NODESTDIR

copy *.dig %1
copy *.mdi %1
copy *.ad  %1
copy *.lst %1
copy *.bat %1
copy *.txt %1

attrib -r %1\*.*

echo .
echo Abe's Oddysee is now installed in %1
echo .
echo Type ABE and hit [enter] to play the DOS version.
echo    You should configure your sound card first by
echo    running SETSOUND.

cd %1
goto BYEBYE

:NOCDROM

echo The cd-rom directory containing ABEDOS.EXE should be the current directory.

goto BYEBYE

:NODESTDIR

echo The destination directory specified could not be made

goto BYEBYE

:BYEBYE
