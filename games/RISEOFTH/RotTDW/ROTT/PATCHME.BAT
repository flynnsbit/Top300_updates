@echo off
if "%1"=="1" goto patch

:message
echo.
echo This batch file is a remnant of having patched an Apogee game
echo on your hard drive.  It serves no other purpose, and may be deleted.
echo Deleting this batch file will not affect your game whatsoever.
echo.
echo -- Apogee Technical Support
echo.
goto end

:patch
if not exist rott.exe goto nope
darkrtl.exe -o > nul
patch patch.rtp
if exist *.rot del *.rot
if exist patch.rtp del patch.rtp
if exist patch.exe del patch.exe
if exist darkrtl.exe del darkrtl.exe
if exist apogee.bat del apogee.bat
goto end

:nope
cls
echo Rise of the Triad Main Executable File was not found.  Please recheck the
echo directory that your registered copy of ROTT is installed to, and try
echo installing this patch again.
echo.
echo -- Apogee Technical Support
if exist patch.exe del patch.exe
if exist patch.rtp del patch.rtp
if exist darkrtl.exe del darkrtl.exe
if exist upgrade.txt del upgrade.txt

:end
