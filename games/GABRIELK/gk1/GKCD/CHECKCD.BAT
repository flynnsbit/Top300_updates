@echo off

rem * This batch file checks for the presence of the Gabriel Knight
rem * CD in the user's CD-ROM
rem * Greg Tomko-Pavia
rem * 12 November 93

if not "%0"=="CheckCD" goto Abort
if "%1"=="" goto Abort

echo Checking for Gabriel Knight CD in drive %1:
if exist %1:gkcheck.bat goto Exit
cls
echo Please put the Gabriel Knight CD into your CD-ROM and then
jchoice

:LoopCheck
if exist %1:gkcheck.bat goto Exit
echo.
echo Unable to detect the Gabriel Knight CD in drive %1:.
echo You may abort this looping test by pressing Ctrl-C or
echo insert the CD into your CD-ROM and then
jchoice
goto LoopCheck

:Abort
echo.
echo This batch file is used automatically by the Gabriel
echo Knight program. Please do not run it from the DOS
echo command line.
echo.

:Exit 

