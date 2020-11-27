:menu
@echo off
cls
echo.
echo Press 1 for King's Quest III: To Heir is Human w/ PC Speaker
echo Press 2 for King's Quest III: To Heir is Human w/ Tandy
echo Press 3 to Quit
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto TANDY
if errorlevel = 1 goto PC

:pc
CONFIG -set "mididevice=default"
cls
@sierra
goto quit

:tandy
CONFIG -set "tandy=on"
cls
@sierra
goto quit

:quit
exit