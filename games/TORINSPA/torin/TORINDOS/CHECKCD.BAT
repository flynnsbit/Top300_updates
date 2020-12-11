@echo off
if not "%0"=="CheckCD" goto Abort
if "%1"=="" goto Abort

echo Checking for Torin's Passage CD in drive %1:
if exist %1:\torin1. goto Exit
cls
echo Please put the Torin's Passage CD into your CD-ROM and then
jchoice

:LoopCheck
if exist %1:\torin1. goto Exit
echo.
echo Unable to detect the Torin's Passage CD in drive %1:.
echo You may abort this looping test by pressing Ctrl-C or
echo insert the CD into your CD-ROM and then
jchoice
goto LoopCheck

:Abort
echo.
echo This batch file is used automatically by
echo Torin's Passage. Please do not run it from
echo the DOS command line.
echo.

:Exit 

