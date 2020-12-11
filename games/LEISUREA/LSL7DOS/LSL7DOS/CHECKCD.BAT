@echo off
if not "%0"=="CheckCD" goto Abort
if "%1"=="" goto Abort

echo Checking for Larry 7 CD in drive %1:
if exist %1:\install\l7check.bat goto Exit
cls
echo Please put the Larry 7 CD into your CD-ROM and then
jchoice

:LoopCheck
if exist %1:l7check.bat goto Exit
echo.
echo Unable to detect the Larry 7 CD in drive %1:.
echo You may abort this looping test by pressing Ctrl-C or
echo insert the CD into your CD-ROM and then
jchoice
goto LoopCheck

:Abort
echo.
echo This batch file is used automatically by the Larry
echo 7 program. Please do not run it from the DOS
echo command line.
echo.

:Exit 

